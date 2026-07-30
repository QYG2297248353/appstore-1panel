drop table if exists favourites;

drop table if exists categories;

drop table if exists history;

drop table if exists manga_tags;

drop table if exists manga;

drop table if exists tags;

drop table if exists users;

create table manga
(
    id              bigint       not null,
    title           varchar(84)  not null,
    alt_title       varchar(84)  null,
    url             varchar(255) not null,
    public_url      varchar(255) not null,
    rating          float        not null,
    content_rating  char(12)     null,
    cover_url       varchar(255) not null,
    large_cover_url varchar(255) null,
    state           char(12)     null,
    author          varchar(64)  null,
    source          varchar(32)  not null,
    primary key (id)
);

create table tags
(
    id     bigint      not null,
    title  varchar(64) not null,
    `key`  varchar(120) not null,
    source varchar(32) not null,
    primary key (id)
);

create table manga_tags
(
    manga_id bigint not null,
    tag_id   bigint not null,
    primary key (manga_id, tag_id),
    constraint manga_tags_ibfk_1
        foreign key (tag_id) references tags (id),
    constraint manga_tags_ibfk_2
        foreign key (manga_id) references manga (id)
            on delete cascade
);

create index tag_id
    on manga_tags (tag_id);

create table users
(
    id                        int auto_increment
        primary key,
    email                     varchar(120) not null,
    password                  char(32) not null,
    nickname                  varchar(84) null,
    favourites_sync_timestamp bigint   null,
    history_sync_timestamp    bigint   null
);

create table categories
(
    id          bigint       not null,
    created_at  bigint	     not null,
    sort_key    int          not null,
    title       varchar(120) not null,
    `order`     char(16)     not null,
    user_id     int          not null,
    track       tinyint(1) 	 not null,
    show_in_lib tinyint(1)   not null,
    deleted_at  bigint		 not null,
    primary key (id, user_id),
    constraint categories_ibfk_1
        foreign key (user_id) references users (id)
            on delete cascade
);

create index categories_id_index
    on categories (id);

create table favourites
(
    manga_id    bigint     not null,
    category_id bigint     not null,
    sort_key    int        not null,
    pinned 		tinyint(1) not null,
    created_at  bigint     not null,
	deleted_at  bigint	   not null,
    user_id     int        not null,
    primary key (manga_id, category_id, user_id),
    constraint favourites_categories_id_pk
        foreign key (category_id, user_id) references categories (id, user_id),
    constraint favourites_ibfk_1
        foreign key (manga_id) references manga (id),
    constraint favourites_ibfk_2
        foreign key (user_id) references users (id)
);

create index user_id
    on favourites (user_id);

create table history
(
    manga_id   bigint     not null,
    created_at bigint     not null,
    updated_at bigint     not null,
    chapter_id bigint     not null,
    page       smallint   not null,
    scroll     double     not null,
    percent    double     not null,
    chapters   int		  not null,
	deleted_at bigint	  not null,
    user_id    int        not null,
    primary key (user_id, manga_id),
    constraint history_ibfk_1
        foreign key (manga_id) references manga (id),
    constraint history_ibfk_2
        foreign key (user_id) references users (id)
            on delete cascade
);

create index manga_id
    on history (manga_id);

create unique index users_email_uindex
    on users (email);


