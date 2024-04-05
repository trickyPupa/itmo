# Лабораторная работа #1

## Для выполнения лабораторной работы №1 необходимо:

    На основе предложенной предметной области (текста) составить ее описание. Из полученного описания выделить сущности, их атрибуты и связи.
    Составить инфологическую модель.
    Составить даталогическую модель. При описании типов данных для атрибутов должны использоваться типы из СУБД PostgreSQL.
    Реализовать даталогическую модель в PostgreSQL. При описании и реализации даталогической модели должны учитываться ограничения целостности, которые характерны для полученной предметной области.
    Заполнить созданные таблицы тестовыми данными.

Для создания объектов базы данных у каждого студента есть своя схема. Название схемы соответствует имени пользователя в базе studs (sXXXXXX). Команда для подключения к базе studs:

psql -h pg -d studs

Каждый студент должен использовать свою схему при работе над лабораторной работой №1 (а также в рамках выполнения 2, 3 и 4 этапа курсовой работы).

Отчёт по лабораторной работе должен содержать:

    Текст задания.
    Описание предметной области.
    Список сущностей и их классификацию (стержневая, ассоциация, характеристика).
    Инфологическая модель (ER-диаграмма в расширенном виде - с атрибутами, ключами...).
    Даталогическая модель (должна содержать типы атрибутов, вспомогательные таблицы для отображения связей "многие-ко-многим").
    Реализация даталогической модели на SQL.
    Выводы по работе.

Темы для подготовки к защите лабораторной работы:

    Архитектура ANSI-SPARC
    Модель "Сущность-Связь". Классификация сущностей. Виды связей. Ограничения целостности.
    DDL
    DML

### Описание предметной области: 
Кромка плато оказалась едва ли не у самых их ног. Хилвар первым дошагал до нее, а спустя несколько секунд и Олвин, лишившись дара речи, уже стоял рядом. Он был ошеломлен, потому что оба они находились на краю вовсе не какого-то там плато, как им представлялось поначалу, но огромной чаши глубиной в полмили и диаметром мили в три. Поверхность впереди резко понижалась, плавно выравнивалась на дне этой огромной круглой долины и снова поднималась - все более и более круто - к противоположному краю.  Самая низкая часть чаши была занята круглым озером, зеркало которого непрерывно трепетало, словно бы терзаемое непрекращающимся ветром.