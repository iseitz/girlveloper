# Girlveloper

Welcome to the Girlveloper Coding Learning Platform! This web application, built with Ruby on Rails, is designed to provide a Udemy-style online learning experience. Users can access and enroll in courses, interact with instructors, submit homework, and enhance their skills in coding.

## Table of Contents

- [Features](#features)
- [Demo](#demo)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [License](#license)

## Current Features

- User authentication and authorization system.
- Recaptcha and mail confirmation for new users.
- Course creation, management, for teachers, and enrollment for students.
- Permissions based on the roles of users: students, teachers, and admins.
- Analytics for course popularity, revenue, student progress
- Searching and filtering courses based on preferences
- Pagination for courses and user lists
- Ability to rate courses, leave reviews, and see ratings of the course
- Course creation structure: Course => section => lessons
- Student ability to track their progress in the course

## Planned Features
- Interactive discussions between instructors and students.
- Homework code submission.
- Payments processing.
- User-friendly interface for course content, including videos, quizzes, and assignments.
- Runsack tags for searching and content personalization
- Omniauth
- Youtube video embeds

## Demo

[[Link to live demo](https://girlveloper-90fb34f97b30.herokuapp.com/)](#)

## Technologies Used

- Ruby on Rails: The primary framework for building the web application is Ruby on Rails Rails 6.1.7.2
- Ruby 3.0.6p216
- PostgreSQL database.
- AWS Cloud 9 (Amazon Web Services): For cloud hosting and storage.
- Heroku: For deployment and hosting of the production application (Heroku-20).
- S3 for image and video file processing.
- Amazon SES for outbound emails and notifications.
- Bootstrap 5 and Font Awesome for styling.

## Temporary issue

The app temporarily does not allow signups for new users. There is an email verification feature for new users. To send a confirmation email to a new user I am using AWS SES service and I am currently going through the authorization process to be able to send out emails in production. It requires about 2 weeks to get the verification completed. 

## Getting Started

To get a local copy of the project up and running, follow these steps:

1. Clone the repository to your local machine:
