# -*- coding: utf-8 -*-
import os
import shutil

import yaml

if __name__ == '__main__':

    app_dir = r"apps"
    if not os.path.exists(app_dir):
        print(f'[err] {app_dir} 不存在')
        exit(1)

    appstore_dir = r"appstore"
    if os.path.exists(appstore_dir):
        shutil.rmtree(appstore_dir)
    shutil.copytree(app_dir, appstore_dir)

    dockge_dir = r"dockge"
    if os.path.exists(dockge_dir):
        shutil.rmtree(dockge_dir)

    app_docker_compose_file = []
    for root, dirs, files in os.walk(appstore_dir):
        if 'docker-compose.yml' in files:
            app_docker_compose_file.append(os.path.join(root, 'docker-compose.yml'))

    for docker_compose_file in app_docker_compose_file:
        print(f'[info] Standardized processing: {docker_compose_file} ...')
        parent_dir = os.path.dirname(docker_compose_file)
        version = os.path.basename(os.path.dirname(docker_compose_file))
        app_name = os.path.basename(os.path.dirname(os.path.dirname(docker_compose_file)))
        with open(docker_compose_file, 'r', encoding='utf-8') as f:
            docker_compose = yaml.safe_load(f)
        services = docker_compose.get('services')
        for service_name, service in services.items():
            env_file = service.get('env_file')
            if env_file:
                if isinstance(env_file, list):
                    for i, file in enumerate(env_file):
                        if '${APP_ENV_FILE' in file:
                            env_file[i] = f'./envs/{app_name}.env'
                        elif '${ENV_FILE' in file:
                            env_file[i] = f'.env'
                        elif '${GLOBAL_ENV_FILE' in file:
                            env_file[i] = f'./envs/global.env'
                        else:
                            print('env_file', env_file)
                    docker_compose['services'][service_name]['env_file'] = env_file
            container_name = service.get('container_name')
            if container_name:
                docker_compose['services'][service_name]['container_name'] = container_name.replace('${CONTAINER_NAME}', app_name)
        with open(docker_compose_file, 'w', encoding='utf-8') as f:
            yaml.dump(docker_compose, f)
        print(f'[info] Standardized processing: {app_name} {version} {docker_compose_file} Done!')
        data_yml = os.path.join(parent_dir, 'data.yml')
        with open(data_yml, 'r', encoding='utf-8') as f:
            data = yaml.safe_load(f)
        form_fields = data['additionalProperties']['formFields']
        for form_field in form_fields:
            key_name = form_field.get('envKey')
            key_value = form_field.get('default')
            key_desc = form_field.get('labelZh')
            required = form_field.get('required')
            desc = f'# {key_desc}'
            if required:
                desc += ' [必填]'
            env_file = os.path.join(parent_dir, '.env')
            if not os.path.exists(env_file):
                with open(env_file, 'w', encoding='utf-8') as f:
                    f.write(f'{desc} \n')
                    f.write(f'{key_name}={key_value}\n\n')
            else:
                with open(os.path.join(parent_dir, '.env'), 'a', encoding='utf-8') as f:
                    f.write(f'{desc} \n')
                    f.write(f'{key_name}={key_value}\n\n')
        print(f'[info] Standardized processing: {app_name} {version} {data_yml} Done!')

        if os.path.exists(parent_dir):
            dockge_app_dir = os.path.join(dockge_dir, app_name)
            if os.path.exists(dockge_app_dir):
                dockge_version = version.replace('.', '_')
                dockge_app_dir = os.path.join(dockge_dir, f'{app_name}_{dockge_version}')
            shutil.copytree(parent_dir, dockge_app_dir, ignore=shutil.ignore_patterns('data.yml', 'scripts'))
            print(f'[info] Standardized processing: {app_name} {version} {parent_dir} Done!')

    print('Done!')
