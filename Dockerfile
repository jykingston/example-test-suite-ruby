FROM ruby:alpine

# Install dependencies
RUN apk add --no-cache \
    build-base \
    git \
    curl

ENV BUILDKITE_TEST_SPLITTER_VERSION=v0.5.1 \
  BUIlDKITE_TEST_SPLITTER_SHA1SUM=0003609d1f4cdd0fbb3d9cc5ee8c087b6c44691d

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
