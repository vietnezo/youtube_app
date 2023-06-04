# YouTube Video Sharing App

## Introduction
This web application allows users to share YouTube videos with others. Users can create accounts, upload videos, browse and search for videos, and interact with the community through comments and likes. The app aims to provide a seamless video sharing experience.

Key Features:
- User registration and authentication
- Video uploading and management
- Video browsing and searching
- User comments and likes

## Prerequisites
Make sure you have the following software and tools installed:

- Ruby (version 2.7.2)
- Ruby on Rails (version 6.0.3)
- MySQL (version 8.0)
- Node.js (version 16.20.0)

## Installation & Configuration
1. Clone the repository:

```
$ git clone https://github.com/vietnezo/youtube_app.git
```

2. Install dependencies:
```
$ bundle install
$ yarn install
```

3. Configure settings:
- Create a new file `.env` in the project's root directory.
- Add the following configuration variables to the `.env` file:
  ```
  YOUTUBE_API_KEY=your_youtube_api_key
  DATABASE_USERNAME=your_database_username
  DATABASE_PASSWORD=your_database_password
  ```
- Replace `your_youtube_api_key` with your YouTube API key obtained from Google.
- Replace `your_database_username` and `your_database_password` with your PostgreSQL database credentials.

## Database Setup
1. Create the database:
```
$ rails db:create
```
2. Run the database migrations:
```
$ rails db:migrate
```
3. (Optional) Seed the database with sample data:
```
$ rails db:seed
```

## Running the Application
1. Start the development server:
```
$ rails s
```
2. Access the application in your web browser:
http://localhost:3000

3. Run the test suite:
```
$ bundle exec rspec
```

## (BE/FS) Docker Deployment
To deploy the application using Docker:

1. Build the Docker image:
