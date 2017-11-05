DROP SCHEMA IF EXISTS linux_users;

CREATE SCHEMA linux_users;

USE linux_users;

CREATE TABLE user(
    username VARCHAR(20), -- Primary Key
    pathHome VARCHAR(50),
    shell VARCHAR(20),
    fullName VARCHAR(40)
)ENGINE=InnoDB;

CREATE TABLE group(
    user VARCHAR(20), -- Primary Key
    groupName VARCHAR(20)
)ENGINE=InnoDB;
