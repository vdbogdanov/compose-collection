CREATE DATABASE termideskdb LC_COLLATE 'ru_RU.utf8' LC_CTYPE 'ru_RU.utf8' TEMPLATE template0;
CREATE USER tduser WITH PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE termideskdb TO tduser;