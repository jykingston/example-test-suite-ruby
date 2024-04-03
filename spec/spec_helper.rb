require "buildkite/test_collector"

Buildkite::TestCollector.configure(hook: :rspec)
