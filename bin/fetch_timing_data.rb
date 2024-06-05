#!/usr/bin/env ruby

require 'net/http'
require 'uri'

spec_files = Dir["spec/**/*.rb"]
paths = spec_files.join("&paths[]=")

# Define the URL and Bearer token
url = "https://api.buildkite.com/v2/analytics/organizations/jimjams/suites/ta-example/test_files?paths[]=#{paths}"
puts url
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

# Output the response body
puts response.body
