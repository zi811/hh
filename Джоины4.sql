
-- вывести персональные данные клиента.
-- Был смысл объединить две таблицы в одну
select
	c.firstname,
	c.lastname,
	p.gender,
	p.birthday,
	p.hometown,
	c.email,
	c.phone 
from profiles p 
join client c on p.client_id = c.id; 

-- вывести фио и дату клиента с одобренными заявками и суммой кредита

select
	c.id,
	c.firstname,
	c.lastname,
	r.status,
	r.sum_credit 
from profiles p 
join client c on p.client_id = c.id
join request r on p.request_id = r.id
where r.status = 'Одобрено';

-- Подсчитать количество и суммы одобренных, и отказных заявок

SELECT 
	r.status,
	COUNT(DISTINCT p.request_id) as 'Количество заявок',
	SUM(DISTINCT r.sum_credit) as 'Сумма заявок'
FROM profiles p 
JOIN request r on p.request_id = r.id
GROUP BY r.status 


-- Выгрузить одобренных клиентов со ставкой ниже 15%

SELECT
	c.firstname,
	c.lastname, 
	c.phone,
	r.status,
	p.`condition` 
FROM request r
JOIN profiles pr on pr.request_id = r.id 
JOIN products p ON p.product_id = r.products_product_id
JOIN client c on c.id = pr.client_id
WHERE r.status = 'Одобрено' and p.`condition` <= 15;


-- Выгрузить клиента с cамой низкой ставкой 

SELECT
	c.firstname,
	c.lastname, 
	c.phone,
	r.status,
	p.`condition` 
FROM request r
JOIN profiles pr on pr.request_id = r.id 
JOIN products p ON p.product_id = r.products_product_id
JOIN client c on c.id = pr.client_id
ORDER BY p.`condition` 
LIMIT 1
;



-- Найти статус заявки покупателя, стоимость и адрес на самую дорогую квартиру

SELECT 
	c.firstname ,
	c.lastname,
	r.status,
	r.sum_credit,
	o.object_adress,
	o.price 
FROM `object` o 
join request r ON o.id = r.object_id
JOIN profiles p on r.id = p.request_id 
JOIN client c on c.id = p.client_id 
ORDER BY price DESC
LIMIT 1;


------------------------------------------------------------------------------------------------

--Предствления--




-- Создать базу для сотрудников call центра, 


CREATE VIEW call_center_v AS
SELECT
	c.firstname,
	c.lastname,
	c.phone,
	c.email, 
	r.status,
	r.sum_credit,
	r.payment 
FROM profiles p 
JOIN client c ON p.client_id = c.id
JOIN request r ON p.request_id = r.id
;


SELECT* FROM call_center_v ;


-- выгрузить отчет для аналиитиков по количесту одобрений и отказов
CREATE VIEW analytical_report_v AS

SELECT 
	r.status,
	COUNT(DISTINCT p.request_id) as 'Количество заявок',
	SUM(DISTINCT r.sum_credit) as 'Сумма заявок'
FROM profiles p 
JOIN request r on p.request_id = r.id
GROUP BY r.status;


SELECT * FROM analytical_report_v;

--------------------------------------------------------------------------------------------------

--Процедуры--


-- Выгрузить одобренных клиентов со ставкой ниже x%

DELIMITER //

DROP PROCEDURE IF EXISTS procedure_1_p//
CREATE PROCEDURE procedure_1_p(x int)
BEGIN
	SELECT
		c.firstname,
		c.lastname, 
		c.phone,
		r.status,
		p.`condition` 
	FROM request r
	JOIN profiles pr on pr.request_id = r.id 
	JOIN products p ON p.product_id = r.products_product_id
	JOIN client c on c.id = pr.client_id
	WHERE r.status = 'Одобрено' and p.`condition` <= x;

END//
DELIMITER ;

CALL procedure_1_p(35); 




-- вывести фио и дату клиента с одобренными заявками и суммой кредита


DELIMITER //

DROP PROCEDURE IF EXISTS procedure_2_p//
CREATE PROCEDURE procedure_2_p(x int)
BEGIN
	
	SELECT 
		c.id,
		c.firstname,
		c.lastname,
		r.status,
		r.sum_credit 
	from profiles p 
	join client c on p.client_id = c.id
	join request r on p.request_id = r.id
	where r.status = 'Одобрено' and r.sum_credit >= x;

END//
DELIMITER ;

CALL procedure_2_p(9000000); 



-----------------------------------------------------------------------------

-- Триггер--


-- Создадим тригер который будет добовлять логи при вставке в таблицу clients предворительно создав таблицу для хранения логов


CREATE TABLE `log` (
`id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
`msg` VARCHAR( 255 ) NOT NULL,
`time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`row_id` INT( 11 ) NOT NULL); 

DELIMITER \\
CREATE TRIGGER `logs_clients` AFTER INSERT ON `client`
FOR EACH ROW BEGIN
   INSERT INTO log Set msg = 'insert', row_id = NEW.id;
END;

DELIMITER ;


















