DROP TABLE IF EXISTS roles;
CREATE TABLE IF NOT EXISTS roles (
    "uuid" INT primary key,
    "name" text not null,
    "desc" text not null
);

INSERT INTO roles VALUES
    (0, '', ''),
    (1, '', ''),
    (2, '', ''),
    (3, '', ''),
    (4, '', ''),
    (5, '', ''),
    (6, '', ''),
    (7, '', ''),
    (8, '', ''),
    (9, '', ''),
    (10, '', ''),
    (11, '', ''),
    (12, '', ''),
    (13, '', ''),
    (14, '', ''),
    (15, 'privilege', 'Privilege permission');
