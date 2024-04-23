# Example RSpec Test Suite

This is a sample RSpec Test Suite which uses Buildkite's Test Analytics 
observability and automation tooling to track test performance, reliability
and uses Buildkite's [test-splitter](https://github.com/buildkite/test-splitter)
to split the suite of tests. 

## Fetching the Test Splitter
The [Dockerfile](./Dockerfile) fetches the test-splitter binary from GitHub and
builds it into the Docker container. This is then called by the [./.buildkite/steps/run](./.buildkite/steps/run)
Bash script. 
