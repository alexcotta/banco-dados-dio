-- projeto oficina dio

-- criar insert oficina
USE oficina;

-- criar insert tabela cliente
INSERT INTO cliente (nome) VALUES
	('Marcelo Abreu'),('Bianca Assunção');
    
SELECT * FROM cliente;
    
-- criar iserts tabela veiculo
INSERT INTO veiculo (cliente_idCliente) VALUES
	(1),(2);
    
SELECT * FROM veiculo;
    
-- criar inserts tabela tipo de serviço
INSERT INTO tipo_servico (tipo_servico, veiculo_idVeiculo, autoriza_servico) VALUES
	('Revisao',1,1),('Troca Pneu',1,0),('Manutencao',2,1);
    
SELECT * FROM tipo_servico;
	
    
-- criar inserts para a tabela equipe
INSERT INTO equipe (veiculo_idVeiculo) VALUES
	(1),(2);
    
SELECT * FROM equipe;
    
-- criar inserts para a tabela equipe realiza varios servicos
INSERT INTO equipe_realiza_varios_servicos (equipe_idEquipe, tipo_servico_idServico) VALUES
	(1,1),(2,2);

 -- criar inserts para a tabela funcionario
INSERT INTO funcionario (nome, funcionario, endereco) VALUES
	('Marcelo Conrrado', 'Mecanico', 'Rua Branca Amarela'),
    ('Amanda Afonso', 'Soldador', 'Av das Flores'),
    ('Fabricio Arantes', 'Funileiro', 'Rua de Baixo'),
    ('Bruno Dantas', 'Mecanico', 'Alameda 31');
    
-- criar inserts para a tabela funcionario esta na equipe
INSERT INTO funcionario_esta_na_equipe (equipe_idEquipe, funcionario_idFuncionario) VALUES
	(1,1),(1,2),(1,3),(2,4),(2,1);
    
 -- criar inserts para a tabela peca
INSERT INTO peca (nome, descricao, valor) VALUES
	('Parafuso','Parafuso 3/4',5.00),
    ('Porca','Porca 3/4',7.5),
    ('Amortecedor','Amortecedor para automovel',250.00);
    
    
 -- criar insert para a tabela peca para serviço
INSERT INTO peca_para_servico (tipo_servico_idServico, peca_idPeca, quantidade) VALUES
	(1,1,10),(2,2,25),(1,3,4);
    
 -- criar insert para a tabela mao de obra
INSERT INTO mao_de_obra (tipo_servico, valor) VALUES
	('Mecanico', 150.00),('Funileiro',175.00),('Soldador',125.00);

 -- criar inserts para a tabela ordem serviço
INSERT INTO ordem_servico (data_entrega, data_emissao, status_os, valor, mao_obra_idMao_Obra) VALUES
	('2022-09-25', '2022-09-23',1,350.00,1),('2022-09-10','2022-09-13',0,500.00,2);

 -- criar inserts para a tabela ordem serviço tem tipo serviço
INSERT INTO ordem_servico_tem_tipo_servico (tipo_servico_idServico, ordem_servico_idOrdem_Servico) VALUES
	(1,1),(2,2);
    
SHOW TABLES;