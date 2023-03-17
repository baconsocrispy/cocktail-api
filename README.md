## CONFIGURATION

### Devise
* add devise gem to Gemfile
* `bundle install`
* install devise `rails g devise:install`
* add `require 'devise'` to top of config/application.rb
* In `config/initializers/devise.rb` set navigational formats to empty since this is API-Only:

` config.navigational_formats = []`

* create User model: `rails g devise User`
* create controllers: `rails g devise:controllers users -c sessions registrations`

* I needed to create a session store and add session middleware as they are 
disabled by default in API only apps. In `application.rb` I added:

```
# initialize session store & options, key takes form of '_app_name_session'
config.session_store :cookie_store, key: '_cocktail_session'

# add session middleware to Rack stack
config.middleware.use ActionDispatch::Cookies
config.middleware.use config.session_store, config.session_options
config.middleware.use ActionDispatch::Session::CookieStore
```


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


## CSRF
I created a CSRF controller with a csrf_token endpoint that passes a token
to the  frontend on fetch. I needed to include the ActiveController::RequestForgeryProtection
module to have access to the request_forgery_protection_token method. I
also needed to add the get route to the routes.rb file. 

## DEVISE AUTH
As this is an API-only backend, I am using Devise and Devise-jwt to manage
authentication and authorization. Rather than using cookie/session-based
auth, devise-jwt creates JSON-web-tokens that allow for stateless authentication
(the jwt is stored on the frontend on login and each backend request is 
authenticated using the token rather than storing a logged-in state in a 
session table). 

* add devise and devise-jwt gems to Gemfile
* `bundle install`
* install devise `rails g devise:install`
* add `require 'devise'` and `require devise/jwt` to top of config/application.rb
* In `config/initializers/devise.rb` set navigational formats to empty since this is API-Only:

` config.navigational_formats = []`

* configure routes (see routes.rb)
* configure jwt (see devise.rb)

* create User model: `rails g devise User`
* create controllers: `rails g devise:controllers users -c sessions registrations`