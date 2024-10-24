-- Inserir dados na tabela `familia`
INSERT INTO `consol`.`familia` (`nome`, `cep`, `numero_casa`, `renda`, `flag_retirada`)
VALUES ('Família Silva', '12345678', 101, 1500.00, 0),
       ('Família Souza', '87654321', 202, 2500.00, 1),
       ('Família Oliveira', '11223344', 303, 1800.50, 0);

-- Inserir dados na tabela `titular`
INSERT INTO `consol`.`titular` (`data_cadastro`, `nome`, `rg`, `cpf`, `data_nascimento`, `telefone1`, `telefone2`, `estado_civil`, `escolaridade`, `trabalhando`, `ocupacao`, `fk_familia`)
VALUES ('2024-01-15', 'João Silva', '123456789', '12345678901', '1980-05-10', '11987654321', '11987654322', 'Solteiro', 'Ensino Médio', 1, 'Motorista', 1),
       ('2024-02-10', 'Maria Souza', '987654321', '10987654321', '1975-03-22', '11912345678', '11912345679', 'Casada', 'Superior Completo', 1, 'Professora', 2),
       ('2024-03-05', 'Pedro Oliveira', '111222333', '22334455667', '1990-07-30', '11933445566', '11933445577', 'Casado', 'Ensino Técnico', 0, 'Desempregado', 3);

-- Inserir dados na tabela `despesa`
INSERT INTO `consol`.`despesa` (`tipo`, `gasto`, `fk_familia`)
VALUES ('Aluguel', 500.00, 1),
       ('Água', 120.00, 1),
       ('Energia', 150.50, 2),
       ('Internet', 100.00, 3);

-- Inserir dados na tabela `beneficio`
INSERT INTO `consol`.`beneficio` (`nome`, `valor`, `fk_titular`)
VALUES ('Bolsa Família', 200.00, 1),
       ('Auxílio Emergencial', 150.00, 2),
       ('Vale Gás', 100.00, 3);

-- Inserir dados na tabela `instituicao`
INSERT INTO `consol`.`instituicao` (`nome_instituicao`, `cep`, `numero_imovel`, `descricao`, `foto_perfil`)
VALUES ('Instituto Esperança', '33445566', '500', 'Instituição de caridade voltada para famílias carentes.', 'foto1.jpg'),
       ('Casa de Apoio Social', '55667788', '600', 'Organização de apoio às comunidades.', 'foto2.jpg');

-- Inserir dados na tabela `doacao`
INSERT INTO `consol`.`doacao` (`descricao`, `data_doacao`, `flag_doacao_entregue`, `fk_instituicao`, `fk_titular`)
VALUES ('Cesta básica', '2024-09-20 14:30:00', 1, 1, 1),
       ('Roupas', '2024-08-15 10:00:00', 1, 2, 2);

-- Inserir dados na tabela `usuario`
INSERT INTO `consol`.`usuario` (`coordenador`, `nome_usuario`, `email`, `senha`, `cpf`, `flag_aprovado`, `fk_instituicao`)
VALUES (1, 'Carlos Andrade', 'carlos@esperanca.org', 'senhaSegura123', '12312312312', 1, 1),
       (0, 'Ana Clara', 'ana@apoiosocial.org', 'senha1234', '98798798798', 1, 2);

-- Inserir dados na tabela `instituicao_familia`
INSERT INTO `consol`.`instituicao_familia` (`fk_instituicao`, `fk_familia`)
VALUES (1, 1),
       (2, 2),
       (1, 3);