DROP TABLE IF EXISTS mondai_category;
DROP TABLE IF EXISTS mondai;

CREATE TABLE IF NOT EXISTS mondai_category (
    "uuid" INT PRIMARY KEY,
	"created_at" INT DEFAULT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	"modfied_at" INT DEFAULT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	"deleted_at" INT DEFAULT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	"deleted" bool DEFAULT false,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
	"genre" TEXT NOT NULL
);

INSERT INTO mondai_category (uuid,name,description,genre) VALUES
	(101, '電気に関する基礎理論', '電気に関する基礎理論', '第一種電気工事士'),
	(102, '配電理論及び配線設計', '配電理論及び配線設計', '第一種電気工事士'),
	(103, '電気応用', '電気応用', '第一種電気工事士'),
	(104, '電気機器・蓄電池・配線器具・電気工事用の材料及び工具並びに受電設備', '電気機器・蓄電池・配線器具・電気工事用の材料及び工具並びに受電設備', '第一種電気工事士'),
	(105, '電気工事の施工方法', '電気工事の施工方法', '第一種電気工事士'),
	(106, '自家用電気工作物の検査方法', '自家用電気工作物の検査方法', '第一種電気工事士'),
	(107, '配線図', '配線図', '第一種電気工事士'),
	(108, '発電施設・送電施設及び変電施設の基礎的な構造及び特性', '発電施設・送電施設及び変電施設の基礎的な構造及び特性', '第一種電気工事士'),
	(109, '一般用電気工作物等及び自家用電気工作物の保安に関する法令', '一般用電気工作物等及び自家用電気工作物の保安に関する法令', '第一種電気工事士'),
    (201, '電気に関する基礎理論', '電気に関する基礎理論', '第二種電気工事士'),
    (202, '配電理論及び配線設計', '配電理論及び配線設計', '第二種電気工事士'),
    (203, '電気機器・配線器具並びに電気工事用の材料及び工具', '電気機器・配線器具並びに電気工事用の材料及び工具', '第二種電気工事士'),
    (204, '電気工事の施工方法', '電気工事の施工方法', '第二種電気工事士'),
    (205, '一般用電気工作物等の検査方法', '一般用電気工作物等の検査方法', '第二種電気工事士'),
    (206, '配線図', '配線図', '第二種電気工事士'),
    (207, '一般用電気工作物等の保安に関する法令', '一般用電気工作物等の保安に関する法令', '第二種電気工事士');

CREATE TABLE IF NOT EXISTS mondai (
    uuid BIGINT PRIMARY KEY,
	category_uuid INT NOT NULL,
	created_at INT DEFAULT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	modfied_at INT DEFAULT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	deleted_at INT DEFAULT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
	deleted bool DEFAULT false,
    mondai_text TEXT NOT NULL,
    mondai_binary JSON NOT NULL DEFAULT '[]',
    kaitou_text JSON NOT NULL DEFAULT '[]',
    kaitou_binary JSON NOT NULL DEFAULT '[]',
	FOREIGN KEY (category_uuid) REFERENCES mondai_category (uuid)
);
