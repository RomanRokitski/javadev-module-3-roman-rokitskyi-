-- https://miro.com/app/board/uXjVMbgHa3E=/

--Створення таблиці worker 

CREATE TABLE worker (
    id IDENTITY PRIMARY KEY,
    name VARCHAR(1000) NOT NULL,
    birthday DATE CHECK(birthday > '1900-01-01'),
    level VARCHAR(100) NOT NULL,
    salary INTEGER CHECK (salary >= 100 AND salary <= 100000)
);

--Додається рівень технічного розвитку працівника в поле level

ALTER TABLE worker
ADD CONSTRAINT level_enum_values
CHECK (level IN ('Trainee', 'Junior', 'Middle', 'Senior'));

-- Створення таблиці client

CREATE TABLE client (
    id IDENTITY PRIMARY KEY,
    name VARCHAR(1000) NOT NULL
);

--Створення таблиці project

CREATE TABLE project (
    id IDENTITY PRIMARY KEY,
    client_id BIGINT NOT NULL,
    FOREIGN KEY(client_id) REFERENCES client(id),
    start_date DATE,
    finish_date DATE
);

--Створення таблиці project_worker

CREATE TABLE project_worker (
    project_id BIGINT NOT NULL,
    worker_id BIGINT NOT NULL,
    PRIMARY KEY (project_id, worker_id),
    FOREIGN KEY(worker_id) REFERENCES worker(id),
    FOREIGN KEY(project_id) REFERENCES project(id)
);