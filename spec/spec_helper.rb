require "buildkite/test_collector"

Buildkite::TestCollector.configure(
  hook: :rspec,
  url: "http://analytics-api.buildkite.localhost/v1/uploads",
  token: "xx-local-analytics-key",
)
