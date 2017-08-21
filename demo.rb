#!/usr/bin/env ruby

##
# Demonstration of the Gracenote API
#
# This script connects to the Gracenote API to get a list of movie showings.
#
# Setup:
#
#   1. Go to Gracenote and create a developer account and app.
#   2. Go to http://data.tmsapi.com/
#   3. Obtain a free API key for the free public plan. 
# 
# The API needs the movie showtimes request to provide a location, 
# by using a U.S. zip (a.k.a. postal code) or latitude and longitude.
# This demo uses the location of New York City Grand Central Station.
#
# A complete URI looks like this:
#
#     http://data.tmsapi.com/v1.1/movies/showings?
#     api_key=tc7uqt2rvrygddhszep6zuvs&zip=10017
#
# If you run this and get an error about missing JSON, 
# then try to install the json gem like this:
#
#     gem install json
#
##

require 'net/http'
require 'date'
require 'json'

uri = URI("http://data.tmsapi.com/v1.1/movies/showings")

params = { 
  api_key: "tc7uqt2rvrygddhszep6zuvs", 
  zip: 10017,
  startDate: Date.today.to_s
}

uri.query = URI.encode_www_form(params)
puts uri.to_s

response = Net::HTTP.get_response(uri)

json = case response
when Net::HTTPSuccess
  JSON.parse response.body
when Net::HTTPUnauthorized
  {'error' => "#{response.message}: is the api key correct?"}
when Net::HTTPServerError
  {'error' => "#{response.message}: try again later?"}
else
  {'error' => response.message}
end

p json
