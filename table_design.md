# テーブル設計
## ER図
## テーブル定義
`チャンネル：channels`
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
|---|---|---|---|---|---|
|channel_id|int||primary||yes|
|name|varchar(100)||||

`番組：programs`
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
|---|---|---|---|---|---|
|program_id|int||primary||yes|
|title|varchar(100)|||||
|description|varchar(100)|||||

`：program_genres`
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
|---|---|---|---|---|---|
|program_id|int||primary|||
|genre_id|int||primary|||

`：seasons`
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
|---|---|---|---|---|---|
|season_id|int||primary||yes|
|program_id|int|||||
|season_number|int|||||

`：episodes`
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
|---|---|---|---|---|---|
|episode_id|int||primary||yes|
|season_id|int|||||
|episode_number|int||||
|title|varchar(100)|||||
|description|varchar(100)|||||
|duration|int|yes||||
|release_date|date|yes||||

`チャンネル：timeslots`
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
|---|---|---|---|---|---|
|timeslot_id|int||primary||yes|
|channel_id|int||||
|start_time|int||||
|end_time|int||||
|episode_id|int||||