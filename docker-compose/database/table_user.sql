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

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
	uuid text primary key,
	name text not null,
	email name not null,
	roles int not null,
	created_at int default EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	modfied_at int default EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	deleted_at int default EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	online bool default true,
	deleted bool default false,
	nodeid serial not null,
	FOREIGN KEY (roles) REFERENCES roles (uuid)
)
