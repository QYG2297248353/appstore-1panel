create table user
(
    id              varchar(32) primary key,
    is_delete       tinyint(1) unsigned not null default 0 comment '逻辑删除',
    create_id       varchar(32)  not null default '' comment '创建人',
    create_time     datetime     not null default '1970-01-01 00:00:00' comment '创建时间',
    update_id       varchar(32)  not null default '' comment '更新人',
    update_time     datetime     not null default '1970-01-01 00:00:00' comment '更新时间',
    nickname        varchar(32)  not null default '' comment '昵称',
    avatar          varchar(255) not null default '' comment '头像',

    is_enable       tinyint(1) unsigned not null default 1 comment '是否启用',

    last_login_ip   varchar(64)  not null default '' comment '最后登录IP',
    last_login_time datetime     not null default '1970-01-01 00:00:00' comment '最后登录时间',

    role            tinyint unsigned not null default 0 comment '用户角色'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '用户表';

create table user_auth
(
    id          varchar(32) primary key comment '用户ID',
    is_delete   tinyint(1) unsigned not null default 0 comment '逻辑删除',
    create_id   varchar(32) not null default '' comment '创建人',
    create_time datetime    not null default '1970-01-01 00:00:00' comment '创建时间',
    update_id   varchar(32) not null default '' comment '更新人',
    update_time datetime    not null default '1970-01-01 00:00:00' comment '更新时间',
    password    varchar(64) not null comment '密码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '用户认证表';

create table user_account
(
    id          varchar(32)                                not null
        primary key,
    is_delete   tinyint(1) unsigned default 0 not null comment '逻辑删除',
    create_id   varchar(32)  default ''                    not null comment '创建人',
    create_time datetime     default '1970-01-01 00:00:00' not null comment '创建时间',
    update_id   varchar(32)  default ''                    not null comment '更新人',
    update_time datetime     default '1970-01-01 00:00:00' not null comment '更新时间',
    user_id     varchar(32)  default ''                    not null comment '用户ID',
    auth_method tinyint unsigned default 0 not null comment '认证方式',
    auth_key    varchar(128) default ''                    not null comment '认证key',
    auth_unique varchar(128) default ''                    not null comment '认证唯一值',
    plugin_id   varchar(32)  default ''                    not null comment '插件ID，只有uTools注册的才有'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '用户账号表';

create table user_notice
(
    id          varchar(32)                                not null
        primary key,
    is_delete   tinyint(1) unsigned default 0 not null comment '逻辑删除',
    create_id   varchar(32)  default ''                    not null comment '创建人',
    create_time datetime     default '1970-01-01 00:00:00' not null comment '创建时间',
    update_id   varchar(32)  default ''                    not null comment '更新人',
    update_time datetime     default '1970-01-01 00:00:00' not null comment '更新时间',
    platform    tinyint unsigned default 0 not null comment '平台',
    token       varchar(64)  default ''                    not null comment 'token',
    sign        varchar(128) default ''                    not null comment '签名，有些平台有，比如钉钉'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '用户通知表';

create table user_message
(
    id          varchar(32)                               not null
        primary key,
    is_delete   tinyint(1) unsigned default 0 not null comment '逻辑删除',
    create_id   varchar(32) default ''                    not null comment '创建人',
    create_time datetime    default '1970-01-01 00:00:00' not null comment '创建时间',
    update_id   varchar(32) default ''                    not null comment '更新人',
    update_time datetime    default '1970-01-01 00:00:00' not null comment '更新时间',
    setting     varchar(32) default ''                    not null comment '相关设置，默认关闭，1为打开'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '用户消息表';

create table user_message_notice
(
    id          varchar(32)                                not null
        primary key,

    is_delete   tinyint(1) unsigned default 0 not null comment '逻辑删除',
    create_id   varchar(32)  default ''                    not null comment '创建人',
    create_time datetime     default '1970-01-01 00:00:00' not null comment '创建时间',
    update_id   varchar(32)  default ''                    not null comment '更新人',
    update_time datetime     default '1970-01-01 00:00:00' not null comment '更新时间',

    user_id     varchar(32)  default ''                    not null comment '接收人',
    is_read     tinyint(1) unsigned default 0 not null comment '是否已读',

    title       varchar(128) default ''                    not null comment '标题',
    content     longtext                                   not null comment ' 内容',
    action      tinyint unsigned not null default 0 comment '动作',
    target      varchar(255) default ''                    not null comment '目标',
    type        tinyint unsigned default 0 not null comment '消息类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '用户消息通知表';

create table plugin
(
    id            varchar(32) primary key,
    is_delete     tinyint(1) unsigned not null default 0 comment '逻辑删除',
    create_id     varchar(32)  not null default '' comment '创建人',
    create_time   datetime     not null default '1970-01-01 00:00:00' comment '创建时间',
    update_id     varchar(32)  not null default '' comment '更新人',
    update_time   datetime     not null default '1970-01-01 00:00:00' comment '更新时间',
    is_archiving  tinyint(1) unsigned not null default 0 comment '是否已归档',
    cover         varchar(255) not null default '' comment '插件图标',
    name          varchar(32)  not null default '' comment '插件名称',
    description   varchar(255) not null default '' comment '插件描述',
    u_tools_id    varchar(32)  not null default '' comment 'uTools的插件ID',
    u_tools_token varchar(64)  not null default '' comment 'uTools的插token'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '插件';

create table plugin_field
(
    id          varchar(32) primary key,
    is_delete   tinyint(1) unsigned not null default 0 comment '逻辑删除',
    create_id   varchar(32) not null default '' comment '创建人',
    create_time datetime    not null default '1970-01-01 00:00:00' comment '创建时间',
    update_id   varchar(32) not null default '' comment '更新人',
    update_time datetime    not null default '1970-01-01 00:00:00' comment '更新时间',
    plugin_id   varchar(32) not null default '' comment '插件ID',
    field       varchar(32) not null default '' comment '字段',
    required    tinyint(1) unsigned not null default 0 comment '是否是必要的'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '插件字段';

create table plugin_user
(
    id          varchar(32) primary key,
    is_delete   tinyint(1) unsigned not null default 0 comment '逻辑删除',
    create_id   varchar(32) not null default '' comment '创建人',
    create_time datetime    not null default '1970-01-01 00:00:00' comment '创建时间',
    plugin_id   varchar(32) not null default '' comment '插件ID',
    user_id     varchar(32) not null default '' comment '用户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '插件用户表';

create table feedback
(
    id          varchar(32) primary key,

    is_delete   tinyint(1) unsigned not null default 0 comment '逻辑删除',
    create_id   varchar(32) not null default '' comment '创建人',
    create_time datetime    not null default '1970-01-01 00:00:00' comment '创建时间',
    update_id   varchar(32) not null default '' comment '更新人',
    update_time datetime    not null default '1970-01-01 00:00:00' comment '更新时间',

    plugin_id   varchar(32) not null default '' comment '插件ID',

    is_good     tinyint(1) unsigned not null default 0 comment '是否是好问题',
    is_top      tinyint(1) unsigned not null default 0 comment '是否置顶',
    is_hidden   tinyint(1) unsigned not null default 0 comment '是否隐藏',

    is_reply    tinyint(1) unsigned not null default 0 comment '管理员是否回复',
    is_close    tinyint(1) unsigned not null default 0 comment '是否关闭',

    reply_count int unsigned not null default 0 comment '回复数量',
    like_count  int unsigned not null default 0 comment '喜欢数量',

    type        tinyint(1) unsigned not null default 0 comment '反馈类型'

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '反馈表';

create table feedback_info
(
    id         varchar(32)  not null primary key comment '反馈ID',
    is_delete  tinyint(1) unsigned not null default 0 comment '逻辑删除',
    user_agent varchar(256) not null default '' comment 'user-agent',
    ip         varchar(128) not null default '' comment '反馈者IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '反馈信息表';

create table feedback_field
(
    id                 varchar(32) primary key,
    is_delete          tinyint(1) unsigned not null default 0 comment '逻辑删除',
    plugin_id          varchar(32) not null default '' comment '插件ID',
    feedback_id        varchar(32) not null default '' comment '反馈ID',
    plugin_field_id    varchar(32) not null default '' comment '插件字段ID',
    plugin_field_key   varchar(32) not null default '' comment '插件字段',
    plugin_field_value varchar(32) not null default '' comment '插件字段值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '反馈字段';

create table feedback_content
(
    id        varchar(32) not null primary key,
    is_delete tinyint(1) unsigned not null default 0 comment '逻辑删除',
    content   longtext    not null comment '内容，Markdown，让前端去渲染'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '反馈内容表';

create table feedback_like
(
    id          varchar(32) primary key,
    is_delete   tinyint(1) unsigned not null default 0 comment '逻辑删除',
    create_id   varchar(32) not null default '' comment '创建人',
    create_time datetime    not null default '1970-01-01 00:00:00' comment '创建时间',

    plugin_id   varchar(32) not null default '' comment '插件ID',
    feedback_id varchar(32) not null default '' comment '反馈ID',
    constraint create_id_feedback_id
        unique (create_id, feedback_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '反馈喜欢表';

create table reply
(
    id          varchar(32) primary key,

    is_delete   tinyint(1) unsigned not null default 0 comment '逻辑删除',
    create_id   varchar(32) not null default '' comment '创建人',
    create_time datetime    not null default '1970-01-01 00:00:00' comment '创建时间',
    update_id   varchar(32) not null default '' comment '更新人',
    update_time datetime    not null default '1970-01-01 00:00:00' comment '更新时间',

    plugin_id   varchar(32) not null default '' comment '插件ID',
    feedback_id varchar(32) not null default '' comment '反馈ID',
    parent_id   varchar(32) not null default '' comment '父级回复ID',

    like_count  int unsigned not null default 0 comment '喜欢人数'

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '回复表';


create table reply_content
(
    id        varchar(32) primary key,
    is_delete tinyint(1) unsigned not null default 0 comment '逻辑删除',
    content   longtext not null comment '内容，Markdown，让前端去渲染'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '回复内容表';

create table reply_like
(
    id          varchar(32) primary key,

    is_delete   tinyint(1) unsigned not null default 0 comment '逻辑删除',
    create_id   varchar(32) not null default '' comment '创建人',
    create_time datetime    not null default '1970-01-01 00:00:00' comment '创建时间',

    plugin_id   varchar(32) not null default '' comment '插件ID',
    feedback_id varchar(32) not null default '' comment '反馈ID',
    reply_id    varchar(32) not null default '' comment '回复ID',
    constraint create_id_reply_id
        unique (create_id, reply_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '反馈喜欢表';

create table blog
(
    id            varchar(32)                                not null
        primary key,

    is_delete     tinyint(1) unsigned default 0 not null comment '逻辑删除',
    create_id     varchar(32)  default ''                    not null comment '创建人',
    create_time   datetime     default '1970-01-01 00:00:00' not null comment '创建时间',
    update_id     varchar(32)  default ''                    not null comment '更新人',
    update_time   datetime     default '1970-01-01 00:00:00' not null comment '更新时间',

    plugin_id     varchar(32)  default ''                    not null comment '插件ID',

    title         varchar(32)  default ''                    not null comment '标题',
    description   varchar(128) default ''                    not null comment '描述',

    view_count    int unsigned default 0 not null comment '阅读数量',
    like_count    int unsigned default 0 not null comment '喜欢数量',
    comment_count int unsigned default 0 not null comment '评论数量'
) comment '博客表';

create table blog_content
(
    id        varchar(32) primary key,
    is_delete tinyint(1) unsigned not null default 0 comment '逻辑删除',
    content   longtext not null comment '内容，Markdown，让前端去渲染'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '博客内容表';

create table blog_like
(
    id          varchar(32) primary key,
    is_delete   tinyint(1) unsigned not null default 0 comment '逻辑删除',
    create_id   varchar(32) not null default '' comment '创建人',
    create_time datetime    not null default '1970-01-01 00:00:00' comment '创建时间',

    blog_id     varchar(32) not null default '' comment '博客ID',
    constraint create_id_blog_id
        unique (create_id, blog_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '博客喜欢表';

create table blog_reply
(
    id          varchar(32)  not null
        primary key,

    is_delete   tinyint(1) unsigned default 0 not null comment '逻辑删除',
    create_id   varchar(32)           default '' not null comment '创建人',
    create_time datetime              default '1970-01-01 00:00:00' not null comment '创建时间',
    update_id   varchar(32)           default '' not null comment '更新人',
    update_time datetime              default '1970-01-01 00:00:00' not null comment '更新时间',

    plugin_id   varchar(32)  not null default '' comment '插件ID',
    blog_id     varchar(32)  not null default '' comment '博客ID',
    parent_id   varchar(32)  not null default '' comment '父级回复ID',

    content     varchar(128) not null default '' comment '回复内容'

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '博客评论表';

create table update_log
(
    id           varchar(32)                               not null
        primary key,

    is_delete    tinyint(1) unsigned default 0 not null comment '逻辑删除',
    create_id    varchar(32) default ''                    not null comment '创建人',
    create_time  datetime    default '1970-01-01 00:00:00' not null comment '创建时间',
    update_id    varchar(32) default ''                    not null comment '更新人',
    update_time  datetime    default '1970-01-01 00:00:00' not null comment '更新时间',

    plugin_id    varchar(32) default ''                    not null comment '插件ID',

    version      varchar(32) default ''                    not null comment '版本',
    publish_date date        default '1970-01-01'          not null comment '发布日期',


    view_count   int unsigned default 0 not null comment '浏览数量',
    like_count   int unsigned default 0 not null comment '喜欢数量',
    reply_count  int unsigned default 0 not null comment '评论数量'
) comment '更新日志表';

create table update_log_content
(
    id        varchar(32) primary key,
    is_delete tinyint(1) unsigned not null default 0 comment '逻辑删除',
    content   longtext not null comment '内容，Markdown，让前端去渲染'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '更新日志内容表';

create table update_log_thank
(
    id            varchar(32) primary key,
    is_delete     tinyint(1) unsigned not null default 0 comment '逻辑删除',
    create_id     varchar(32) not null default '' comment '创建人',
    create_time   datetime    not null default '1970-01-01 00:00:00' comment '创建时间',

    update_log_id varchar(32) not null default '' comment '更新日志ID',

    thank_id      varchar(32) not null default '' comment '感谢的人ID',

    constraint create_id_update_log_id_thank_id
        unique (create_id, update_log_id, thank_id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '更新日志感谢表';

create table update_log_like
(
    id            varchar(32) primary key,
    is_delete     tinyint(1) unsigned not null default 0 comment '逻辑删除',
    create_id     varchar(32) not null default '' comment '创建人',
    create_time   datetime    not null default '1970-01-01 00:00:00' comment '创建时间',

    update_log_id varchar(32) not null default '' comment '更新日志ID',
    constraint create_id_update_log_id
        unique (create_id, update_log_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci comment '更新日志喜欢表';

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

insert into user(id, nickname, role) value ('1', '管理员', 3);
insert into user_message(id) value ('1');
insert into user_notice(id) value ('1');
insert into user_account(id, user_id, auth_method, auth_key) value ('1', '1', 1, 'admin');
insert into user_auth(id, password) value ('1', '$2a$10$.JgPHRytWSeCMftQTkYxKugvWUseEqRf6ZlPHlVMHEg4n9vLZ8icq');
