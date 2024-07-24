#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'
require 'csv'

spec_files = Dir["spec/**/*.rb"]

# Define the URL and Bearer token
url = "https://api.buildkite.com/v2/analytics/organizations/test-analytics-sandbox/suites/rspec-example/tests/disabled"
bearer_token = ENV["API_ACCESS_TOKEN"]

if bearer_token.nil?
  puts "No API Access Token"
  return
end

uri = URI.parse(url)
request = Net::HTTP::Get.new(uri)
request["Authorization"] = "Bearer #{bearer_token}"
request["Content-Type"] = "application/json"

response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
  http.request(request)
end

File.open("skipped.json", 'w') do |file|
  file.puts(response.body)
end

skipped = JSON.parse(response.body)

File.open("skipped.md", 'w') do |file|
  file.puts("### Skipped Tests")
  file.puts("|test|location|")
  file.puts("|-|-|")

  skipped.each do |test|
    file.puts("|[#{test["name"]}](#{test["web_url"]})|#{test["location"]}|")
  end
end
