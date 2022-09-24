-- projeto ecomerce dio

-- criar database ecommerce
CREATE DATABASE ecommerce;
USE ecommerce;

-- criar tabela cliente
CREATE TABLE IF NOT EXISTS cliente(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	endereco VARCHAR(50) NOT NULL,
	identificacao ENUM ('CPF','CNPJ')
)
ENGINE = InnoDB;

-- criar tabela pedido
CREATE TABLE IF NOT EXISTS pedido(
	idPedido INT PRIMARY KEY AUTO_INCREMENT,
	descicao VARCHAR(150) NOT NULL,
	frete FLOAT(10) NOT NULL,
	status_pedido ENUM ('ENVIADO','CANCELADO','PENDENTE','ENTREGUE'),
    cliente_id INT,
    CONSTRAINT FOREIGN KEY (cliente_id) REFERENCES cliente(idCliente) ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

-- criar tabela entrega
CREATE TABLE IF NOT EXISTS entrega (
	idEntrega INT PRIMARY KEY AUTO_INCREMENT,
    status_pedido ENUM ('ENVIADO','CANCELADO','PENDENTE','ENTREGUE') NOT NULL,
    data_entrega DATE NOT NULL,
    codigo_rastreio VARCHAR(15) NOT NULL,
    pedido_id INT,
    CONSTRAINT FOREIGN KEY (pedido_id) REFERENCES pedido(idPedido) ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

-- criar tabela pagamento
CREATE TABLE IF NOT EXISTS pagamento (
	idPagamento INT PRIMARY KEY AUTO_INCREMENT,
    tipo_pagamento ENUM ('BOLETO','PIX','CARTAO_CREDITO','DINHEIRO') NOT NULL,
    data_vencimento DATE NOT NULL,
    data_compra DATE NOT NULL,
    valor FLOAT(10) NOT NULL
)
ENGINE = InnoDB;

-- criar tabela relacionamento n-m
CREATE TABLE IF NOT EXISTS cliente_metodos_pagamento (
	pagamento_idPagamento INT,
    cliente_idCliente INT,
    CONSTRAINT FOREIGN KEY (cliente_idCliente) REFERENCES cliente(idCliente) ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT FOREIGN KEY (pagamento_idPagamento) REFERENCES pagamento(idPagamento) ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

-- criar tabela produto
CREATE TABLE IF NOT EXISTS produto (
	idProduto INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(100) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    valor FLOAT(10)
)
ENGINE = InnoDB;

-- criar tabela relacionamento n-m
CREATE TABLE IF NOT EXISTS produtos_no_pedido (
	produto_idProduto INT,
    pedido_idPedido INT,
    quantidade INT NOT NULL,
    CONSTRAINT FOREIGN KEY (produto_idProduto) REFERENCES produto(idProduto) ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT FOREIGN KEY (pedido_idPedido) REFERENCES pedido(idPedido) ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

-- criar tabela fornecedor
CREATE TABLE IF NOT EXISTS fornecedor (
	idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20) NOT NULL
)
ENGINE = InnoDB;

-- criar tabela relacionamento n-m
CREATE TABLE IF NOT EXISTS produtos_do_fornecedor (
	produto_idProduto INT,
    fornecedor_idFornecedor INT,
    quantidade INT NOT NULL,
    CONSTRAINT FOREIGN KEY (produto_idProduto) REFERENCES produto(idProduto) ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT FOREIGN KEY (fornecedor_idFornecedor) REFERENCES fornecedor(idFornecedor) ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

-- criar tabela terceiro vendedor
CREATE TABLE IF NOT EXISTS terceiro_vendedor (
	idTerceiro_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20) NOT NULL,
    local VARCHAR(100) NOT NULL
)
ENGINE = InnoDB;

-- criar tabela relacionamento n-m
CREATE TABLE IF NOT EXISTS produtos_do_vendedor_terceiro (
	produto_idProduto INT,
    terceiro_vendedor_idTerceiroVendedor INT,
    quantidade INT NOT NULL,
    CONSTRAINT FOREIGN KEY (produto_idProduto) REFERENCES produto(idProduto) ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT FOREIGN KEY (terceiro_vendedor_idTerceiroVendedor) REFERENCES terceiro_vendedor(idTerceiro_vendedor) ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

-- criar tabela relacionamento estoque
CREATE TABLE IF NOT EXISTS estoque (
	idEstoque INT PRIMARY KEY AUTO_INCREMENT,
    local VARCHAR(100) NOT NULL
)
ENGINE = InnoDB;

-- criar tabela relacionamento n-m
CREATE TABLE IF NOT EXISTS produtos_no_estoque (
	estoque_idEstoque INT,
    produto_idProduto INT,
    quantidade INT NOT NULL,
    CONSTRAINT FOREIGN KEY (estoque_idEstoque) REFERENCES estoque(idEstoque) ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT FOREIGN KEY (produto_idProduto) REFERENCES produto(idProduto) ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

SHOW TABLES;
