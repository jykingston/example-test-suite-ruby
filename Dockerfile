FROM ruby:alpine

# Install dependencies
RUN apk add --no-cache \
    build-base \
    git \
    curl

ENV BUILDKITE_TEST_SPLITTER_VERSION=v0.2.0 \
  BUIlDKITE_TEST_SPLITTER_SHA1SUM=ed07ec39de1399bb85866b562d0a90ca6afe87b4

RUN curl -fsSLO "https://github.com/buildkite/test-splitter/releases/download/${BUILDKITE_TEST_SPLITTER_VERSION}/test-splitter-linux-amd64" \
  && echo "${BUIlDKITE_TEST_SPLITTER_SHA1SUM} test-splitter-linux-amd64" | sha1sum -c - \
  && chmod +x test-splitter-linux-amd64 \
  && mv test-splitter-linux-amd64 /usr/local/bin/test-splitter

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
