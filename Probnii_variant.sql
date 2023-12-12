SELECT * FROM `RERE`.`Категории`;
show tables;
#--------------------
SELECT * FROM `RERE`.`ингредиенты`;
INSERT INTO `RERE`.`ингредиенты` (`ingredient_name`, `category_id`, `calories_per_100g`)
 VALUES  
	('авакадо', '1', '100'),
	('виноград', '2', '100'),
	('банан', '3', '700'),
    ('мандарин', '4', '750'),
    ('ласось', '5', '350'),
    ('йогурт', '6', '170'),
	('помидор', '7', '200');
    
INSERT INTO `RERE`.`ингредиенты` (`ingredient_name`, `category_id`, `calories_per_100g`)    VALUES  ('авакадо', '1', '100');
#--------------------    
UPDATE ингредиенты SET calories_per_100g = '250' WHERE idИнгредиенты = '3';

#всякие сортировки
#по возрастанию и убыванию
select * from RERE.ингредиенты order by calories_per_100g desc; 
select * from RERE.ингредиенты order by calories_per_100g asc; 
select * from RERE.ингредиенты order by calories_per_100g asc limit 5; select * from RERE.ингредиенты order by calories_per_100g desc limit 7; 
#--------------------
#--удаление дубликата;
set sql_safe_updates = 0;
delete in1 from ингредиенты in1, ингредиенты in2
 where  
	in1.calories_per_100g = in2.calories_per_100g
 and 
	in1.ingredient_id > in2.ingredient_id;
  set sql_safe_updates = 1;  
#--------------------
#всякие сортировки
select distinct  ingredient_name, calories_per_100g from RERE.ингредиенты;
select count(*) from RERE.ингредиенты where calories_per_100g>200;
#--------------------
#количество всех записей с одинаковыми значениями в поле `ingredient_name`   
SELECT
	`ingredient_name`,
	COUNT(`ingredient_name`) AS `category_id`
FROM
	`ингредиенты`
GROUP BY
	`ingredient_name`
HAVING 
	`category_id` > 1;
#--------------------    
#все записи с одинаковыми значениями
 SELECT * FROM 
	`ингредиенты`
WHERE 
	`ingredient_name` IN (SELECT `ingredient_name` FROM `ингредиенты` GROUP BY `ingredient_name` HAVING COUNT(*) > 1)
ORDER BY
	`ingredient_name`;   
#--------------------      

SELECT * FROM `RERE`.`Рецепты`;   
INSERT INTO `RERE`.`Рецепты` (`recipe_name`, `description`, `category_id`)
 VALUES  
	('Щавель', 
    'Я осозналась..', 
    '2'),
	('Богема', 
    'Они всё видят. Они всегда всё видят.', 
    '3'),
	('Щи', 
    'Идёт медведь по лесу - видит дом горит. Зашёл и...',
    '5'),
    ('Криный',
    'ВЫ НЕ ПОВЕРИТЕ, ЧТО СЛУЧИЛОСЬ С АЛЛОЙ БОРИСОВНОЙ... читать в источнике', 
    '5'),
    ('Курник', 
    'Если все мы есть молекулы, то можно ли сказать, что мир молекула, а значит мир состоит из миллиарда и миллиарда миров.',
    '6');
INSERT INTO `RERE`.`Рецепты` (`recipe_name`, `description`, `category_id`)
 VALUES  
	('Борщ', 
    'Возьмите все продукты и оставьте на столе - всё что было, то прошло. Оставь прошлое в прошлом.', 
    '1');
select * from  `RERE`.`Рецепты` where recipe_name like 'Щ%';
select * from  `RERE`.`Рецепты` where recipe_name like '%а';  
select * from  `RERE`.`Рецепты` where recipe_name  in('Криный', 'Курник');#только эти два
select * from  `RERE`.`Рецепты` where recipe_name  not in('Криный', 'Курник');#кроме эти два
 
 
 
#-------------------- нервотрёпка    
SELECT * FROM `RERE`.`Категории`;
INSERT INTO `RERE`.`Категории` (`category_name`)
 VALUES  
	('суп');  
 INSERT INTO `RERE`.`Категории` (`category_name`)
 VALUES  
	('салат'), ('суп'), ('суп'), ('пирог');
    
#DELETE FROM ингредиенты WHERE category_id = '1';    
    
    
    