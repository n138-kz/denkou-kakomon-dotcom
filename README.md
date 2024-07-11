# [denkou-kakomon-dotcom](https://github.com/n138-kz/denkou-kakomon-dotcom)

## Activity

[![GitHub repo license](https://img.shields.io/github/license/n138-kz/denkou-kakomon-dotcom)](/LICENSE)
[![GitHub repo size](https://img.shields.io/github/repo-size/n138-kz/denkou-kakomon-dotcom)](/../../)
[![GitHub repo file count](https://img.shields.io/github/directory-file-count/n138-kz/denkou-kakomon-dotcom)](/../../)
[![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/n138-kz/denkou-kakomon-dotcom)](/../../)
[![GitHub last commit](https://img.shields.io/github/last-commit/n138-kz/denkou-kakomon-dotcom)](/../../commits)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/w/n138-kz/denkou-kakomon-dotcom)](/../../commits)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/t/n138-kz/denkou-kakomon-dotcom)](/../../commits)
[![GitHub issues](https://img.shields.io/github/issues/n138-kz/denkou-kakomon-dotcom)](/../../issues)
[![GitHub issues closed](https://img.shields.io/github/issues-closed/n138-kz/denkou-kakomon-dotcom)](/../../issues)
[![GitHub pull requests closed](https://img.shields.io/github/issues-pr-closed/n138-kz/denkou-kakomon-dotcom)](/../../pulls)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/n138-kz/denkou-kakomon-dotcom)](/../../pulls)
[![GitHub language count](https://img.shields.io/github/languages/count/n138-kz/denkou-kakomon-dotcom)](/../../)
[![GitHub top language](https://img.shields.io/github/languages/top/n138-kz/denkou-kakomon-dotcom)](/../../)

## License

[![License MIT](https://upload.wikimedia.org/wikipedia/commons/0/0c/MIT_logo.svg)](LICENSE)  
[Copyright (c) 2024 Yuu Komiya (n138)](LICENSE)  

## Database E-R

```mermaid
erDiagram
Google_Client-verifyIdToken ||--o{ users: ""
users ||--o{ roles: "" 
users ||--o{ users_deleted_operation: "" 
mondai ||--o{ mondai_answered: "" 
users ||--o{ mondai_answered: "" 
mondai ||--o{ mondai_kaisetsu: "" 

Google_Client-verifyIdToken {
    text iss "https://accounts.google.com"
    text azp "000000000000-aaaaaaaaaaaaaaaaaaaaaaaaaaaaacud.apps.googleusercontent.com"
    text aud "000000000000-aaaaaaaaaaaaaaaaaaaaaaaaaaaaacud.apps.googleusercontent.com"
    text sub PK "ユーザ識別子"
    text email "メールアドレス"
    bool email_verified "true or false"
    int nbf
    text name "アカウント名"
    text picture "アイコンURL"
    text given_name "アカウント名"
    timestamp iat "認証された時間"
    timestamp exp "トークンの使用期限"
    text jti
}

users {
    text uuid PK "[table] Google_Client-verifyIdToken: sub"
    text name "[table] Google_Client-verifyIdToken: name"
    text email "[table] Google_Client-verifyIdToken: email"
    text icon "[table] Google_Client-verifyIdToken: picture"
    refferecnce roles FK "[table] roles: uuid"
    timestamp created_at
    timestamp modfied_at
    timestamp deleted_at
    bool online
    bool deleted 
    serial nodeid
}

roles {
    int uuid PK
    text name
    text desc "description"
}

users_deleted_operation {
    timestamp deleted_at PK
    refferecnce user_uuid FK "[table] users: uuid"
}

mondai {
    bigint uuid PK
    timestamp created_at
    timestamp modfied_at
    timestamp deleted_at
    boolean deleted "default: false"
    text mondai_text
    json mondai_binary "memo: base64 encode image"
    json kaitou_text
    json kaitou_binary
}

mondai_answered {
    timestamp created_at PK
    refferecnce user_uuid FK "[table] users: uuid"
    refferecnce mondai_uuid FK "[table] mondai: uuid"
}

mondai_kaisetsu {
    bigint uuid PK
    timestamp created_at
    timestamp modfied_at
    timestamp deleted_at
}
```
