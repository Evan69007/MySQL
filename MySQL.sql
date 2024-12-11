CREATE TABLE users (
	user_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	firstname TEXT NOT NULL,
	lastname TEXT NOT NULL,
	email TEXT NOT NULL UNIQUE
);

CREATE TABLE edusign (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Requetes premier niveau

-- 1
SELECT *
FROM users;

-- 2
SELECT *
FROM users
WHERE firstname = 'Ada';

-- 3
SELECT *
FROM users
WHERE firstname LIKE 'B%';

-- 4
SELECT count(*)
FROM users;

-- 5
SELECT count(*)
FROM users
WHERE firstname LIKE 'B%';

-- 6
SELECT firstname
FROM users;

-- Requetes 2ème niveau

-- 1
INSERT INTO edusign (user_id, created_at) VALUES (1, '2024-05-30 09:30:00');

-- 2
INSERT INTO edusign (user_id, created_at) VALUES (3, '2024-05-30 09:30:00');

-- 3
INSERT INTO edusign (user_id, created_at) 
VALUES 
    (1, '2024-09-01 09:30:00'),
    (2, '2024-09-01 09:30:00'),
    (3, '2024-09-01 09:30:00'),
    (4, '2024-09-01 09:30:00');


-- 4
SELECT *
FROM edusign
ORDER BY created_at DESC, user_id ASC;

-- 5
SELECT *
FROM edusign
WHERE created_at = '2024-05-30 09:30:00';

-- Requetes 3ème Niveau

-- 1
SELECT created_at, count(*)
FROM edusign
GROUP BY created_at;

-- 2

-- solution 1:
SELECT count(*) AS volume
FROM edusign
WHERE user_id = (SELECT user_id FROM users WHERE firstname = 'Bella');

-- solution 2
SELECT count(*) AS volume
FROM edusign
INNER JOIN users ON edusign.user_id=users.user_id
WHERE firstname = 'Bella'