# eggplant

##System Dependencies

* Ruby 2.2.3 (install with rbenv)
* Rubygems
* Bundler (gem install bundler)
* PostgreSQL

# Getting Started

* Setup an application at [Twitter](https://apps.twitter.com/)
* clone the project
 * Copy the sample.env to .env and fill in the twitter_key and twitter_secret with the keys provided by your twitter app.

* run rake db:create
* run rake db:migrate
* start the app with foreman start
