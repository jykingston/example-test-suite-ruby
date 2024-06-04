require 'yaml'
require "buildkite/test_collector"

Buildkite::TestCollector.configure(
  hook: :rspec,
  # url: "http://analytics-api.buildkite.localhost/v1/uploads",
  token: ENV["BUILDKITE_ANALYTICS_TOKEN"]
)

skip = YAML.load_file('skip.yml')

skip_location = skip['location'].reduce({}) { |m, t| m[t] = true; m }
skip_description = skip['description'].reduce({}) { |m, t| m[t] = true; m }

RSpec.configure do |c|
  c.around :example do |example|
    next if skip_location[example.location]
    next if skip_description[example.full_description]
    example.run
  end
end
