-- Script Negócio 




-- 1) Exiba todos os clientes junto com o nome do plano que eles estão utilizando atualmente. Inclua informações como nome do cliente, sobrenome, e o nome do plano.

-- Objetivo: Verificar a distribuição de clientes entre os diferentes planos de locação.


-- Criando uma CTE (Common Table Expression) chamada 'dataAtualizada' para obter a última data de atualização do plano de cada cliente.
-- A função MAX(dataInicial) retorna a data mais recente de início de plano, agrupada por cliente.

WITH dataAtualizada AS (
    SELECT 
        id_clientes,
        MAX(dataInicial) AS ultima_data
    FROM pagamentos
    GROUP BY id_clientes
)


-- Realiza a consulta principal com os dados desejados.
SELECT 
    cli.nome,           																						-- Nome do cliente
    cli.sobrenome,      																						-- Sobrenome do cliente
    pla.nomePlano,     																							-- Nome do plano mais recente do cliente
    pag.dataInicial    																							-- Data de início do plano mais recente
FROM 
    clientes AS cli 																							-- Faz o primeiro LEFT JOIN para conectar cada cliente à sua última data de atualização de plano.
LEFT JOIN dataAtualizada AS dta
    ON cli.id_clientes = dta.id_clientes 																		-- Faz um segundo LEFT JOIN com a tabela de pagamentos para recuperar o pagamento que corresponde à data de atualização mais recente do cliente.
LEFT JOIN pagamentos AS pag
    ON cli.id_clientes = pag.id_clientes AND pag.dataInicial = dta.ultima_data  								-- Faz o terceiro LEFT JOIN com a tabela de planos para trazer o nome do plano associado ao pagamento.
LEFT JOIN planos AS pla
    ON pag.id_plano = pla.id_plano;

-- OBS: Essa consulta exibe para cada cliente o plano mais recente que ele contratou, juntamente com a data de início desse plano.




-- 2) Clientes com Mais de Duas Contratações
-- Liste os clientes que fizeram mais de duas contratações de locação. Exiba o nome completo e a quantidade de vezes que eles contrataram um serviço da LocaCar.

-- Objetivo: Identificar clientes fiéis, que realizam contratações frequentes.

SELECT
    CONCAT(cli.nome, ' ', cli.sobrenome) AS 'Nome Completo',  				 -- Exibe o nome completo do cliente
    COUNT(pag.id_pagamentos) AS 'Total de contratações'           			 -- Conta o total de contratações (pagamentos)
FROM 
    pagamentos AS pag
LEFT JOIN 
    clientes AS cli
    ON pag.id_clientes = cli.id_clientes
GROUP BY 
    cli.id_clientes  														-- Agrupa por ID do cliente
HAVING 
    COUNT(pag.id_pagamentos) > 2;  											-- Filtra clientes com mais de 2 contratações


-- 3)  Valor Total de Locação por Cliente
-- Calcule o valor total gasto por cada cliente em suas locações. A consulta deve exibir o nome completo do cliente e o valor total pago (soma das colunas valorCaucao e valorMensalidade de todas as locações).

-- Objetivo: Obter uma visão dos clientes que mais gastam com a empresa.''


SELECT 
    CONCAT(cli.nome, ' ', cli.sobrenome) AS 'Nome Completo',  				-- Concatena nome e sobrenome
    SUM(pag.valorMensalidade + pag.valorCaucao) AS 'Valor Total'  			-- Soma mensalidade e caução para calcular o valor total
    
FROM pagamentos AS pag
LEFT JOIN clientes AS cli  													-- Faz a junção entre pagamentos e clientes
    ON pag.id_clientes = cli.id_clientes
GROUP BY cli.id_clientes 													-- Agrupa os resultados por cliente
ORDER BY 'Valor Total' DESC;  												-- Ordena pela soma do valor total, em ordem decrescente


-- (4 Planos Mais Contratados
-- Exiba o número de contratações para cada plano. Liste o nome do plano e a quantidade de contratações.

-- Objetivo: Identificar quais planos são mais populares.



SELECT
    pla.nomePlano AS 'Nome do Plano',										-- Seleciona o nome do plano
    COUNT(pag.id_pagamentos) AS 'Quantidade de Contratações' 				-- Conta quantas vezes o plano foi contratado
    
FROM pagamentos AS pag
LEFT JOIN planos AS pla 													-- Faz a junção entre pagamentos e planos
    ON pag.id_plano = pla.id_plano
GROUP BY pla.nomePlano  													-- Agrupa os resultados pelo nome do plano
ORDER BY COUNT(pag.id_pagamentos) DESC;  									-- Ordena pela quantidade de contratações, em ordem decrescente


-- 5) Média de Valor Gasto por Plano
-- Calcule a média de valor gasto por clientes em cada plano,
-- considerando a soma do valorCaucao e valorMensalidade de cada contrato.

-- Objetivo: Comparar a lucratividade média de cada plano oferecido.

SELECT
    pla.nomePlano,  -- Seleciona o nome do plano
    AVG(pag.valorMensalidade + pag.valorCaucao) AS 'Média de Valor Gasto'   -- Calcula a média do total gasto (mensalidade + caução) por plano

FROM pagamentos AS pag  													-- A tabela de pagamentos é a fonte principal para os dados de locação
LEFT JOIN planos AS pla  													-- Faz uma junção com a tabela de planos para obter os nomes dos planos
    ON pag.id_plano = pla.id_plano  										-- A condição da junção é que o id_plano em pagamentos deve corresponder ao id_plano em planos
GROUP BY pla.nomePlano; 												    -- Agrupa os resultados pelo nome do plano, permitindo calcular a média para cada um




