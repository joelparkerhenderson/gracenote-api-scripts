# Demo of the Gracenote API to get movies and showings

This demo connects to the Gracenote API to get a list of movie showings.

To start, please see the [Gracenote Developer site and API Explorer tool](http://developer.tmsapi.com/io-docs)

The API provides URIs that look like this:

    http://data.tmsapi.com/v1.1/movies/showings
    ?api_key=tc7uqt2rvrygddhszep6zuvs
    &zip=10017
    &startDate=2017-08-01

The URI is a typical RESTful method with these pieces:

  * Entry point "http://data.tmsapi.com"
  * Semantic version number "v1.1"
  * RESTful nested method "movies/showings"
  * Query string with the API key and filters.


## Usage

Get your own Gracenote API key:

  1. Go to Gracenote and create a developer account and app.

  2. Go to http://data.tmsapi.com/

  3. Obtain your own free API key for the free public plan.

Optionally verify that your API key works:

  1. Try the `curl` command or `wget` command.

  2. Example: `curl 'http://data.tmsapi.com/v1.1/movies/showings?api_key=tc7uqt2rvrygddhszep6zuvs&zip=10017&startDate=2017-08-01'`

  3. The demo output is JSON text of the showings.

Use the Ruby script:

  1. Change the demo API key to your own API key.

  2. Run the Ruby script: `ruby demo.rb`

  3. The output is typical JSON text.


## Demo output 

This repo has examples of demo output JSON text:

  1. `demo-output.json` - this is actual output.

  2. `demo-output-with-formatting.json` - formatting for humans to read.

  3. `demo-output-with-filtering.json` - example of post-processing filters using the `jq` command; see below for info.


## Location

The API needs the movies showings request to provide a location, 
by using a U.S. zip (a.k.a. postal code) or latitude and longitude.

This demo uses the location of New York City Grand Central Station,
which is zip 10017. 

You'll likely want to edit the script for your own location.


## Help

If you run the ruby script and get an error about missing JSON:

  * Do you have a Ruby JSON gem?

  * Try to install the json gem: `gem install json`

  * Run the script again.

If you get error messages about API rate limiting:

  * Are you trying to make more calls faster than the free public plan allows? 

  * Be sure you edited the script to use your own API key, not the demo API key.

  * Try waiting a minute then try just 1 call.

If you need more help, please open an issue and we'll take a look.


## How to filter JSON with `jq`

One way to filter JSON and format it is to use the `jq` command.

To learn `jq` please see https://stedolan.github.io/jq/

For example, if we care most about showtims, and not about the movie content,
then we can use the `jq` command to delete many of the JSON fields.

Example:

    cat demo-output.json | 
    jq 'del(.[] | 
    	.advisories,
    	.animation,
    	.audience,
    	.descriptionLang,
    	.directors,
    	.entityType,
    	.genres,
    	.longDescription,
    	.officialUrl,
    	.preferredImage,
    	.qualityRating,
    	.ratings,
    	.releaseDate,
    	.releaseYear,
    	.runTime,
    	.shortDescription,
    	.subType,
    	.titleLang,
    	.topCast,
		.showtimes[].barg,
		.showtimes[].quals,
		.showtimes[].ticketURI
    	)'

To see the result, see the file `demo-output-with-filtering.json`.

The filtering saves approximately half the data size.




