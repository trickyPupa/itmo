DROP TYPE IF EXISTS condition_enum CASCADE;
DROP TYPE IF EXISTS terrain_enum CASCADE;
DROP TYPE IF EXISTS gender_enum CASCADE;

DROP TABLE IF EXISTS grounds CASCADE;
DROP TABLE IF EXISTS persons CASCADE;
DROP TABLE IF EXISTS weather CASCADE;
DROP TABLE IF EXISTS locations CASCADE;
DROP TABLE IF EXISTS outfits CASCADE;
DROP TABLE IF EXISTS events CASCADE;
DROP TABLE IF EXISTS person_to_events CASCADE;

CREATE TYPE gender_enum AS ENUM ('male', 'female');
CREATE TYPE condition_enum AS ENUM ('factory new', 'minimal wear', 'field-tested', 'well-worn', 'battle-scarred');
CREATE TYPE terrain_enum AS ENUM ('lake', 'plateau', 'mountain', 'hill', 'forest', 'jungle', 'river', 'sea', 'field', 'plain');

CREATE TABLE IF NOT EXISTS grounds (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    structure TEXT NOT NULL,
    surface TEXT NOT NULL,
    height INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS weather (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    effect TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS outfits (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    purpose TEXT,
    condition condition_enum NOT NULL,
    color TEXT
);

CREATE TABLE IF NOT EXISTS locations (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    terrain_type terrain_enum NOT NULL,
    weather_id INTEGER REFERENCES weather(id) NOT NULL,
    ground_type INTEGER REFERENCES grounds(id) NOT NULL
);

CREATE TABLE IF NOT EXISTS persons (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    surname TEXT,
    age INTEGER NOT NULL,
    alive BOOLEAN NOT NULL,
    gender gender_enum NOT NULL,
    location_id INTEGER REFERENCES locations(id) NOT NULL,
    cloth INTEGER REFERENCES outfits(id) NOT NULL,
    CHECK (age > 0)
);

CREATE TABLE IF NOT EXISTS events (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    is_finished BOOLEAN NOT NULL,
    end_time TIMESTAMP(0),
    start_time TIMESTAMP(0),
    CHECK(end_time > start_time)
);

CREATE TABLE IF NOT EXISTS person_to_events (
    event_id INTEGER REFERENCES events(id) NOT NULL,
    person_id INTEGER REFERENCES persons(id) NOT NULL,
    PRIMARY KEY (event_id, person_id)
);