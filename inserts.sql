-- Inserindo registros na tabela familia
INSERT INTO familia (nome, cep, numero_casa, renda, flag_retirada)
VALUES 
('Familia Silva', '12345678', 10, 1200.00, 1),
('Familia Souza', '87654321', 25, 2500.50, 0);

-- Inserindo registros na tabela titular
INSERT INTO titular (data_cadastro, nome, rg, cpf, data_nascimento, telefone1, telefone2, estado_civil, escolaridade, trabalhando, ocupacao, fk_familia)
VALUES 
('2023-01-15', 'João da Silva', '123456789', '11122233344', '1980-05-22', '11988887777', NULL, 'Casado', 'Ensino Médio', 1, 'Motorista', 1),
('2023-02-20', 'Maria Souza', '987654321', '55566677788', '1992-10-12', '11977776666', '11955554444', 'Solteiro', 'Ensino Superior', 0, 'Estudante', 2);

-- Inserindo registros na tabela despesa
INSERT INTO despesa (tipo, gasto, fk_familia)
VALUES 
('Aluguel', 600.00, 1),
('Supermercado', 300.50, 1),
('Transporte', 150.75, 2);

-- Inserindo registros na tabela beneficio
INSERT INTO beneficio (nome, valor, fk_titular)
VALUES 
('Bolsa Família', 300.00, 1),
('Vale Alimentação', 150.00, 2);

-- Inserindo registros na tabela doacao
INSERT INTO doacao (descricao, data_doacao, flag_doacao_entregue, fk_instituicao, fk_titular)
VALUES 
('Cesta básica', '2024-01-15 10:30:00', 1, 1, 1),
('Roupa de inverno', '2024-02-18 14:45:00', 0, 1, 2);

-- Inserindo registros na tabela usuario
INSERT INTO usuario (coordenador, nome_usuario, email, senha, cpf, flag_aprovado, fk_instituicao)
VALUES 
(1, 'Ana Coordenadora', 'ana@instituicao.org', 'senhaSegura123', '22233344455', 1, 1),
(0, 'Carlos Assistente', 'carlos@instituicao.org', 'senhaForte456', '33344455566', 1, 1);

-- Inserindo registros na tabela instituicao_familia
INSERT INTO instituicao_familia (fk_instituicao, fk_familia)
VALUES 
(1, 1),
(1, 2);