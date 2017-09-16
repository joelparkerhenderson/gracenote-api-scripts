# Gracenote API to get theatres, movies, showings

<img src="README.png" alt="Gracenote" width="300" height="88" />

These scripts connect to the Gracenote API to get information about theatres, movies, showings, programs, celebrities, and the like.

The  API uses REST and JSON, and these scripts use the commands `curl` and `jq` to manage data.

See the [Gracenote Developer site and API Explorer tool](http://developer.tmsapi.com/io-docs)


## What is the Gracenote API?

These scripts use the Gracenote "OnConnect Data Delivery APIs".

The API provides URIs that look like this:

    http://data.tmsapi.com/v1.1/movies/showings
    ?api_key=abcdefghijklmnops
    &zip=10017
    &startDate=2017-08-01

The URI is a typical RESTful method with these pieces:

  * Entry point "http://data.tmsapi.com"
  * Semantic version number "v1.1"
  * RESTful nested method "movies/showings"
  * Query string with the API key and filters.


## How to get started?

Get your own Gracenote developer account and API key:

    http://data.tmsapi.com/

Verify that your API key works by trying curl:

    curl 'http://data.tmsapi.com/v1.1/movies/showings?api_key=12345678&zip=10017&startDate=2017-08-01'`

IMPORTANT: export your API key to your shell environment:

    $ export GRACENOTE_API_KEY=12345678


## What is the location?

The API needs the movies showings request to provide a location, 
by using a U.S. zip (a.k.a. postal code) or latitude and longitude.

Our examples use this location:

  * Grand Central Station in New York City
  * Street address: 89 E 42nd St, New York, NY 10017
  * Postal code: 10017
  * Latitude: 40.7527
  * Longitude -73.9772


## Help

If you get error messages about GRACENOTE_API_KEY needed:

  * Be sure you have set your own key in your own shell environment.

  * Example: `export GRACENOTE_API_KEY=12345678`

If you get error messages about a command missing, such as "curl" or "jq":

  * Be sure you have the command installed.

  * Example: `curl http://google.com`

  * Example: `jq --help`

If you get error messages about API rate limiting:

  * Are you trying to make more calls faster than the free public plan allows? 

  * Be sure you edited the script to use your own API key, not the demo API key.

  * Try waiting a minute then try just 1 call.

If you want to work with the JSON, such as filtering it:

  * One way to handle JSON and format it is to use the `jq` command.

  * To learn `jq` please see https://stedolan.github.io/jq/

If you need more help, please open an issue and we'll take a look.


## Tracking

  * Package: gracenote_api_scripts
  * Version: 3.3.0
  * Created: 2017-08-22
  * Updated: 2017-09-14
  * License: GPL
  * Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)
