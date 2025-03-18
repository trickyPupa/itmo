-- триггер и связанная с ним функция, которая выводит для нового человека в таблице persons количество человек в его локации

-- Удаляем существующий триггер
DROP TRIGGER IF EXISTS persons_count_in_location_trigger ON persons;


-- Создаем функцию, которая вызывается при вставке записи в таблицу spaceship
CREATE OR REPLACE FUNCTION persons_count_in_location() RETURNS TRIGGER AS $$
DECLARE
    persons_count int;
BEGIN
    SELECT COUNT(id) INTO persons_count FROM persons WHERE location_id = NEW.location_id;

    RAISE NOTICE 'New person % % added in location % with % persons in it', 
        NEW.name, NEW.surname, (SELECT name FROM locations WHERE id = NEW.location_id), persons_count;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Создаем триггер, который вызывает функцию persons_count_in_location при вставке записи в таблицу persons
CREATE TRIGGER persons_count_in_location_trigger
    BEFORE INSERT ON persons
    FOR EACH ROW
    EXECUTE FUNCTION persons_count_in_location();


-- Демонстрация функциональности 
INSERT INTO
    persons(name, surname, age, gender, alive, location_id, cloth)
VALUES
    ('Vasek', 'Popov', 23, 'male', True, 2, 3),
    ('Evsey', 'Petrov', 49, 'male', True, 4, 2);

DELETE FROM persons WHERE name in ('Vasek', 'Evsey');