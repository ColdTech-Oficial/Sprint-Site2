CREATE DATABASE coldTech;
USE coldTech;


CREATE TABLE empresa(
idEmpresa INT PRIMARY KEY auto_increment, 
nomeEmpresa VARCHAR(45), 
CNPJ VARCHAR(15), 
telFixo VARCHAR(15),
telefoneCorp VARCHAR(15), 
CEPemp VARCHAR(10),
Rua VARCHAR(45),
Numero INT
);

CREATE TABLE frigorificos(
idFrigorificos INT PRIMARY KEY auto_increment, 
nomeFrigorifico VARCHAR(45)
); 


CREATE TABLE caminhoes(
idCaminhao INT PRIMARY KEY auto_increment, 
placa VARCHAR(15), 
tipoCaminhao CHAR(1),
constraint chkTipo CHECK (tipoCaminhao = 'P' OR tipoCaminhao = 'M' OR tipoCaminhao = 'G'), 
fkEmpresa INT, 
foreign key (fkEmpresa) references empresa (idEmpresa), 
fkFrigorificos INT, 
foreign key (fkFrigorificos) references frigorificos (idFrigorificos)
);

CREATE TABLE sensores(
idSensores INT PRIMARY KEY auto_increment, 
fkFrigorificos INT,
foreign key (fkFrigorificos) references frigorificos (idFrigorificos),
tipoSensor VARCHAR(45)
);

CREATE TABLE dados(
idDados INT PRIMARY KEY auto_increment, 
dadosTemp DOUBLE, 
dataHora DATETIME DEFAULT current_timestamp, 
fkSensores INT, 
foreign key (fkSensores) references sensores (idSensores)
);

INSERT INTO empresa(nomeEmpresa, CNPJ, telFixo, telefoneCorp, CEPemp, Rua, Numero  ) VALUES
('FriboiCorp','11122233344455', '20452890', '11966576134', '04785000', 'edward felix', 90),
('coldFrigo','55566677788899', '20085643', '11967916262', '02996120', 'antonio nascimento', 559),
('ColdCold','99911122233344', '20132780', '11967916263', '08461560', 'esperança', 890);

SELECT * FROM empresa;

INSERT INTO frigorificos VALUES
(null, 'FrigoBoi'),
(null, 'FrigoCarne'),
(null, 'FrigoFrio');

SELECT * FROM frigorificos;

INSERT INTO caminhoes(tipoCaminhao, placa, fkEmpresa, fkFrigorificos) VALUES
('P','SPT-2244', 1, 1),
('G', 'BTC-3355', 2, 2),
('M', 'BRD-4466', 3, 3);

SELECT * FROM caminhoes; 

INSERT INTO sensores (fkFrigorificos, tipoSensor) VALUES
(1, 'LM35'), 
(2, 'LM35'), 
(3, 'LM35'); 

SELECT * FROM  sensores;

INSERT INTO dados (dadosTemp, dataHora, fkSensores) VALUES
(35.4, null, 1),
(20.7, null, 	2),
(20.2, null, 3);

