-- projeto oficina dio

-- criar database oficina
CREATE DATABASE oficina;
USE oficina;

-- criar a tabela cliente
CREATE TABLE IF NOT EXISTS cliente (
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
    );
    
-- criar a tabela veiculo
CREATE TABLE IF NOT EXISTS veiculo (
	idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    cliente_idCliente INT,
    CONSTRAINT FOREIGN KEY (cliente_idCliente) REFERENCES cliente(idCliente) ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
    
-- criar a tabela tipo de serviço
CREATE TABLE IF NOT EXISTS tipo_servico (
	idServico INT PRIMARY KEY AUTO_INCREMENT,
    tipo_servico ENUM('Revisao', 'Manutencao', 'Troca Pneu') NOT NULL,
    veiculo_idVeiculo INT NOT NULL,
    autoriza_servico INT NOT NULL,
    CONSTRAINT FOREIGN KEY (veiculo_idVeiculo) REFERENCES veiculo(idVeiculo) ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
    
-- criar a tabela equipe
CREATE TABLE IF NOT EXISTS equipe (
	idEquipe INT PRIMARY KEY AUTO_INCREMENT,
    veiculo_idVeiculo INT NOT NULL,
    CONSTRAINT FOREIGN KEY (veiculo_idVeiculo) REFERENCES veiculo(idVeiculo) ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );

-- criar a tabela equipe realiza varios servicos
CREATE TABLE IF NOT EXISTS equipe_realiza_varios_servicos (
    equipe_idEquipe INT NOT NULL,
    tipo_servico_idServico INT NOT NULL,
    CONSTRAINT FOREIGN KEY (equipe_idEquipe) REFERENCES equipe(idEquipe) ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT FOREIGN KEY (tipo_servico_idServico) REFERENCES tipo_servico(idServico) ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
    
 -- criar a tabela funcionario
CREATE TABLE IF NOT EXISTS funcionario (
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    funcionario ENUM('Mecanico', 'Funileiro', 'Soldador') NOT NULL,
    endereco VARCHAR(100)
    );   
    
-- criar a tabela funcionario esta na equipe
CREATE TABLE IF NOT EXISTS funcionario_esta_na_equipe(
    equipe_idEquipe INT NOT NULL,
    funcionario_idFuncionario INT NOT NULL,
    CONSTRAINT FOREIGN KEY (equipe_idEquipe) REFERENCES equipe(idEquipe) ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT FOREIGN KEY (funcionario_idFuncionario) REFERENCES funcionario(idFuncionario) ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
    
 -- criar a tabela peca
CREATE TABLE IF NOT EXISTS peca (
    idPeca INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    valor FLOAT(10) NOT NULL
    );   
    
    
 -- criar a tabela peca para serviço
CREATE TABLE IF NOT EXISTS peca_para_servico(
    tipo_servico_idServico INT NOT NULL,
    peca_idPeca INT NOT NULL,
    quantidade INT NOT NULL,
    CONSTRAINT FOREIGN KEY (tipo_servico_idServico) REFERENCES tipo_servico(idServico) ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT FOREIGN KEY (peca_idPeca) REFERENCES peca(idPeca) ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );   

 -- criar a tabela mao de obra
CREATE TABLE IF NOT EXISTS mao_de_obra(
    idMao_Obra INT PRIMARY KEY AUTO_INCREMENT,
    tipo_servico ENUM('Mecanico', 'Funileiro', 'Soldador') NOT NULL,
    valor FLOAT(10) NOT NULL
);

 -- criar a tabela ordem serviço
CREATE TABLE IF NOT EXISTS ordem_servico(
    idOrdem_servico INT PRIMARY KEY AUTO_INCREMENT,
    data_entrega DATE NOT NULL,
    data_emissao DATE NOT NULL,
    status_os INT NOT NULL,
    valor FLOAT NOT NULL,
    mao_obra_idMao_Obra INT,
    CONSTRAINT FOREIGN KEY (mao_obra_idMao_Obra) REFERENCES mao_de_obra(idMao_Obra) ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );   

 -- criar a tabela ordem serviço tem tipo serviço
CREATE TABLE IF NOT EXISTS ordem_servico_tem_tipo_servico(
    tipo_servico_idServico INT NOT NULL,
    ordem_servico_idOrdem_Servico INT NOT NULL,
    CONSTRAINT FOREIGN KEY (tipo_servico_idServico) REFERENCES tipo_servico(idServico) ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT FOREIGN KEY (ordem_servico_idOrdem_Servico) REFERENCES ordem_servico(idOrdem_Servico) ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );  
    
SHOW TABLES;