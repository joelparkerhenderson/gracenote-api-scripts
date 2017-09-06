# Gracenote API to get theatres, movies, showings

These scripts connect to the Gracenote API to get a list of movie showings.

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

Get your own Gracenote API key:

  1. Go to Gracenote and create a developer account and app.

  2. Go to http://data.tmsapi.com/

  3. Obtain your own free API key for the free public plan.

Verify that your API key works:

  1. Try the `curl` command or `wget` command.

  2. Example: `curl 'http://data.tmsapi.com/v1.1/movies/showings?api_key=abcdefghijklmnops&zip=10017&startDate=2017-08-01'`

  3. The demo output is JSON text of the showings.


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

If you get error messages about "curl" missing:

  * Be sure you have the curl command installed.

  * Verify you can run this example command: `curl https://google.com`
  
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
  * Version: 3.0.0
  * Created: 2017-08-22
  * Updated: 2017-09-05
  * License: GPL
  * Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)
