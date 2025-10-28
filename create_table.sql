-- Create database (skip if already inside one)
CREATE DATABASE fitness_tracker;
USE fitness_tracker;

-- Table: Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT CHECK (age > 0),
    gender VARCHAR(10)
);

-- Table: Workouts
CREATE TABLE Workouts (
    workout_id INT PRIMARY KEY,
    user_id INT,
    workout_type VARCHAR(30),
    duration_minutes INT,
    calories_burned INT,
    workout_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Table: Goals
CREATE TABLE Goals (
    goal_id INT PRIMARY KEY,
    user_id INT,
    goal_type VARCHAR(50),
    target_value INT,
    deadline DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
