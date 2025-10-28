--List all workouts with user names
SELECT u.name, w.workout_type, w.duration_minutes, w.workout_date
FROM Users u
JOIN Workouts w ON u.user_id = w.user_id;

--Find users older than 25
SELECT name, age
FROM Users
WHERE age > 25;

--List all female users
SELECT name, gender
FROM Users
WHERE gender = 'Female';

--Find workouts where calories burned > 300
SELECT workout_type, calories_burned, workout_date
FROM Workouts
WHERE calories_burned > 300;

--Count total number of workouts
SELECT COUNT(*) AS total_workouts
FROM Workouts;

--Find total calories burned by each user
SELECT u.name, SUM(w.calories_burned) AS total_calories
FROM Users u
JOIN Workouts w ON u.user_id = w.user_id
GROUP BY u.name;

--Show average workout duration
SELECT ROUND(AVG(duration_minutes), 2) AS avg_duration
FROM Workouts;

--Find workouts done on a specific date
SELECT u.name, w.workout_type, w.workout_date
FROM Users u
JOIN Workouts w ON u.user_id = w.user_id
WHERE w.workout_date = DATE '2025-10-22';

--List user goals with their deadlines
SELECT u.name, g.goal_type, g.deadline
FROM Users u
JOIN Goals g ON u.user_id = g.user_id
ORDER BY g.deadline;

--Find users who have done “Running” workouts
SELECT DISTINCT u.name
FROM Users u
JOIN Workouts w ON u.user_id = w.user_id
WHERE w.workout_type = 'Running';

--Find maximum calories burned in a single workout
SELECT MAX(calories_burned) AS max_calories
FROM Workouts;


--Show all workout types available
SELECT DISTINCT workout_type
FROM Workouts;

--Show number of workouts per user
SELECT u.name, COUNT(w.workout_id) AS workout_count
FROM Users u
JOIN Workouts w ON u.user_id = w.user_id
GROUP BY u.name;


--Find users whose total calories burned > 600
SELECT u.name, SUM(w.calories_burned) AS total_calories
FROM Users u
JOIN Workouts w ON u.user_id = w.user_id
GROUP BY u.name
HAVING SUM(w.calories_burned) > 600;
