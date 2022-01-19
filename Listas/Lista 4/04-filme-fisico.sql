# Gabriele Jandres Cavalcanti | DRE: 119159948

CREATE DATABASE Filmes;

use Filmes;

CREATE TABLE Filme (
    id INT PRIMARY KEY,
    titulo VARCHAR(255),
    ano_lancamento INT
);

CREATE TABLE Genero (
    nome VARCHAR(255) PRIMARY KEY
);

CREATE TABLE Filme_Genero (
    Genero_nome VARCHAR(255),
    Filme_id INT,
    
    PRIMARY KEY (Genero_nome, Filme_id), 
    FOREIGN KEY (Genero_nome) REFERENCES Genero(nome),
    FOREIGN KEY (Filme_id) REFERENCES Filme(id)
);

CREATE TABLE Ator (
    codigo INT PRIMARY KEY,
    nome_artistico VARCHAR(255),
    sexo CHAR,
    data_nasc DATE
);

CREATE TABLE Usuario (
    apelido VARCHAR(255) PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    senha VARCHAR(255)
);

CREATE TABLE Papel (
    papel_PK INT NOT NULL PRIMARY KEY,
    nome_personagem VARCHAR(255)
);

CREATE TABLE Atuacao (
    Filme_id INT,
    Ator_codigo INT,
    Papel_papel_PK INT,
    
    PRIMARY KEY (Filme_id, Ator_codigo, Papel_papel_PK),
    FOREIGN KEY (Filme_id) REFERENCES Filme(id),
    FOREIGN KEY (Ator_codigo) REFERENCES Ator(codigo),
    FOREIGN KEY (Papel_papel_PK) REFERENCES Papel(papel_PK)
);

CREATE TABLE Avaliacao (
    Filme_id INT,
    Usuario_apelido VARCHAR(255),
    data DATE,
    nota FLOAT,
    comentario VARCHAR(255),
    
    PRIMARY KEY (Filme_id, Usuario_apelido),
    FOREIGN KEY (Filme_id) REFERENCES Filme(id),
    FOREIGN KEY (Usuario_apelido) REFERENCES Usuario(apelido)
);

# Conferência do banco
SHOW TABLES;
SHOW COLUMNS FROM ATOR;
SHOW COLUMNS FROM ATUACAO;
SHOW COLUMNS FROM AVALIACAO;
SHOW COLUMNS FROM FILME;
SHOW COLUMNS FROM FILME_GENERO;
SHOW COLUMNS FROM GENERO;
SHOW COLUMNS FROM PAPEL;
SHOW COLUMNS FROM USUARIO;