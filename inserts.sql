-- Inserts para a Tabela familia
INSERT INTO `consol`.`familia` (`id_familia`, `nome`, `cep`, `numero_casa`, `renda`, `flag_retirada`)
VALUES
(1, 'Família Silva', '12345678', 101, 2500.00, 0),
(2, 'Família Souza', '87654321', 202, 3000.00, 1);

-- Inserts para a Tabela titular
INSERT INTO `consol`.`titular` (`id_titular`, `data_cadastro`, `nome`, `rg`, `cpf`, `data_nascimento`, `telefone1`, `telefone2`, `estado_civil`, `escolaridade`, `trabalhando`, `ocupacao`, `fk_familia`)
VALUES
(1, '2024-01-15', 'João Silva', '123456789', '12345678901', '1980-05-10', '11987654321', '11987654322', 'Casado', 'Ensino Médio', 1, 'Pedreiro', 1),
(2, '2024-02-20', 'Maria Souza', '987654321', '10987654321', '1975-08-20', '21987654321', '21987654322', 'Solteira', 'Ensino Superior', 0, 'Professora', 2);

-- Inserts para a Tabela registroVisita
INSERT INTO `consol`.`registroVisita` (`id_registro_visita`, `data_visita`, `descricao`, `fk_titular`)
VALUES
(1, '2024-03-10', 'Primeira visita realizada com sucesso.', 1),
(2, '2024-04-12', 'Visita de acompanhamento.', 2);

-- Inserts para a Tabela despesa
INSERT INTO `consol`.`despesa` (`tipo`, `gasto`, `fk_familia`)
VALUES
('Aluguel', 1500.00, 1),
('Supermercado', 800.00, 2);

-- Inserts para a Tabela beneficio
INSERT INTO `consol`.`beneficio` (`nome`, `valor`, `fk_titular`)
VALUES
('Bolsa Família', 600.00, 1),
('Auxílio Emergencial', 300.00, 2);

-- Inserts para a Tabela instituicao
INSERT INTO `consol`.`instituicao` (`nome_instituicao`, `cep`, `numero_imovel`, `descricao`, `foto_perfil`)
VALUES
('Casa de Apoio', '12345000', '500', 'Instituição de apoio a famílias carentes.', NULL),
('Lar da Criança', '98765000', '600', 'Abrigo para crianças em situação de risco.', NULL);

-- Inserts para a Tabela doacao
INSERT INTO `consol`.`doacao` (`id_doacoes`, `descricao`, `status_doacao`, `data_doacao`, `flag_doacao_entregue`, `fk_instituicao`, `fk_titular`)
VALUES
(1, 'Doação de alimentos', 'P', '2024-05-01 10:00:00', 'Sim', 1, 1),
(2, 'Doação de roupas', 'C', '2024-05-02 11:00:00', 'Não', 2, 2);

-- Inserts para a Tabela usuario
INSERT INTO `consol`.`usuario` (`id_usuario`, `coordernador`, `nome_usuario`, `email`, `senha`, `cpf`, `flag_aprovado`, `fk_instituicao`)
VALUES
(1, 1, 'Carlos Oliveira', 'carlos@exemplo.com', 'senha123', '12345678900', 1, 1),
(2, 0, 'Ana Santos', 'ana@exemplo.com', 'senha456', '98765432100', 0, 2);

-- Inserts para a Tabela instituicao_familia
INSERT INTO `consol`.`instituicao_familia` (`fk_instituicao`, `fk_familia`)
VALUES
(1, 1),
(2, 2);