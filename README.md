## CONFIGURATION

### Devise
* add devise gem to Gemfile
* `bundle install`
* install devise `rails g devise:install`
* add `require 'devise'` to top of config/application.rb

### Server
In `config/puma.rb` set default port to 3001

#### CORS
Since frontend and backend are running on different ports, use the rack-cors
gem to allow CORS. 
* add `rack-cors` gem to development/production group in gemfile
* `bundle install`
* in `config/initializers/cors.rb` uncomment everything and configure resource list appropriateley
* replace `example.com` with `http://localhost:3000` (in production put the primary domain(s))

* helpful: https://medium.com/ruby-daily/understanding-cors-when-using-ruby-on-rails-as-an-api-f086dc6ffc41

## Testing
* Add rspec-rails, guard and guard-rails gems to development test groups
* bundle install
* initialize rspec-rails `rails g rspec:install --rails`
* set documentation to verbose in `spec_helper.rb` by adding `config.formatter = 'doc'`
* initialize guard with rspec `bundle exec guard init rspec`
* Run guard with `bundle exec guard`


## Pagination
* Add kaminari gem to pagination group in gemfile
* bundle install
* add `require 'kaminari' to application.rb`
* to generate a config file in config/intializers: `rails g kaminari:config`


