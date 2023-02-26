CREATE DATABASE IF NOT EXISTS tema_database;

USE tema_database;

CREATE TABLE IF NOT EXISTS companii_aeriene (
    cod_companie INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    denumire VARCHAR(50) NOT NULL,
    tara VARCHAR(50) NOT NULL,
    PRIMARY KEY (cod_companie)
);

CREATE TABLE IF NOT EXISTS localitati (
    cod_localitate INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    nume_localitate VARCHAR(50) NOT NULL,
    PRIMARY KEY (cod_localitate)
);

CREATE TABLE IF NOT EXISTS companii_localitati (
    cod_companie INT(10) UNSIGNED NOT NULL,
    cod_localitate INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (cod_companie, cod_localitate),
    FOREIGN KEY (cod_companie) REFERENCES companii_aeriene(cod_companie),
    FOREIGN KEY (cod_localitate) REFERENCES localitati(cod_localitate)
);

CREATE TABLE IF NOT EXISTS curse_aeriene (
    cod_cursa INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    cod_zbor VARCHAR(10) NOT NULL,
    data DATE NOT NULL,
    pret DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (cod_cursa)
);

CREATE TABLE IF NOT EXISTS clienti (
    cod_client INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    nume VARCHAR(50) NOT NULL,
    prenume VARCHAR(50) NOT NULL,
    adresa VARCHAR(100) NOT NULL,
    PRIMARY KEY (cod_client)
);

CREATE TABLE IF NOT EXISTS bilete (
    cod_bilet INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    cod_cursa INT(10) UNSIGNED NOT NULL,
    cod_client INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (cod_bilet),
    FOREIGN KEY (cod_cursa) REFERENCES curse_aeriene(cod_cursa),
    FOREIGN KEY (cod_client) REFERENCES clienti(cod_client)
);
