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
    (0, 'level-00', 'level-00'),
    (1, 'level-01', 'level-01'),
    (2, 'level-02', 'level-02'),
    (3, 'level-03', 'level-03'),
    (4, 'level-04', 'level-04'),
    (5, 'level-05', 'level-05'),
    (6, 'level-06', 'level-06'),
    (7, 'level-07', 'level-07'),
    (8, 'level-08', 'level-08'),
    (9, 'level-09', 'level-09'),
    (10, 'level-10', 'level-10'),
    (11, 'level-11', 'level-11'),
    (12, 'level-12', 'level-12'),
    (13, 'level-13', 'level-13'),
    (14, 'level-14', 'level-14'),
    (15, 'privil15ege', 'Privilege permission');

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
