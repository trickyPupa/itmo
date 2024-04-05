INSERT INTO weather (name, effect)
VALUES
    ('дождь', 'влажность'),
    ('жара', 'сухость'),
    ('вьюга', 'плохая видимость'),
    ('туман', 'плохая видимость');

INSERT INTO outfits (name, purpose, condition, color)
VALUES
    ('комбенезон', 'стройка', 'field-tested', 'синий'),
    ('деловой костюм', 'офис', 'factory new', 'черный'),
    ('европейское женское платье', 'бал', 'factory new', 'красный'),
    ('камуфляж', 'охота', 'battle-scarred', NULL);

INSERT INTO grounds (title, structure, surface, height)
VALUES
    ('скалистая', 'гранит', 'гладкая', 1000),
    ('плодородная', 'чернозем', 'рыхлая', 250),
    ('каменистая', 'галька', 'зыбкая', 300),
    ('лесная', 'корни', 'неровная', 400),
    ('дно озера', 'ил', 'зыбкая', 500);


INSERT INTO locations (name, terrain_type, weather_id, ground_type)
VALUES
    ('Подход к котловану', 'plateau', 2, 1),
    ('Дно огромной чаши', 'lake', 2, 4),
    ('Лес рядом с котлованом', 'forest', 1, 3),
    ('Замок Нойшванштайн', 'mountain', 4, 1);

INSERT INTO persons (name, surname, age, alive, gender, location_id, cloth)
VALUES 
    ('Хилвар', 'Сигурдсон', 30, true, 'male', 1, 1),
    ('Олвин', 'Олафсон', 31, true, 'male', 1, 4),
    ('Алиса', NULL, 20, true, 'female', 4, 3);

INSERT INTO events (title, description, is_finished, end_time, start_time)
VALUES
    ('Открытие озера в котловане', 'Хилвар и Олвин нашли странную чашу с озером на дне', true, '1960-02-13 12:23:12', '1960-01-13 12:00:42'),
    ('Прыжок в кроличью нору', 'Девочка последоваала за кроликом и оказалось в другом мире.', true, '1890-06-13 13:43:13', '1890-06-13 13:10:02'),
    ('Исследование странной чаши', 'За открытием чаши следует ее исследование', false, NULL, '1960-02-13 12:23:12');

INSERT INTO person_to_events (event_id, person_id)
VALUES 
    (1, 1),
    (1, 2),
    (3, 1),
    (3, 2),
    (2, 3);