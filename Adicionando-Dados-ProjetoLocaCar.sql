-- ADICIONANDO DADOS Projeto LocaCar

INSERT INTO carro (nomeCarro, marca, origem, nacionalidade, descricao) VALUES
('Evoque', 'Land Rover', 'Reino Unido', 'Importado', 'SUV de luxo compacto'),
('Onix', 'Chevrolet', 'Brasil', 'Nacional', 'Hatchback popular'),
('Civic', 'Honda', 'Japão', 'Importado', 'Sedã médio confiável'),
('HB20', 'Hyundai', 'Coreia do Sul', 'Nacional', 'Compacto urbano econômico'),
('Corolla', 'Toyota', 'Japão', 'Importado', 'Sedã médio de alta durabilidade'),
('Renegade', 'Jeep', 'EUA', 'Nacional', 'SUV compacto aventureiro'),
('Golf', 'Volkswagen', 'Alemanha', 'Importado', 'Hatchback esportivo e moderno'),
('Uno', 'Fiat', 'Itália', 'Nacional', 'Compacto acessível e prático');

INSERT INTO inventario (id_carro, modelo, transmissao, motor, combustivel, anoModelo, cor)
VALUES 
    (1, 'Hatch', 'Manual', '1.0', 'Gasolina', 2022, 'Vermelho'),
    (2, 'Sedan', 'Automático', '2.0', 'Etanol', 2021, 'Preto'),
    (3, 'SUV', 'Automático', '2.5', 'Gasolina', 2023, 'Branco'),
    (4, 'Picape', 'Manual', '3.0', 'Diesel', 2020, 'Azul'),
    (5, 'Perua', 'Automático', '1.8', 'Gasolina', 2019, 'Prata'),
    (6, 'Cupê', 'Manual', '2.0', 'Gasolina', 2021, 'Verde'),
    (7, 'Minivan', 'Automático', '2.4', 'Etanol', 2022, 'Cinza'),
    (8, 'Esportivo', 'Manual', '3.0', 'Gasolina', 2023, 'Amarelo');




INSERT INTO clientes (nome, sobrenome, endereco, email, telefone, statusCliente)
 VALUES
	('João', 'Silva', 'Av. Paulista, 1000', 'joao@example.com', '11987654321', 'Aprovado'),
	('Maria', 'Oliveira', 'Rua das Flores, 500', 'maria@example.com', '11987654322', 'Reprovado'),
	('Carlos', 'Santos', 'Av. Brasil, 750', 'carlos@example.com', '11987654323', 'Aprovado'),
	('Ana', 'Souza', 'Rua dos Limoeiros, 200', 'ana@example.com', '11987654324', 'Reprovado'),
	('Lucas', 'Mendes', 'Rua do Comércio, 300', 'lucas@example.com', '11987654325', 'Aprovado'),
	('Julianaa', 'Pereira', 'Rua dos Jacarandás, 10', 'juliana@example.com', '11987654326', 'Aprovado'),
	('Fernando', 'Almeida', 'Av. dos Bandeirantes, 1500', 'fernando@example.com', '11987654327', 'Reprovado'),
	('Patrícia', 'Lima', 'Rua das Palmeiras, 80', 'patricia@example.com', '11987654328', 'Aprovado'),
	('Roberto', 'Nogueira', 'Rua da Liberdade, 75', 'roberto@example.com', '11987654329', 'Reprovado'),
	('Fernanda', 'Costa', 'Av. Brasil, 2000', 'fernanda@example.com', '11987654330', 'Aprovado'),
	('Eduardo', 'Teixeira', 'Rua da Esperança, 90', 'eduardo@example.com', '11987654331', 'Reprovado'),
	('Mariana', 'Silva', 'Av. Ipiranga, 500', 'mariana@example.com', '11987654332', 'Aprovado'),
	('Vinícius', 'Barbosa', 'Rua das Flores, 300', 'vinicius@example.com', '11987654333', 'Reprovado'),
	('Sofia', 'Martins', 'Rua do Sol, 45', 'sofia@example.com', '11987654334', 'Aprovado'),
	('Thiago', 'Ribeiro', 'Av. da República, 600', 'thiago@example.com', '11987654335', 'Reprovado'),
	('Isabela', 'Cruz', 'Rua das Orquídeas, 110', 'isabela@example.com', '11987654336', 'Aprovado'),
	('André', 'Cavalcante', 'Rua do Comércio, 888', 'andre@example.com', '11987654337', 'Reprovado'),
	('Amanda', 'Pires', 'Av. das Américas, 900', 'amanda@example.com', '11987654338', 'Aprovado'),
	('Gabriel', 'Moraes', 'Rua do Norte, 100', 'gabriel@example.com', '11987654339', 'Reprovado'),
	('Rafael', 'Rios', 'Av. São João, 500', 'rafael@example.com', '11987654340', 'Aprovado'),
	('Bruno', 'Figueiredo', 'Rua da Esperança, 200', 'bruno@example.com', '11987654341', 'Reprovado'),
	('Carla', 'Silva', 'Rua do Porto, 350', 'carla@example.com', '11987654342', 'Aprovado'),
	('Leonardo', 'Azevedo', 'Rua do Campo, 600', 'leonardo@example.com', '11987654343', 'Reprovado'),
	('Tatiane', 'Nunes', 'Av. da Praia, 200', 'tatiane@example.com', '11987654344', 'Aprovado'),
	('Lucas', 'Souza', 'Rua da Rua Verde, 150', 'lucas2@example.com', '11987654345', 'Reprovado'),
	('Beatriz', 'Cardoso', 'Rua da Alegria, 500', 'beatriz@example.com', '11987654346', 'Aprovado');




