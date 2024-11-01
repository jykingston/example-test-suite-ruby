# Example RSpec Test Suite

This is a sample RSpec Test Suite which uses Buildkite's Test Engine
observability and automation tooling to track test performance, reliability
and uses Buildkite's [test-splitter](https://github.com/buildkite/test-splitter)
to split the suite of tests. 

## Fetching the Test Splitter

The [Dockerfile](./Dockerfile) fetches the test-splitter binary from GitHub and
builds it into the Docker container. This is then called by the [./.buildkite/steps/run](./.buildkite/steps/run)
Bash script. 

### Include/Exclude filters

This example suite uses `BUILDKITE_SPLITTER_TEST_FILE_PATTERN` env var to further partition the test suite
into `unit` and `acceptance` specs. The `BUILDKITE_SPLITTER_IDENTIFIER` env var is used to ensure that
a unique key is used to define the two steps. 


## Updating Test Ownership

Buildkite Test Engine offers the concept of test ownership.

By utilising a TESTOWNERS file

```
*login*.rb    iam
*logout*.rb   iam
*password*.rb iam
*org*.rb      iam
*team*.rb     iam
*user*.rb     iam

*checkout*.rb billing

smoke/*       platform
e2e/*         platform
```

We can automatically assign flaky tests to their owners
