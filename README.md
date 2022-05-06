# README

Это Rails-приложение позволяет:
    - расчитать, когда у продукта останется меньше 40% от срока годности
    - посмотреть логи

База данных: PostgreSQL.
    - для development и test окружения настройки по умолчанию.
    - для production среды с помощью "bin/rails credentials:edit" добавьте следущие настройки:
        db:
          host: host
          port: port
          username: username
          password: password
          database: database
    либо задайте конфигурацию с помощью переменной окружения
        DATABASE_URL=postgresql://username:passsword@host:port/database

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
