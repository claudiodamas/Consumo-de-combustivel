--Começando olhando para os dados em geral 

select*
	from ['Fuel_Consumption_2000-2022$']



--- Arrumando informações duplicadas 

UPDATE ['Fuel_Consumption_2000-2022$']
SET VEHICLE_CLASS = 'STATION WAGON - SMALL'
WHERE VEHICLE_CLASS = 'Station wagon: Small';

UPDATE ['Fuel_Consumption_2000-2022$']
SET VEHICLE_CLASS = 'SUV - SMALL'
WHERE VEHICLE_CLASS = 'SUV: Small';

UPDATE ['Fuel_Consumption_2000-2022$']
SET VEHICLE_CLASS = 'VAN - PASSENGER'
WHERE VEHICLE_CLASS = 'Van: Passenger';

UPDATE ['Fuel_Consumption_2000-2022$']
SET VEHICLE_CLASS = 'SUV - STANDARD'
WHERE VEHICLE_CLASS = 'SUV: Standard';

UPDATE ['Fuel_Consumption_2000-2022$']
SET VEHICLE_CLASS = 'PICKUP TRUCK - STANDARD'
WHERE VEHICLE_CLASS = 'Pickup truck: Standard';

UPDATE ['Fuel_Consumption_2000-2022$']
SET VEHICLE_CLASS = 'PICKUP TRUCK - SMALL'
WHERE VEHICLE_CLASS = 'Pickup truck: Small';

UPDATE ['Fuel_Consumption_2000-2022$']
SET VEHICLE_CLASS = 'PICKUP TRUCK - SMALL'
WHERE VEHICLE_CLASS = 'Pickup truck: Small';

UPDATE ['Fuel_Consumption_2000-2022$']
SET VEHICLE_CLASS = 'STATION WAGON - MID-SIZE'
WHERE VEHICLE_CLASS = 'Station wagon: Mid-size';

UPDATE ['Fuel_Consumption_2000-2022$']
SET VEHICLE_CLASS = UPPER(VEHICLE_CLASS);


--- Quando fui realizar a vizualisação obtive problemas com a data, 
---solucionando assim com uma converção de 'varchar' para 'float'

ALTER TABLE ['Fuel_Consumption_2000-2022$']
ALTER COLUMN FUEL_CONSUMPTION FLOAT


----Análise de consumo de combustível


--- Comparando o consumo de combustível relaciado a cada modelo de carro



SELECT 
	model,
	AVG(cast( FUEL_CONSUMPTION as float) )AS avg_total
FROM 
	['Fuel_Consumption_2000-2022$']
GROUP BY 
	 modeL
ORDER BY 
	avg_total


--- Analisando a influência da classe do carro no consumo de combustível
 
 
 
 SELECT 
	VEHICLE_CLASS, 
	AVG(cast( FUEL_CONSUMPTION as float) )AS avg_total
 FROM 
	['Fuel_Consumption_2000-2022$']
GROUP BY 
    VEHICLE_CLASS
ORDER BY 
    avg_total





--- Comparando  o consumo de combustível por tamanho do motor



SELECT DISTINCT
	(ENGINE_SIZE),
	AVG(cast( FUEL_CONSUMPTION as float) )AS avg_total
FROM 
	['Fuel_Consumption_2000-2022$']
GROUP BY 
	ENGINE_SIZE
ORDER BY
	ENGINE_SIZE;



--- Comparando o consumo de combustível em diferentes quantidades de cilindros 



SELECT DISTINCT
	(CYLINDERS),
	AVG( cast( FUEL_CONSUMPTION as float) )AS avg_total
FROM 
	['Fuel_Consumption_2000-2022$']
GROUP BY 
	CYLINDERS
ORDER BY 
	avg_total;



	---Análise de emissão

---- Analisando aemissão de combustível por modelo de carro



SELECT 
	model, 
	AVG( EMISSIONS ) AS EMISSION_AMOUNT, 
	AVG(cast( FUEL_CONSUMPTION as float) )AS avg_total
 FROM 
    ['Fuel_Consumption_2000-2022$']
GROUP BY 
    model
ORDER BY 
    EMISSION_AMOUNT




--- Comparando a emissão em diferentes classes de veículo

SELECT
	COUNT (MODEL),
	VEHICLE_CLASS, 
	AVG( EMISSIONS ) AS EMISSION_AMOUNT
FROM 
	['Fuel_Consumption_2000-2022$']
GROUP BY 
	VEHICLE_CLASS
ORDER BY
	EMISSION_AMOUNT;




--- Comaparando a Emissão em diferentes tamanhos de motor





SELECT DISTINCT 
	(ENGINE_SIZE),
	AVG( EMISSIONS ) AS EMISSION_AMOUNT
FROM 
	['Fuel_Consumption_2000-2022$']
GROUP BY 
	ENGINE_SIZE
ORDER BY 
	EMISSION_AMOUNT;



--- Comparando as emissões em diferentes quantdades de cilindros 



SELECT DISTINCT
	(CYLINDERS),
	AVG( EMISSIONS ) AS EMISSION_AMOUNT
FROM 
	['Fuel_Consumption_2000-2022$']
GROUP BY 
	CYLINDERS
ORDER BY 
	EMISSION_AMOUNT;



---Criando view para exportar ao PowerBI

CREATE VIEW VW_FUEL_CONSUMPTION AS
SELECT 
	VEHICLE_CLASS, 
	CONVERT (float(4), YEAR ,3) AS YEAR,
	MAKE,
	MODEL, 
	ENGINE_SIZE,
	CYLINDERS,
	TRANSMISSION,
	FUEL_CONSUMPTION,
	EMISSIONS
FROM
	['Fuel_Consumption_2000-2022$']

	









	
   