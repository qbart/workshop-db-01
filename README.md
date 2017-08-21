# Workshop

## Setup

Configure `database.yml`

```
cp config/database.yml.example config/database.yml
```

Edit file with valid config for your machine.

```
rake db:create
psql movietape < dump.sql
```


