-- 由于新增了管理员角色，所以酱默认创建的账号改为管理员角色
update user
set role = 3
where id = '1';

alter table user_account
    add plugin_id varchar(32) default '' not null comment '插件ID，只有uTools注册的才有';

alter table user_account
drop
key user_account_auth_method_auth_key_uindex;

alter table update_log
    add view_count int unsigned default 0 not null comment '浏览数量';

alter table update_log
    add like_count int unsigned default 0 not null comment '喜欢数量';

alter table update_log
    add reply_count int unsigned default 0 not null comment '评论数量';


create table update_log_reply
(
    id            varchar(32)                               not null
        primary key,

    is_delete     tinyint(1) unsigned default 0 not null comment '逻辑删除',
    create_id     varchar(32) default ''                    not null comment '创建人',
    create_time   datetime    default '1970-01-01 00:00:00' not null comment '创建时间',
    update_id     varchar(32) default ''                    not null comment '更新人',
    update_time   datetime    default '1970-01-01 00:00:00' not null comment '更新时间',

    plugin_id     varchar(32)                               not null default '' comment '插件ID',
    update_log_id varchar(32)                               not null default '' comment '博客ID',

    content       varchar(512)                              not null default '' comment '回复内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '博客评论表';

create table story
(
    id          varchar(32)                               not null
        primary key,

    is_delete   tinyint(1) unsigned default 0 not null comment '逻辑删除',
    create_id   varchar(32) default ''                    not null comment '创建人',
    create_time datetime    default '1970-01-01 00:00:00' not null comment '创建时间',
    update_id   varchar(32) default ''                    not null comment '更新人',
    update_time datetime    default '1970-01-01 00:00:00' not null comment '更新时间',

    plugin_id   varchar(32)                               not null default '' comment '插件ID',
    sort        int unsigned default 0 not null comment '排序',
    title       varchar(64) default ''                    not null comment '标题',
    content     longtext                                  not null comment '内容',
    view_count  int unsigned default 0 not null comment '浏览数',
    like_count  int unsigned default 0 not null comment '喜欢数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '我们的故事';

create table faq_group
(
    id          varchar(32)                                not null
        primary key,

    is_delete   tinyint(1) unsigned default 0 not null comment '逻辑删除',
    create_id   varchar(32)  default ''                    not null comment '创建人',
    create_time datetime     default '1970-01-01 00:00:00' not null comment '创建时间',
    update_id   varchar(32)  default ''                    not null comment '更新人',
    update_time datetime     default '1970-01-01 00:00:00' not null comment '更新时间',

    plugin_id   varchar(32)                                not null default '' comment '插件ID',
    title       varchar(256) default ''                    not null comment '分类标题',
    sort        int unsigned default 0 not null comment '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '常见问题-分类';

create table faq
(
    id            varchar(32)                                not null
        primary key,

    is_delete     tinyint(1) unsigned default 0 not null comment '逻辑删除',
    create_id     varchar(32)  default ''                    not null comment '创建人',
    create_time   datetime     default '1970-01-01 00:00:00' not null comment '创建时间',
    update_id     varchar(32)  default ''                    not null comment '更新人',
    update_time   datetime     default '1970-01-01 00:00:00' not null comment '更新时间',

    plugin_id     varchar(32)                                not null default '' comment '插件ID',
    group_id      varchar(32)  default ''                    not null comment '所属分类',

    title         varchar(256) default ''                    not null comment '分类标题',
    sort          int unsigned default 0 not null comment '排序',

    view_count    int unsigned default 0 not null comment '浏览数',
    like_count    int unsigned default 0 not null comment '喜欢数',
    no_like_count int unsigned default 0 not null comment '不喜欢数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '常见问题';

create table faq_content
(
    id        varchar(32) not null primary key,
    is_delete tinyint(1) unsigned not null default 0 comment '逻辑删除',
    content   longtext    not null comment '内容，Markdown，让前端去渲染'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '常见问题内容表';
