# Это Rails-приложение позволяет:
    * расчитать, когда у продукта останется меньше 40% от срока годности, адрес http://host/
    * посмотреть логи, адрес http://host/admin

## Настройка приложения:
    * добавьте в config/credentials.yml.enc с помощью "bin/rails credentials:edit" настройки для учетной записи admin:
        admin:
          login: login
          password: password
    
    * только для среды production: настройка smtp сервера для отправки сообщений - добавьте в config/credentials.yml.enc с помощью "bin/rails credentials:edit" настройки для smtp сервера:
        smtp_server:
            address: your_smtp_server_address.ru
            port: port
            user_name: your_user_name
            password: your_password

## Настройки базы данных: используется PostgreSQL.
    * для development и test окружения настройки по умолчанию.
    * для production среды с помощью "bin/rails credentials:edit" добавьте следущие настройки:
        db:
          host: host_for_db
          port: port_for_db
          username: username_for_db
          password: password_for_db
          database: your_database
    либо задайте конфигурацию при запуске с помощью переменной окружения
        DATABASE_URL=postgresql://username:passsword@host:port/database

## Запуск приложения: 
    Сначала необходимо выполнить настройки для приложения и для базы данных(смотри выше). Затем есть 3 варианта:
        * локально для сред production, test, developmen через "bin/rails server"

        * в отдельном контейнере для среды production с помощью
            "docker build -t your_image_name ."
            и затем
            "docker run -d -p 80:3000 your_image_name"

        * с помощью docker-compose вместе с базой данных:
            база данных будет запускаться на порту 5432 c базой converter_application
            необходимо передавать пользователя(PG_USER) и пароль(PG_PASSWORD)
            значения по умолчанию: 
                PG_USER     = postgress
                PG_PASSWORD = password

            сначала собираем образ
            "PG_USER=your_user PG_PASSWORD=your_password docker-compose build"
            затем запускаем контейнеры
            "PG_USER=your_user PG_PASSWORD=your_password docker-compose up"

            приложение будет доступно на 80 порту хостовой машины

            после этого в директории /var/converter_application создастся 2 директории
            pgdata/    - в которой будет лежать ваша база данных
            rails_logs - в которой будут лежать логи rails приложения

            !!! ВНИМАНИЕ !!!
            если вы повторно запускаете приложение через docker-compose и не удаляли директорию с 
            /var/converter_application/pgdata с вашей базой данных, то будет использоваться эта
            существующая база дынных и соотвественно пользователя и пароль нужно передавать для 
            этой бызы данных

## Версия ruby:
    3.0.1
