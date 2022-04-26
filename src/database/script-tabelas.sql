CREATE DATABASE coldtech;

USE coldtech;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nomeEmpresa VARCHAR(100),
	cnpj VARCHAR(30),
	email VARCHAR(50),
    telefone VARCHAR(20),
    cep varchar(20),
    numero varchar(20),
    senha varchar(50)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
    descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
); 

CREATE TABLE medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	temperatura DECIMAL,
	umidade DECIMAL,
	momento DATETIME,
	fk_aquario INT
);

select * from usuario;
drop database coldtech;