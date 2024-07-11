DROP TABLE IF EXISTS users_twofactorcode;
DROP TABLE IF EXISTS users_modfied_operation;
DROP TABLE IF EXISTS users_deleted_operation;
DROP TABLE IF EXISTS users;
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

CREATE TABLE IF NOT EXISTS users (
	uuid text primary key,
	name text not null,
	email name not null,
	roles INT not null,
	created_at INT default EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	modfied_at INT default EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	deleted_at INT default EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	online bool default true,
	deleted bool default false,
	nodeid serial not null,
	FOREIGN KEY (roles) REFERENCES roles (uuid)
);

CREATE TABLE IF NOT EXISTS users_modfied_operation (
	event_at INT not null,
	target text not null,
	operation_by text not null,
	FOREIGN KEY (target) REFERENCES users (uuid),
	FOREIGN KEY (operation_by) REFERENCES users (uuid)
);

CREATE TABLE IF NOT EXISTS users_deleted_operation (
	event_at INT not null,
	target text not null,
	operation_by text not null,
	FOREIGN KEY (target) REFERENCES users (uuid),
	FOREIGN KEY (operation_by) REFERENCES users (uuid)
);

CREATE TABLE IF NOT EXISTS users_twofactorcode (
	uuid text primary key,
	secret text not null,
	recovery json not null default '[]',
	trusted_source json not null default '[]',
	FOREIGN KEY (uuid) REFERENCES users (uuid)
);
