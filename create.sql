CREATE TABLE guests (
    id serial PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(500) NOT NULL,
    date_of_birth DATE NOT NULL,
    reservation_number INT NOT NULL, 
    gender VARCHAR(100) 
);

CREATE TABLE hosts (
    id serial PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(500) NOT NULL,
    gender VARCHAR(100)
);

CREATE TABLE rooms (
    id serial PRIMARY KEY,
    AC BOOLEAN NOT NULL,
    refrigerator BOOLEAN NOT NULL,
    amount_of_residents INT NOT NULL,
    price INT NOT NULL
);

CREATE TABLE reservation (
    id serial PRIMARY KEY,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    price_total INT NOT NULL,
    status_room VARCHAR(100),
    guest_id INT,
    host_id INT,
    room_id INT,
    FOREIGN KEY (guest_id) REFERENCES guests (id),
    FOREIGN KEY (host_id) REFERENCES hosts (id),
    FOREIGN KEY (room_id) REFERENCES rooms (id),
    FOREIGN KEY (price_total) REFERENCES rooms (price)
);

INSERT INTO guests (full_name, age, email, date_of_birth, reservation_number, gender) VALUES 
('Polina Holub', 22, 'pol@.com', '2001-02-02', 2, 'fem'), 
('Malina Lebed', 20, 'mal@.com', '1986-05-02', 5, 'fem'), 
('Ihor Holub', 35, 'ihor@.com', '1970-02-09', 10, 'male');

INSERT INTO hosts (full_name, email, gender) VALUES 
('Lydmila Bahmut', 'lyd@.com', 'fem'), 
('Heorhiy Biliy', 'heor@.com', 'masc'), 
('Anna Ovcharenko', 'ann@.com', 'fem');

INSERT INTO rooms (AC, refrigerator, amount_of_residents, price) VALUES 
(TRUE, TRUE, 3, 10000), 
(FALSE, TRUE, 6, 16000), 
(FALSE, TRUE, 2, 8000);

INSERT INTO reservation (check_in, check_out, price_total, status_room, guest_id, host_id, room_id) VALUES 
('2023-07-01', '2023-07-10', 5000, 'occupied', 1, 2, 3), 
('2023-06-01', '2023-07-01', 30000, 'occupied', 2, 2, 3), 
('2023-05-01', '2023-06-10', 87000, 'free', 1, 2, 2);


SELECT full_name, id FROM guests WHERE reservation_number = (SELECT MAX(reservation_number) FROM guests);