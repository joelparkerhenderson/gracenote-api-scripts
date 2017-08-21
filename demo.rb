#!/usr/bin/env ruby

##
# Demonstration of the Gracenote API to get movies and showtimes.
# https://github.com/joelparkerhenderson/demo_gracenote_api_for_movies_showtimes
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
