# process_renovate_prs.py
import os
import re
import time
import requests
from typing import Optional, Dict, Any

# 从环境变量获取GitHub token和仓库信息
GITHUB_TOKEN = os.getenv('GITHUB_TOKEN')
REPOSITORY = os.getenv('GITHUB_REPOSITORY')
HEADERS = {
    'Authorization': f'Bearer {GITHUB_TOKEN}',
    'Accept': 'application/vnd.github.v3+json',
    'X-GitHub-Api-Version': '2022-11-28'
}

def get_prs() -> list:
    """获取所有打开的PR列表"""
    url = f'https://api.github.com/repos/{REPOSITORY}/pulls?state=open'
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    return response.json()

def is_renovate_pr(pr: Dict[str, Any]) -> bool:
    """检查PR是否来自Renovate"""
    author = pr.get('user', {}).get('login', '').lower()
    return 'renovate' in author or 'mend' in author

def parse_version_update(pr_body: str) -> Optional[str]:
    """解析PR正文，确定更新类型"""
    # 匹配版本更新行
    pattern = r'^\s*([^\s]+)\s+([^\s]+)\s+([^\s]+)\s*->\s*([^\s]+)'
    lines = pr_body.split('\n')
    
    for line in lines:
        match = re.search(pattern, line)
        if match:
            package, update_type, old_version, new_version = match.groups()
            
            # 确定更新类型
            if update_type.lower() == 'major':
                return 'major'
            elif update_type.lower() in ['minor', 'patch']:
                return update_type.lower()
            
            # 如果没有明确类型，通过版本号分析
            old_parts = old_version.split('.')
            new_parts = new_version.split('.')
            
            if len(old_parts) > 0 and len(new_parts) > 0:
                if old_parts[0] != new_parts[0]:
                    return 'major'
                elif len(old_parts) > 1 and len(new_parts) > 1 and old_parts[1] != new_parts[1]:
                    return 'minor'
                else:
                    return 'patch'
    
    return None

def is_pr_mergeable(pr_number: int) -> bool:
    """检查PR是否可以合并"""
    url = f'https://api.github.com/repos/{REPOSITORY}/pulls/{pr_number}'
    response = requests.get(url, headers=HEADERS)
    response.raise_for_status()
    pr_data = response.json()
    
    # 检查合并状态
    return pr_data.get('mergeable', False) and pr_data.get('mergeable_state', '') == 'clean'

def wait_for_checks(pr_number: int, max_wait: int = 600) -> bool:
    """等待检查通过，最多等待max_wait秒"""
    start_time = time.time()
    
    while time.time() - start_time < max_wait:
        if is_pr_mergeable(pr_number):
            return True
        
        # 等待30秒后再次检查
        time.sleep(30)
    
    return False

def merge_pr(pr_number: int) -> bool:
    """合并PR"""
    url = f'https://api.github.com/repos/{REPOSITORY}/pulls/{pr_number}/merge'
    data = {
        'merge_method': 'merge'
    }
    response = requests.put(url, headers=HEADERS, json=data)
    
    if response.status_code == 200:
        print(f"成功合并PR #{pr_number}")
        return True
    else:
        print(f"合并PR #{pr_number} 失败: {response.json().get('message', '未知错误')}")
        return False

def add_comment(pr_number: int, comment: str):
    """在PR上添加评论"""
    url = f'https://api.github.com/repos/{REPOSITORY}/issues/{pr_number}/comments'
    data = {'body': comment}
    response = requests.post(url, headers=HEADERS, json=data)
    response.raise_for_status()

def process_pr(pr: Dict[str, Any]):
    """处理单个PR"""
    pr_number = pr['number']
    pr_author = pr['user']['login']
    pr_title = pr['title']
    pr_body = pr.get('body', '')
    
    print(f"处理PR #{pr_number} 来自 {pr_author}: {pr_title}")
    
    # 解析更新类型
    update_type = parse_version_update(pr_body)
    
    if not update_type:
        print(f"无法确定PR #{pr_number} 的更新类型，跳过")
        add_comment(pr_number, "⚠️ 自动处理失败: 无法确定更新类型")
        return
    
    print(f"PR #{pr_number} 更新类型: {update_type}")
    
    # 如果是大版本更新，跳过
    if update_type == 'major':
        print(f"PR #{pr_number} 是大版本更新，跳过")
        add_comment(pr_number, "⏭️ 自动跳过: 大版本更新需要手动审核")
        return
    
    # 检查PR是否可以合并
    if not wait_for_checks(pr_number):
        print(f"PR #{pr_number} 在等待时间内未通过检查，跳过")
        add_comment(pr_number, "⏰ 自动跳过: 在等待时间内未通过所有检查")
        return
    
    # 尝试合并PR
    if merge_pr(pr_number):
        add_comment(pr_number, "✅ 自动合并: 小版本更新已自动合并")
    else:
        add_comment(pr_number, "❌ 自动合并失败: 请手动处理")

def main():
    """主函数"""
    try:
        # 获取所有PR
        prs = get_prs()
        print(f"找到 {len(prs)} 个打开的PR")
        
        # 筛选Renovate的PR
        renovate_prs = [pr for pr in prs if is_renovate_pr(pr)]
        print(f"找到 {len(renovate_prs)} 个Renovate/Mend的PR")
        
        # 处理每个PR
        for pr in renovate_prs:
            try:
                process_pr(pr)
            except Exception as e:
                print(f"处理PR #{pr['number']} 时出错: {str(e)}")
                # 继续处理下一个PR
        
    except Exception as e:
        print(f"处理PR时发生错误: {str(e)}")
        raise

if __name__ == '__main__':
    main()
