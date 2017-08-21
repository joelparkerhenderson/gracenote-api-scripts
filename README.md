# Demo of the Gracenote API to get movies and showtimes

This demo connects to the Gracenote API to get a list of movie showings.

Setup:

  1. Go to Gracenote and create a developer account and app.
  2. Go to http://data.tmsapi.com/
  3. Obtain a free API key for the free public plan.

The API needs the movie showtimes request to provide a location, 
by using a U.S. zip (a.k.a. postal code) or latitude and longitude.

This demo uses the location of New York City Grand Central Station.

A complete URI looks like this:

    http://data.tmsapi.com/v1.1/movies/showings?
    api_key=tc7uqt2rvrygddhszep6zuvs&zip=10017

If you run this and get an error about missing JSON, 
then try to install the json gem like this:

    gem install json

