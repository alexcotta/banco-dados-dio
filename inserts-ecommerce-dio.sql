-- projeto ecomerce dio

-- criar insert ecommerce
USE ecommerce;

-- criar inserts tabela cliente
INSERT INTO cliente (nome, endereco, identificacao) VALUES('Marcelo da Cruz', 'Av. Subindo o Morro Colorido 160', 'CPF'),
	('Bianca da Costa', 'Rua Mateus Abre da Cunha 67', 'CPF'),
    ('Mateus Ricardo', 'Conjunto das Flores 1900', 'CPF'),
    ('Emporio Jardim Amarelo', 'Av. Juvenal do Monte 1234', 'CNPJ'),
    ('Padaria Coxão de Mola', 'Rua Lençois Freaticos 99','CNPJ');

-- criar inserts tabela pedido
INSERT INTO pedido (descicao, frete, status_pedido, cliente_id) VALUES('pen drive 16gb', 25.00, 'PENDENTE', 1),
	('moto serra', 150.00, 'ENTREGUE', 1),
    ('lote de goibada 10kg', 345.00, 'ENTREGUE', 4);
	
    
-- criar inserts tabela entrega
INSERT INTO entrega (status_pedido, data_entrega, codigo_rastreio, pedido_id) VALUES
	('PENDENTE', '2022-09-22','BR1234123411',1),
    ('ENTREGUE', '2022-09-01', 'BR98989898988', 2),
    ('ENTREGUE', '2022-09-07','BR56567878911', 3);
	
-- criar inserts tabela pagamento
INSERT INTO pagamento (tipo_pagamento, data_vencimento, data_compra, valor) VALUES
	('BOLETO', '2022-09-19', '2022-09-17', 150.00),
    ('PIX', '2022-08-31', '2022-08-28', 345.00),
    ('CARTAO_CREDITO', '2022-09-19','2022-09-17', 3450.00);
    
-- criar tabela relacionamento n-m
INSERT INTO cliente_metodos_pagamento (pagamento_idPagamento, cliente_idCliente) VALUES
	(1,1),(2,1),(3,4);
	
-- criar inserts tabela produto
INSERT INTO produto (categoria, descricao, valor) VALUES 
	('Ferramenta', 'Ferramenta de corte para madeira', 150.00), 
    ('Eletronico', 'Pen drive 16 gb', 50.00), 
    ('Cama', 'Cama adulto', 1400.00),
    ('EletroEletronico', 'Assistir televisao', 500.00), 
    ('Produto digital', 'DVD homem formiga', 76.00),
    ('Perecivel', 'Lote de goiabada', 450.00);
    
	
-- criar inserts tabela produtos_no_pedido
INSERT INTO produtos_no_pedido (produto_idProduto, pedido_idPedido, quantidade) VALUES
	(2, 1, 1), (1, 2, 1), (6, 3, 4);
    
-- criar inserts tabela fornecedor
INSERT INTO fornecedor (razao_social, cnpj) VALUES
	('Mercado Azul e Branco', 'CN9898767676'),
    ('Organograma Mundial Av', 'CN4342414553'),
    ('Comercio e Varejo Cristalgua', 'CN398383831');
    
-- criar inserts tabela produtos do fornecedor
INSERT INTO produtos_do_fornecedor (produto_idProduto, fornecedor_idFornecedor, quantidade) VALUES
	(1,2,10),(2,3,10),(3,1,10),(4,2,10),(5,2,200),(6,2,340);
    
    
-- criar inserts tabela terceiro vendedor
INSERT INTO terceiro_vendedor (razao_social, cnpj, local) VALUES
	('Mercado sem nome', 'CN7172727272', 'São Paulo'),
    ('Industria de Ferramentas', 'CN980706504022', 'Bauru');

-- criar inserts tabela produtos_do_vendedor_terceiro 

-- criar inserts tabela relacionamento estoque
INSERT INTO estoque (local) VALUES 
	('Av Das Empresas de Atacado, 987');

-- criar isnerts tabela produtos_no_estoque
INSERT INTO produtos_no_estoque (estoque_idEstoque, produto_idProduto, quantidade) VALUES
	(1, 1, 10),(1,2, 10),(1,3, 10),(1, 4, 10),(1, 5, 50),(1, 6, 500);

SELECT * FROM cliente;
SELECT * FROM pedido;
SELECT * FROM entrega;
SELECT * FROM pagamento;
SELECT * FROM cliente_metodos_pagamento;
SELECT * FROM produto;
SELECT * FROM produtos_no_pedido;
SELECT * FROM fornecedor;
SELECT * FROM produtos_do_fornecedor;
SELECT * FROM terceiro_vendedor;
SELECT * FROM estoque;
SELECT * FROM produtos_no_estoque;