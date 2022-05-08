# README

Это Rails-приложение позволяет:
    - расчитать, когда у продукта останется меньше 40% от срока годности
    - посмотреть логи

Настройка приложения:
    - добавьте в config/credentials.yml.enc с помощью "bin/rails credentials:edit" настройки для учетной записи admin:
        admin:
          login: login
          password: password

Настройки базы данных: используется PostgreSQL.
    - для development и test окружения настройки по умолчанию.
    - для production среды с помощью "bin/rails credentials:edit" добавьте следущие настройки:
        db:
          host: host_for_db
          port: port_for_db
          username: username_for_db
          password: password_for_db
          database: your_database
    либо задайте конфигурацию при запуске с помощью переменной окружения
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
