## CONFIGURATION

### Devise
* add devise gem to Gemfile
* `bundle install`
* install devise `rails g devise:install`
* add `require 'devise'` to top of config/application.rb

### Server
In `config/puma.rb` set default port to 3001

### Testing
* Add rspec-rails, guard and guard-rails gems to development test groups
* bundle install
* initialize rspec-rails `rails g rspec:install --rails`
* set documentation to verbose in `spec_helper.rb` by adding `config.formatter = 'doc'`
* initialize guard with rspec `bundle exec guard init rspec`
* Run guard with `bundle exec guard`
