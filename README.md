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
- Redis server

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
- Create a new file `config/database.yml`.

```
$ cp config/database.yml.template config/database.yml
```

- Add the following configuration variables to the `config/database.yml` file:
  ```
  username: your database user name
  password: your database password
  ```

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
$ redis-server &
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
```
$ docker-compose build -t .
```

2. Run the Docker container:

```
$ docker-compose up -d
```

## Usage
- Sign up for a new account or log in with existing credentials.
- Share a new youtube video using "Share a movie" button.
- Make sure that your shared URL was copied from Youtube.
- Go back to homepage and enjoy them.

## Troubleshooting
- If you encounter any issues during setup, make sure you have the correct versions of the required software and tools.
- Double-check the configuration variables in the `config/database.yml` file and ensure they are properly set.
- If you experience database-related errors, ensure that your MySQL server and Redis server is running and the credentials are correct.

For further assistance or bug reporting, please contact [viettrantrong@gmail.com](mailto:viettrantrong@gmail.com).
