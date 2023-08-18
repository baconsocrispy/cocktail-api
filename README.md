## CONFIGURATION

### Server
In `config/puma.rb` set default port to 3001

#### CORS
Since frontend and backend are running on different ports, use the rack-cors
gem to allow CORS. 
* add `rack-cors` gem to development/production group in gemfile
* `bundle install`
* in `config/initializers/cors.rb` uncomment everything and configure resource list appropriateley
* replace `example.com` with `http://localhost:3000` (in production put the primary domain(s))
* under resource "*" and under 'headers: any', add 'expose: ['Authorization']'

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
* configure jwt (see below/devise.rb)

```
# ==> Configuration for JWT
  config.skip_session_storage = [:http_auth]

  config.jwt do |jwt|
    # secret is used to 'sign'/authenticate tokens received from the client
    jwt.secret = Rails.application.credentials.fetch(:secret_key_base)
  
    # appends jwt token to Authorization header as Bearer + token on login POST
    jwt.dispatch_requests = [
      ['POST', %r{^/login$}]
    ]
  
    # removes jwt token from Authorization header on logout DELETE
    jwt.revocation_requests = [
      ['DELETE', %r{^/logout$}]
    ]
  
    # sets the token's expiration time
    jwt.expiration_time = 60.minutes.to_i
  end
```

* create User model: `rails g devise User`
* create controllers: `rails g devise:controllers users -c sessions registrations`

* Very Helpful: https://dakotaleemartinez.com/tutorials/devise-jwt-api-only-mode-for-authentication/

CABINET PARAMS

```
{"name"=>"Carter's Liquor Cabinet",
 "user_id"=>"1",
 "portions_attributes"=>
  {"0"=>{"ingredient_id"=>"104", "amount"=>"", "unit"=>""},
   "1"=>{"ingredient_id"=>"44", "amount"=>"", "unit"=>""},
   "2"=>{"ingredient_id"=>"130", "amount"=>"", "unit"=>""},
   "3"=>{"ingredient_id"=>"3", "amount"=>"", "unit"=>""}},
 "tool_ids"=>["8", "12"]}
 ```