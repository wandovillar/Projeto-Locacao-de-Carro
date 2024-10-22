CREATE DATABASE LOCACAR;

-- CRIANDO TABELA COM NOME MARCAS E SUAS COLUNAS
CREATE TABLE carro (
    id_carro INT NOT NULL AUTO_INCREMENT,
    nomeCarro VARCHAR(100) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    origem VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(100) NOT NULL,
    descricao VARCHAR(100),
    PRIMARY KEY (id_carro)
);
 



-- CRIANDO TABELA COM NOME INVENTARIO E SUAS COLUNAS. ADICIONANDO CHAVE ESTRANGEIRA '(ID_MARCAS)'
CREATE TABLE inventario (
    id_inventario INT NOT NULL AUTO_INCREMENT,
    id_carro INT NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    transmissao VARCHAR(100) NOT NULL,
    motor VARCHAR(100) NOT NULL,
    combustivel VARCHAR(100) NOT NULL,
    anoModelo YEAR,
    cor VARCHAR(50),
    PRIMARY KEY (id_inventario),
    FOREIGN KEY (id_carro)	REFERENCES carro (id_carro)
);


-- CRIANDO TABELA DE CLIENTES E SUAS COLUNAS 
CREATE TABLE clientes (
    id_clientes INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
	telefone VARCHAR(15),
    statusCliente Enum('Reprovado', 'Aprovado') NOT NULL,
    PRIMARY KEY (id_clientes)
    
);


CREATE TABLE planos(
	id_plano INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    nomePlano VARCHAR(100) NOT NULL,
    duracao VARCHAR(100),
    valorCaucao DECIMAL(10, 2), 
	valorLocacao DECIMAL(10, 2),
    seguroBasico VARCHAR(250),
    coberturaAssistencia VARCHAR(250),
    multaExcessoKM DECIMAL(10, 2),
    descricao VARCHAR(100),
    PRIMARY KEY(id_plano),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
    );
    

 
-- CRIANDO TABELA COM NOME PAGAMENTO E SUAS COLUNAS. ADICIONANDO CHAVE ESTRANGEIRA '(ID_CLIENTES, ID_PLANOS)'

CREATE TABLE pagamentos (
	id_pagamentos  INT NOT NULL AUTO_INCREMENT,
    dataInicial DATE NOT NULL,
    dataFinal DATE NOT NULL,
    valorCaucao DECIMAL(10, 2) NOT NULL, 
    valorMensalidade DECIMAL(10, 2),
    id_clientes INT NOT NULL,
    id_plano INT NOT NULL,
    valorTotal DECIMAL(10, 2) NOT NULL,
    metodoPagamento VARCHAR(100) NOT NULL,
    statusPagamento ENUM('Ativo', 'Inativo', 'Suspenso') NOT NULL,
    dataPagamento DATETIME NOT NULL,
	PRIMARY KEY (id_pagamentos),
    FOREIGN KEY (id_clientes) REFERENCES clientes(id_clientes),
    FOREIGN KEY (id_plano) REFERENCES planos(id_plano)
);
  
  -- CRIANDO UMA TABELA DE USUARIO E SENHA PARA FUTURO TER UMA CONEXÃO ATRÁVES DE UMA API.
  
  CREATE TABLE usuarios (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    id_clientes INT NOT NULL,  
    username VARCHAR(50) NOT NULL UNIQUE,  
    senha VARCHAR(255) NOT NULL, 
    PRIMARY KEY (id_usuario),
    FOREIGN KEY (id_clientes) REFERENCES clientes (id_clientes)
); 
    
  
  
