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
users ||--o{ roles: "" 
mondai ||--o{ mondai_answered: "" 

users {
    text uuid PK
    text name
    text email
    timestamp created_at
    timestamp modfied_at
    timestamp deleted_at
}

roles {
    int uuid PK
    text name
    text description
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
    refferecnce mondai_uuid FK
}
```
