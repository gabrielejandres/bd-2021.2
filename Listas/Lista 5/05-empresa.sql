# Gabriele Jandres Cavalcanti | DRE: 119159948

CREATE DATABASE Empresa;

use Empresa;

# Enunciado
CREATE TABLE Funcionario (
	Pnome VARCHAR(15) NOT NULL, 
    Cpf CHAR(11) NOT NULL, 
    Cpf_Supervisor CHAR(11), 
    Dnr INT, 
    
    PRIMARY KEY (Cpf), 
    CONSTRAINT Func_Sup FOREIGN KEY (Cpf_Supervisor) REFERENCES Funcionario(Cpf) ON DELETE SET NULL
);

CREATE TABLE Departamento (
	Dnome VARCHAR(15) NOT NULL, 
    Dnumero INT NOT NULL, 
    Cpf_gerente CHAR(11), 
    
    PRIMARY KEY (Dnumero), 
    UNIQUE (Dnome),
	CONSTRAINT Depto_Ger FOREIGN KEY (Cpf_gerente) REFERENCES Funcionario(Cpf)
);

ALTER TABLE Funcionario ADD CONSTRAINT Func_Depto FOREIGN KEY (Dnr) REFERENCES Departamento(Dnumero);

CREATE TABLE Dependente (
	Fcpf CHAR(11) NOT NULL, 
    Nome_dependente VARCHAR(15) NOT NULL,
    
    PRIMARY KEY (Fcpf, Nome_dependente), 
    CONSTRAINT Dep_Func FOREIGN KEY (Fcpf) REFERENCES Funcionario(Cpf) ON DELETE CASCADE
);

# Exercício 1 | Inserir um departamento sem gerente
INSERT INTO Departamento (Dnome, Dnumero)
	VALUES ('Jurídico', 1);
    
SELECT * FROM Departamento;

# Exercício 2 | Inserir dois funcionários do departamento anterior (um supervisor e outro supervisionado por ele)
INSERT INTO Funcionario
	VALUES ('Carla', '123456789', null, 1), ('Maria', '987654321', '123456789', 1);
    
SELECT * FROM Funcionario;

# Exercício 3 | Incluir um dependente para o primeiro funcionário
INSERT INTO Dependente
	VALUES ('123456789', 'João');
    
SELECT * FROM Dependente;

# Exercício 4 | Remover o departamento criado
delete from Departamento where Dnumero = 1;

# Exercício 5 | Remover o primeiro funcionário
delete from Funcionario where Cpf = '123456789';

select * from Funcionario;
select * from Dependente;

# Exercício 6 | Alterar a chave primária do departamento
UPDATE Departamento SET Dnumero = 2 WHERE Dnumero = 1;

ALTER TABLE Funcionario DROP FOREIGN KEY Func_Depto; 

ALTER TABLE Funcionario ADD CONSTRAINT Func_Depto FOREIGN KEY (Dnr) REFERENCES Departamento(Dnumero) ON UPDATE CASCADE;

UPDATE Departamento SET Dnumero = 2 WHERE Dnumero = 1;

SELECT * FROM Departamento;
SELECT * FROM Funcionario;