-- 6) Clientes que Utilizam o Plano para Negativados
-- Liste todos os clientes que estão utilizando o plano destinado a clientes negativados. A consulta deve incluir o nome completo, status do pagamento e valor da última contratação.


-- 6) Clientes que Utilizam o Plano para Negativados
-- Liste todos os clientes que estão utilizando o plano destinado a clientes negativados. 
-- A consulta deve incluir o nome completo, status do pagamento e valor da última contratação.


SELECT
	CONCAT(cli.nome, ' ' , cli.sobrenome) AS 'Nome Completo',                                                     -- Concatena o nome e sobrenome do cliente
    pag.statusPagamento AS 'Status',                                                                              -- Seleciona o status do pagamento
    pla.nomePlano AS 'Plano',                                													  -- Seleciona o nome do plano
    MAX(dataInicial) AS 'Data Atualizada'                    													  -- Seleciona a última data de contratação

FROM pagamentos AS pag
LEFT JOIN clientes AS cli
	ON pag.id_clientes = cli.id_clientes                    														 -- Realiza o join entre pagamentos e clientes
LEFT JOIN planos AS pla
	ON pag.id_plano = pla.id_plano                          														 -- Realiza o join entre pagamentos e planos
GROUP BY CONCAT(cli.nome, ' ', cli.sobrenome),             															 -- Agrupa pelo nome completo do cliente
         pag.statusPagamento,                            															 -- Agrupa também pelo status do pagamento
         pla.nomePlano                                   															 -- Agrupa pelo nome do plano
HAVING pla.nomePlano = 'Amigável';                      														     -- Filtra apenas os registros do plano 'Amigável'
   
    

-- Objetivo: Monitorar a quantidade de clientes negativados que estão utilizando o plano especial.




-- 7) Locações Inativas
-- Exiba todas as locações que estão com o status de pagamento "Inativo". 
-- A consulta deve incluir o nome do cliente, o nome do plano, e as datas de início e fim da locação.

-- Objetivo: Identificar locações com status de pagamento inativo, que podem precisar de acompanhamento.


SELECT
	cli.nome AS 'Nome do Cliente',                      											    -- Seleciona o nome do cliente
    pla.nomePlano AS 'Plano',                             												-- Seleciona o nome do plano
    pag.dataInicial AS 'Data Inicial',                    												-- Seleciona a data de início da locação
    pag.dataFinal AS 'Data Final',                       												-- Seleciona a data de fim da locação
    pag.statusPagamento AS 'Status Pagamento'          													-- Seleciona o status do pagamento

FROM pagamentos AS pag
LEFT JOIN clientes AS cli
	ON pag.id_clientes = cli.id_clientes                												 -- Realiza o join entre pagamentos e clientes
LEFT JOIN planos AS pla
	ON pag.id_plano = pla.id_plano                      												 -- Realiza o join entre pagamentos e planos
WHERE pag.statusPagamento = 'Inativo';                  												 -- Filtra apenas as locações com status 'Inativo'



-- 8) Análise de Pagamentos Inativos
-- Liste todas as locações onde o status de pagamento é "Inativo". Exiba o nome do cliente, o valor total da locação e o método de pagamento.

SELECT
	cli.nome AS 'Nome do Cliente',                       										 -- Seleciona o nome do cliente
    pag.valorTotal,                                      										 -- Seleciona o valor total da locação
    pag.metodoPagamento,                                 										 -- Seleciona o método de pagamento
    pag.statusPagamento AS 'Status Pagamento'            										 -- Seleciona o status do pagamento

FROM pagamentos AS pag
LEFT JOIN clientes AS cli
	ON pag.id_clientes = cli.id_clientes                 										 -- Realiza o join entre pagamentos e clientes
LEFT JOIN planos AS pla
	ON pag.id_plano = pla.id_plano                       										 -- Realiza o join entre pagamentos e planos
WHERE pag.statusPagamento = 'Inativo';                 										     -- Filtra por status de pagamento "Inativo"


-- 9) Mês com Maior Receita de Locação
-- Calcule o mês que gerou a maior receita de locação para a empresa. 
-- A receita deve ser a soma das colunas valorCaucao e valorMensalidade de todas as locações em um determinado mês.

SELECT 
	MONTH(pag.DataInicial) AS Mês,                      			-- Extrai o mês da data de início da locação
    SUM(valorCaucao + valorMensalidade) AS VALORTOTAL  				-- Calcula a soma do valorCaucao e valorMensalidade como receita total por mês
FROM pagamentos AS pag
GROUP BY Mês                                       					-- Agrupa os resultados por mês
ORDER BY VALORTOTAL DESC     ;                        				-- Ordena os resultados em ordem decrescente pelo valor total





-- 10) Locações por Origem de Marca
-- Exiba a quantidade de locações agrupadas pela origem dos carros. 
-- A consulta deve incluir a origem do carro (nacional ou importado) e a quantidade de locações.

-- Objetivo: Analisar a demanda por veículos de diferentes origens.

SELECT
    car.nacionalidade AS Nacionalidade,                    -- Seleciona a nacionalidade do carro
    COUNT(pag.id_pagamentos) AS Qtd_locacao                -- Conta o número de locações para cada nacionalidade
FROM 
    pagamentos AS pag                                       -- Tabela de pagamentos
LEFT JOIN 
    carro AS car ON pag.id_carro = car.id_carro           -- Realiza o join entre pagamentos e carros, usando o ID do carro
GROUP BY 
    car.nacionalidade;                                     -- Agrupa os resultados pela nacionalidade do carro




