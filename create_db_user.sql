CREATE USER sleede;
ALTER ROLE sleede WITH CREATEDB;
CREATE DATABASE fabmanager_development OWNER sleede;
ALTER USER sleede WITH ENCRYPTED PASSWORD 'sleede';
