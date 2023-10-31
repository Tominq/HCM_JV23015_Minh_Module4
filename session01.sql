create schema session01 collate utf8_general_ci;
create table class
(
    id   int auto_increment
        primary key,
    name varchar(255) not null
);
create table teacher
(
    id      int auto_increment
        primary key,
    name    varchar(255) not null,
    age     int          not null,
    country varchar(255) null
);
