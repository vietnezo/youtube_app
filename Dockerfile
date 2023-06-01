# Base image with Ruby and Node.js installed
FROM ruby:2.7.2

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      nodejs \
      yarn \
      libpq-dev \
      && rm -rf /var/lib/apt/lists/*

# Install gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && \
    bundle install --jobs 20 --retry 5

# Copy the application code into the container
COPY . .

# Set environment variables
ENV RAILS_ENV=development
ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_LOG_TO_STDOUT=true

# Precompile assets
RUN bundle exec rake assets:precompile

# Expose the port on which the Rails app will run
EXPOSE 3000

# Start the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
