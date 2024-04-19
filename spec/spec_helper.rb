require "buildkite/test_collector"

Buildkite::TestCollector.configure(
  hook: :rspec,
  # url: "http://analytics-api.buildkite.localhost/v1/uploads",
  token: "fWD5V1t8bzGtArDrZUJdRuzX",
)
