CREATE TABLE IF NOT EXISTS users (
	uuid text primary key,
	name text not null,
	email name not null,
	created_at int default EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	modfied_at int default EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	deleted_at int default EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	online bool default true,
	deleted bool default false,
	nodeid serial not null
)
