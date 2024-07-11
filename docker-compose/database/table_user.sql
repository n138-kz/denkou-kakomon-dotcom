DROP TABLE IF EXISTS users_twofactorcode;
DROP TABLE IF EXISTS users_modfied_operation;
DROP TABLE IF EXISTS users_deleted_operation;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;

CREATE TABLE IF NOT EXISTS roles (
    "uuid" INT PRIMARY KEY,
    "name" TEXT NOT NULL,
    "desc" TEXT NOT NULL
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
	uuid TEXT PRIMARY KEY,
	name TEXT NOT NULL,
	email TEXT NOT NULL,
	roles INT NOT NULL,
	created_at INT DEFAULT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	modfied_at INT DEFAULT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	deleted_at INT DEFAULT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	online bool DEFAULT true,
	deleted bool DEFAULT false,
	nodeid serial NOT NULL,
	FOREIGN KEY (roles) REFERENCES roles (uuid)
);

CREATE TABLE IF NOT EXISTS users_modfied_operation (
	event_at INT NOT NULL,
	target TEXT NOT NULL,
	operation_by TEXT NOT NULL,
	FOREIGN KEY (target) REFERENCES users (uuid),
	FOREIGN KEY (operation_by) REFERENCES users (uuid)
);

CREATE TABLE IF NOT EXISTS users_deleted_operation (
	event_at INT NOT NULL,
	target TEXT NOT NULL,
	operation_by TEXT NOT NULL,
	FOREIGN KEY (target) REFERENCES users (uuid),
	FOREIGN KEY (operation_by) REFERENCES users (uuid)
);

CREATE TABLE IF NOT EXISTS users_twofactorcode (
	uuid TEXT PRIMARY KEY,
	secret TEXT NOT NULL,
	recovery JSON NOT NULL DEFAULT '[]',
	trusted_source JSON NOT NULL DEFAULT '[]',
	FOREIGN KEY (uuid) REFERENCES users (uuid)
);