INSERT INTO planos (nomePlano, duracao, valorCaucao, valorLocacao, seguroBasico, coberturaAssistencia, multaExcessoKM, descricao) VALUES
('Básico', '30 dias', 500.00, 1500.00, 'Seguro básico', 'Assistência 24h', 2.50, 'Plano básico sem extras'),
('Intermediário', '30 dias', 1000.00, 2500.00, 'Seguro intermediário', 'Assistência completa', 2.00, 'Plano intermediário'),
('Premium', '30 dias', 2000.00, 4000.00, 'Seguro completo', 'Assistência premium', 1.50, 'Plano premium com todos os benefícios'),
('Amigável', '30 dias', 3000.00, 5000.00, 'Seguro básico', 'Assistência 24h', 5.00, 'Plano para clientes negativados');



INSERT INTO pagamentos (dataInicial, dataFinal, valorCaucao, valorMensalidade, id_clientes, id_plano,  valorTotal, metodoPagamento, statusPagamento, dataPagamento, id_carro)
 VALUES 
	('2024-01-05', '2024-02-04', '700.00', '2000.00', '1', '2', '2700.00', 'Cartão de Crédito', 'Ativo', '2024-01-05 09:00:00', '1'),
	('2024-02-10', '2024-03-11', '900.00', '2400.00', '1', '3', '3300.00', 'Dinheiro', 'Ativo', '2024-02-10 15:45:00', '3'),
	('2024-03-20', '2024-04-19', '600.00', '1800.00', '1', '4', '2400.00', 'Transferência Bancária', 'Ativo', '2024-03-20 12:15:00', '2'),
	('2024-01-20', '2024-02-19', '800.00', '2200.00', '2', '3', '3000.00', 'Transferência Bancária', 'Ativo', '2024-01-20 11:30:00', '2'),
	('2024-02-15', '2024-03-16', '400.00', '1200.00', '2', '4', '1600.00', 'Cartão de Débito', 'Ativo', '2024-02-15 14:00:00', '1'),
	('2024-05-10', '2024-06-09', '1000.00', '2500.00', '2', '1', '3500.00', 'Dinheiro', 'Ativo', '2024-05-10 10:00:00', '3'),
	('2024-03-01', '2024-03-31', '500.00', '1500.00', '3', '2', '2000.00', 'Cartão de Crédito', 'Ativo', '2024-03-01 11:00:00', '6'),
	('2024-03-10', '2024-04-09', '500.00', '1500.00', '3', '1', '2000.00', 'Dinheiro', 'Ativo', '2024-03-10 16:00:00', '5'),
	('2024-06-15', '2024-07-14', '600.00', '1800.00', '4', '3', '2400.00', 'Cartão de Crédito', 'Ativo', '2024-06-15 12:00:00', '4'),
	('2024-08-01', '2024-08-31', '1000.00', '2500.00', '5', '2', '3500.00', 'Dinheiro', 'Ativo', '2024-08-01 09:00:00', '8'),
	('2024-07-05', '2024-08-04', '600.00', '1800.00', '6', '4', '2400.00', 'Transferência Bancária', 'Ativo', '2024-07-05 10:15:00', '6'),
	('2024-09-01', '2024-09-30', '900.00', '2700.00', '7', '1', '3600.00', 'Cartão de Débito', 'Inativo', '2024-09-01 11:30:00', '8'),
	('2024-10-01', '2024-10-31', '800.00', '2500.00', '8', '2', '3300.00', 'Dinheiro', 'Ativo', '2024-10-01 10:45:00', '4'),
	('2024-11-01', '2024-11-30', '400.00', '1200.00', '9', '3', '1600.00', 'Cartão de Crédito', 'Ativo', '2024-11-01 14:00:00', '2'),
	('2024-11-15', '2024-12-15', '600.00', '1800.00', '10', '1', '2400.00', 'Transferência Bancária', 'Ativo', '2024-11-15 12:30:00', '2'),
	('2024-12-01', '2024-12-31', '900.00', '2700.00', '10', '2', '3600.00', 'Cartão de Crédito', 'Ativo', '2024-12-01 15:00:00', '2'),
	('2024-12-10', '2025-01-09', '800.00', '2500.00', '10', '3', '3300.00', 'Dinheiro', 'Ativo', '2024-12-10 10:00:00', '3'),
	('2024-01-10', '2024-02-09', '500.00', '1500.00', '11', '1', '2000.00', 'Cartão de Crédito', 'Ativo', '2024-01-10 09:30:00', '1'),
	('2024-03-15', '2024-04-14', '600.00', '1800.00', '11', '2', '2400.00', 'Dinheiro', 'Ativo', '2024-03-15 14:00:00', '8'),
	('2024-02-05', '2024-03-06', '700.00', '2000.00', '12', '3', '2700.00', 'Transferência Bancária', 'Ativo', '2024-02-05 12:45:00', '8'),
	('2024-04-10', '2024-05-10', '800.00', '2200.00', '12', '4', '3000.00', 'Cartão de Débito', 'Ativo', '2024-04-10 11:15:00', '8'),
	('2024-05-05', '2024-06-04', '400.00', '1200.00', '13', '1', '1600.00', 'Dinheiro', 'Ativo', '2024-05-05 10:30:00', '4'),
	('2024-06-15', '2024-07-14', '500.00', '1500.00', '13', '2', '2000.00', 'Cartão de Crédito', 'Ativo', '2024-06-15 12:00:00', '5'),
	('2024-07-01', '2024-07-31', '600.00', '1800.00', '14', '3', '2400.00', 'Transferência Bancária', 'Ativo', '2024-07-01 10:00:00', '5'),
	('2024-07-10', '2024-08-09', '800.00', '2500.00', '15', '1', '3300.00', 'Cartão de Débito', 'Ativo', '2024-07-10 14:30:00', '7'),
	('2024-08-15', '2024-09-14', '900.00', '2700.00', '15', '2', '3600.00', 'Dinheiro', 'Ativo', '2024-08-15 12:45:00', '7'),
	('2024-09-05', '2024-10-05', '700.00', '2000.00', '16', '3', '2700.00', 'Cartão de Crédito', 'Ativo', '2024-09-05 09:30:00', '6'),
	('2024-09-10', '2024-10-10', '600.00', '1800.00', '17', '4', '2400.00', 'Transferência Bancária', 'Ativo', '2024-09-10 11:15:00', '5'),
	('2024-10-15', '2024-11-14', '800.00', '2200.00', '17', '1', '3000.00', 'Cartão de Débito', 'Ativo', '2024-10-15 14:00:00', '7'),
	('2024-11-01', '2024-11-30', '1000.00', '2500.00', '18', '2', '3500.00', 'Dinheiro', 'Ativo', '2024-11-01 10:00:00', '1'),
	('2024-12-05', '2024-12-30', '800.00', '2200.00', '18', '3', '3000.00', 'Cartão de Crédito', 'Ativo', '2024-12-05 11:30:00', '4'),
	('2024-12-10', '2025-01-09', '600.00', '1800.00', '19', '2', '2400.00', 'Cartão de Débito', 'Ativo', '2024-12-10 10:00:00', '2'),
	('2025-01-01', '2025-01-31', '1000.00', '2500.00', '19', '3', '3500.00', 'Transferência Bancária', 'Ativo', '2025-01-01 15:00:00', '3');

