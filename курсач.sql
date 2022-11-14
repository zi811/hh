	drop database if exists kursach1;
	create database kursach1;
	ALTER DATABASE kursach1 CHARACTER SET utf8;
	use kursach1
	
	
	DROP TABLE IF EXISTS `documents`;
	CREATE TABLE `documents` (
	  `id` INT NOT NULL,
	  `request_id` INT ,
	  `type_name` VARCHAR(35) ,
	  `url_document` TEXT ,
	  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
	  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	  PRIMARY KEY (`id`));
	
	 
	 INSERT `documents` (`id`, `request_id`, `type_name`, `url_document`, `created_at`, `updated_at`) 
VALUES 
('1', '2', 'Паспорт', 'www.1.ru/1234', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('2', '5', 'Паспорт', 'www.1.ru/1232', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('3', '6', 'Паспорт', 'www.1.ru/1233', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('4', '9', 'Паспорт', 'example.net/113', '2022-04-15 22:55:10', '2022-04-15 22:59:10'), 
('5', '3', 'Паспорт', 'example.net/23', '2022-04-15 22:55:10', '2022-04-15 22:59:10'), 
('6', '1', 'Паспорт', 'example.net/12', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('7', '4', 'Паспорт', 'example.com/1','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('8', '7', 'Паспорт', 'example.com/123566','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('9', '8', 'Паспорт', 'example.org/12379','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('10', '10', 'Паспорт', 'example.com/12312314','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('11', '12', 'Паспорт', 'example.org/123a','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('12', '11', 'Паспорт', 'example.net/123b','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('13', '11', 'Паспорт', 'example.net/123q','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('14', '10', 'Паспорт', 'example.org/123z','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('15', '9', 'Паспорт', 'example.org/123x','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('16', '4', 'Паспорт', 'example.net/123c','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('17', '8', 'Документы продавца', 'example.net/123cz', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('18', '1', 'Документы продавца', 'example.com/123gd','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('19', '1', 'Документы продавца', 'example.com/123fdwqqq','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('20', '4', 'Документы продавца', 'example.org/123qqwer','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('21', '5', 'Документы продавца', 'example.com/123asdfr','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('22', '3', 'Документы продавца', 'example.org/123asdd','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('23', '9', 'Документы продавца', 'example.net/123zxxzzx','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('24', '3', 'Документы продавца', 'example.net/123q234','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('25', '4', 'Документы продавца', 'example.org/123asdfhhtre','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('26', '8', 'Документы продавца', 'example.org/1222234','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('27', '8', 'Документы продавца', 'example.org/1asdasc','2022-04-15 22:55:10','2022-04-15 22:59:10')
;

	
	
	
	DROP TABLE IF EXISTS `client`;
	CREATE TABLE `client` (
	  `id` INT NOT NULL,
	  `firstname` VARCHAR(50),
	  `lastname` VARCHAR(45),
	  `email` VARCHAR(50),
	  `phone` BIGINT,
	  `documents_id` INT NOT NULL,
	  PRIMARY KEY (`id`, `documents_id`),
	  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
	  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC),
	  INDEX `fk_client_documents1_idx` (`documents_id` ASC),
	  CONSTRAINT `fk_client_documents1`
	    FOREIGN KEY (`documents_id`)
	    REFERENCES `documents` (`id`)
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION);
	   
	   INSERT INTO `client` (`id`, `firstname`, `lastname`, `email`, `phone`, `documents_id`) 
VALUES 
('1', 'Reuben', 'Nienow', 'arlo50@example.org', '9374071116','4'),
('2', 'Frederik', 'Upton', 'terrence.cartwright@example.org', '9127498182','3'),
('3', 'Unique', 'Windler', 'rupert55@example.org', '9921090703','1'),
('4', 'Norene', 'West', 'rebekah29@example.net', '9592139196','2'),
('5', 'Frederick', 'Effertz', 'von.bridget@example.net', '9909791725','6'),
('6', 'Victoria', 'Medhurst', 'sstehr@example.net', '9456642385','9'),
('7', 'Austyn', 'Braun', 'itzel.beahan@example.com', '9448906606','12'),
('8', 'Jaida', 'Kilback', 'johnathan.wisozk@example.com', '9290679311','7'),
('9', 'Mireya', 'Orn', 'missouri87@example.org', '9228624339','8'),
('10', 'Jordyn', 'Jerde', 'edach@example.com', '9443126821','10'),
('11', 'Thad', 'McDermott', 'shaun.ferry@example.org', '9840726982','11'),
('12', 'Aiden', 'Runolfsdottir', 'doug57@example.net', '9260442904','5'),
('13', 'Bernadette', 'Haag', 'lhoeger@example.net', '9984574866','13'),
('14', 'Dedric', 'Stanton', 'tconsidine@example.org', '9499932439','15'),
('15', 'Clare', 'Wolff', 'effertz.laverna@example.org', '9251665331','16'),
('16', 'Lina', 'Macejkovic', 'smitham.demarcus@example.net', '9762021357','14');

	
	
	DROP TABLE IF EXISTS `debit_products`;
	CREATE TABLE `debit_products` (
	  `debit_product_id` INT NOT NULL,
	  `name` VARCHAR(45) ,
	  `balance` VARCHAR(45),
	  `status` VARCHAR(25),
	  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
	  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	  PRIMARY KEY (`debit_product_id`));
	
	 
	 INSERT INTO `debit_products` (`debit_product_id`, `name`, `balance`, `status`, `created_at`, `updated_at`) 
VALUES 

('1', 'Дебетовая Карта покупайка', 'Паспорт', 'www.1.ru', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('2','кк', '0.99','Открыто', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('3','дк', '123455.12', 'Открыто', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('4', 'Социальная', 'Открыто', '43325.21.net', '2022-04-15 22:55:10', '2022-04-15 22:59:10'), 
('5', 'дк', '43325.21', 'Открыто','2022-04-15 22:55:10', '2022-04-15 22:59:10'), 
('6',  'кк', '43325.21', 'Открыто','2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('7',  'кк', '0.99', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('8',  'Социальная', '43325.21','Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('9',  'Социальная', '43325.21','Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('10',  'кк', '0.00','Закрыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('11',  'Социальная', '43325.21', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('12', 'Социальная', '43325.21', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('13', 'Социальная', '43325.21', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('14', 'кк', '0.00', 'Закрыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('15', 'дк', '43325.21', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('16', 'кк', '43325.21', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('17', 'кк', '43325.21', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('18', 'Социальная', '13.21', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('19', 'дк', '1112.21', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('20', 'кк', '9912.21', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('21', 'кк', '325.21', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('22', 'кк', '4335.21', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('23', 'дк', '332.21', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('24', 'кк', '32.21', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('25', 'Социальная', '4310.21', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('26', 'кк', '14.21', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10'),
('27', 'кк', '15.21', 'Открыто','2022-04-15 22:55:10','2022-04-15 22:59:10');


	
	
	DROP TABLE IF EXISTS `object`;
	CREATE TABLE `object` (
	  `id` INT NOT NULL,
	  `object_adress` VARCHAR(145),
	  `price` DECIMAL(11,2),
	  `more_info` VARCHAR(245),
	  PRIMARY KEY (`id`));


INSERT INTO `object` (`id`, `object_adress`, `price`, `more_info`) 
VALUES 
	
('1', 'Москва ул пушкин д 1. кв 1', '10000000', 'Кадастровый номер 77:77:71:7777, площадь 30 кв.м'),
('2', 'Москва ул пушкин д 1. кв 2', '1200000', 'Кадастровый номер 77:77:71:7777, площадь 32 кв.м'),
('3', 'Москва ул пушкин д 1. кв 3', '15000000', 'Кадастровый номер 77:77:73:7777, площадь 47 кв.м'),
('4', 'Москва ул пушкин д 1. кв 4', '16000000', 'Кадастровый номер 77:77:74:7777, площадь 55 кв.м'),
('5', 'Москва ул пушкин д 1. кв 5', '19000000', 'Кадастровый номер 77:77:75:7777, площадь 60 кв.м'),
('6', 'Москва ул пушкин д 1. кв 6', '9000000', 'Кадастровый номер 77:77:76:7777, площадь 19 кв.м'),
('7', 'Москва ул пушкин д 1. кв 7', '12000000', 'Кадастровый номер 77:77:77:7777, площадь 30 кв.м'),
('8', 'Москва ул пушкин д 1. кв 8', '11000000', 'Кадастровый номер 77:77:78:7777, площадь 28 кв.м'),
('9', 'Москва ул пушкин д 1. кв 9', '29000000', 'Кадастровый номер 77:77:79:7777, площадь 100 кв.м'),
('10', 'Москва ул пушкин д 1. кв 10', '8000000', 'Кадастровый номер 77:77:17:7777, площадь 19 кв.м'),
('11', 'Москва ул пушкин д 1. кв 11', '13000000', 'Кадастровый номер 77:77:27:7777, площадь 30 кв.м'),
('12', 'Москва ул пушкин д 1. кв 12', '13000000', 'Кадастровый номер 77:77:37:7777, площадь 30 кв.м'),
('13', 'Москва ул пушкин д 1. кв 13', '13000000', 'Кадастровый номер 77:77:47:7777, площадь 30 кв.м'),
('14', 'Москва ул пушкин д 1. кв 14', '13000000', 'Кадастровый номер 77:77:57:7777, площадь 30 кв.м'),
('15', 'Москва ул пушкин д 1. кв 15', '13000000', 'Кадастровый номер 77:77:67:7777, площадь 30 кв.м'),
('16', 'Москва ул пушкин д 1. кв 16', '13000000', 'Кадастровый номер 77:77:87:7777, площадь 30 кв.м');



	
	DROP TABLE IF EXISTS  `products`;
	CREATE TABLE `products` (
	  `product_id` INT NOT NULL,
	  `name` VARCHAR(255),
	  `desription` TEXT,
	  `condition` DECIMAL(11,2),
	  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
	  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	  PRIMARY KEY (`product_id`));

INSERT INTO `products` (`product_id`, `name`, `desription`, `condition`, `created_at`, `updated_at`) 
VALUES 

('1', 'Семейная', 'На новостройку, для семей с детьми, рожденными после 2018 года', '5.5', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('2','Государственная', 'Программа с субсидией государства на новостройку','11.5', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('3','Новостройка', 'Программа для покупки квартиры от застройщика', '19.7', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('4', 'Вторичка', 'Программа для покупки квартиры по ДКП', '19.7', '2022-04-15 22:55:10', '2022-04-15 22:59:10'), 
('5', 'Коммерция', 'Приобритение недвижемости с целью комерческого использования', '19.9','2022-04-15 22:55:10', '2022-04-15 22:59:10');

	
	
	DROP TABLE IF EXISTS `request`;
	CREATE TABLE `request` (
	  `id` INT NOT NULL,
	  `sum_credit` DECIMAL(11,2),
	  `status` VARCHAR(25),
	  `payment` DECIMAL(11,2),
	  `object_id` INT NOT NULL,
	  `products_product_id` INT NOT NULL,
	  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
	  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	  PRIMARY KEY (`id`, `object_id`, `products_product_id`),
	  INDEX `fk_request_object1_idx` (`object_id` ASC),
	  INDEX `fk_request_products1_idx` (`products_product_id` ASC),
	  CONSTRAINT `fk_request_object1`
	    FOREIGN KEY (`object_id`)
	    REFERENCES `object` (`id`)
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	  CONSTRAINT `fk_request_products1`
	    FOREIGN KEY (`products_product_id`)
	    REFERENCES `products` (`product_id`)
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION);

INSERT INTO `request` (`id`, `sum_credit`, `status`, `payment`, `object_id`, `products_product_id`, `created_at`, `updated_at`) 
VALUES 
('1', '12000000', 'Отказ', '4000000', '4', '3', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('2', '4000000', 'Одобрено', '4000000', '10', '1', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),

('3', '13000000', 'Одобрено', '6000000', '5', '2', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),

('4', '3500000', 'Одобрено', '6500000', '1', '3', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('5', '12000000', 'Отказ', '4000000', '16', '3', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('6', '8000000', 'Одобрено', '21000000', '9', '3', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('7', '10000000', 'Отказ', '3000000', '12', '3', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('8', '8000000', 'Одобрено', '5000000', '14', '3', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('9', '10000000', 'Отказ', '2000000', '2', '3', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('10', '7000000', 'Отказ', '6000000', '15', '3', '2022-04-15 22:55:10', '2022-04-15 22:59:10'),
('11', '5000000', 'Отказ', '6000000', '7', '3', '2022-04-15 22:55:10', '2022-04-15 22:59:10');

	
	
	DROP TABLE IF EXISTS `profiles`;
	CREATE TABLE IF NOT EXISTS `profiles` (
	  `client_id` INT NOT NULL,
	  `gender` CHAR(1),
	  `birthday` DATE,
	  `hometown` VARCHAR(100),
	  `debit_product_id` INT NOT NULL,
	  `request_id` INT NOT NULL,
	  `documents_id`INT NOT NULL,
	  PRIMARY KEY (`client_id`, `debit_product_id`, `request_id`),
	  INDEX `fk_profiles_client_idx` (`client_id` ASC),
	  INDEX `fk_profiles_debit_products1_idx` (`debit_product_id` ASC),
	  INDEX `fk_profiles_request1_idx` (`request_id` ASC),
	  CONSTRAINT `fk_profiles_client`
	    FOREIGN KEY (`client_id`)
	    REFERENCES `client` (`id`)
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	  CONSTRAINT `fk_profiles_debit_products1`
	    FOREIGN KEY (`debit_product_id`)
	    REFERENCES `debit_products` (`debit_product_id`)
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	  CONSTRAINT `fk_profiles_request1`
	    FOREIGN KEY (`request_id`)
	    REFERENCES `request` (`id`)
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION);


INSERT INTO `profiles` (`client_id`,`gender`, `birthday`, `hometown`, `debit_product_id`, `request_id`, `documents_id`) 
VALUES 
('1', 'M', '1988-04-12', 'Moskow', '15', '4', '5'),
('2', 'M', '1968-01-21', 'Minsk', '4', '11', '2'),
('3', 'M', '1963-01-22', 'Kiev', '2', '3', '7'),
('4', 'M', '1975-03-23', 'London', '13', '7', '16'),
('5', 'M', '1990-08-12', 'Penza', '12', '9', '3'),
('6', 'F', '1995-07-14', 'Saratov', '1', '10', '14'),
('7', 'F', '1995-02-17', 'Ryazan', '10', '8', '4'),
('8', 'F', '1993-03-13', 'Vladivostok', '9', '1', '12'),
('9', 'F', '1969-05-11', 'Saratov', '3', '2', '9'),
('10', 'F', '1964-04-10', 'Moskow', '5', '6', '1'),
('11', 'M', '1978-9-19', 'Moskow', '6', '5', '6'),
('2', 'M', '1962-11-13', 'Kiev', '7', '6', '15'),
('13', 'M', '1958-12-12', 'Ryazan', '16','8', '13'),
('14', 'M', '1967-12-16', 'Moskow', '14','4', '1'),
('15', 'F', '1961-01-17', 'Moskow', '11', '9', '8'),
('16', 'F', '1983-03-15', 'Moskow', '8', '1', '10');
	
	
	DROP TABLE IF EXISTS `seller`;
	CREATE TABLE IF NOT EXISTS `seller` (
	  `id` INT NOT NULL,
	  `debit_products_debit_product_id` INT NOT NULL,
	  `firstname` VARCHAR(50),
	  `lastname` VARCHAR(45),
	  `email` VARCHAR(50),
	  `phone` BIGINT,
	  `documents_id` INT NOT NULL,
	  PRIMARY KEY (`id`),
	  INDEX `fk_seller_debit_products1_idx` (`debit_products_debit_product_id` ASC),
	  INDEX `fk_seller_documents1_idx` (`documents_id` ASC),
	  CONSTRAINT `fk_seller_debit_products1`
	    FOREIGN KEY (`debit_products_debit_product_id`)
	    REFERENCES `debit_products` (`debit_product_id`)
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	  CONSTRAINT `fk_seller_documents1`
	    FOREIGN KEY (`documents_id`)
	    REFERENCES `documents` (`id`)
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION);


 INSERT INTO `seller` (`id`,`debit_products_debit_product_id`, `firstname`, `lastname`, `email`, `phone`, `documents_id`) 
VALUES 
('1', '27', 'Kian', 'Weimann', 'tankunding@example.net', '9168462586', '17'),
('2', '21', 'Madelynn', 'Hahn', 'pleffler@example.org', '9598242802', '19'),
('3', '19', 'Hassie', 'Monahan', 'lowe.amelia@example.net', '9765846197', '18'),
('4', '26', 'Taryn', 'Kuvalis', 'aschneider@example.net', '9533355262', '21'),
('5', '24', 'Hollis', 'Padberg', 'cathryn40@example.net', '9163727209', '22'),
('6', '22', 'Henriette', 'Lindgren', 'allie.witting@example.com', '9891313707', '23'),
('7', '23', 'Keven', 'DuBuque', 'durward83@example.com', '9613848114', '26'),
('8', '17', 'Chaz', 'Yundt', 'stamm.bret@example.net', '9763350438', '25'),
('9', '20', 'Rosalee', 'Dickens', 'concepcion.conn@example.net', '9675063949', '24'),
('10', '18', 'Kip', 'Schoen', 'ibeer@example.com', '9987381304', '27');
	
	
	
	
	
	
	
