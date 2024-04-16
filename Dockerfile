FROM ruby:alpine

# Install dependencies
RUN apk add --no-cache \
    build-base \
    git

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN gem install bundler
RUN bundle install

# Copy the rest of the application code
COPY . .

# Set entrypoint
ENTRYPOINT ["bundle", "exec"]
