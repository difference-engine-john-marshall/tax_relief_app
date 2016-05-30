# John Marshall Law Innocent Spouse Tax Relief App #

# Dependency list:#

###Software Versions###
* Ruby Version 2.2.3
* Rails Version 4.2.5
* PostgreSQL 0.15
* RSpec 3.4.2
* FactoryGirls 4.6
* AngularJS

###Notable Gems###
* gem 'pg', '~> 0.15' - A ruby interface for PostgreSQL
* gem 'bootstrap-sass', '~> 3.3.6' - A gem that allows the user to implement the Bootstrap Framework
* gem 'jbuilder', '~> 2.0' - A gem that allows the user to work with API's
* gem 'tinymce-rails' - A ruby interface for a user text editor
* gem 'devise', '~> 3.5' - A ruby gem for authentication
* gem 'rspec-rails', '3.4.2' - A ruby gem that allows a user to create tests for the application
* gem 'factory_girl_rails', '~> 4.6' - Used in tandem with RSpec to create factories for tests.
* gem 'puma', '~> 3.2.0' - A concurrent web server for Ruby

#Users and Admins#

###Users###

A user can ...
* see the home page 
* fill out the tax relief questionnaire by visiting '/questions'
* see the faq page by visiting '/faq'

###Admins###

An admin can ...
* sign in at '/admins/sign_in'
* only sign up by email invite.

###Admins Dashboard###

An admin at the dashboard '/dashboard' can ...
* view all relief form questions and answers at '/dashboard/questions'. They can also edit and delete questions from here.
* view all faq questions and answers at '/dashboard/faqs'. They can also edit and delete faqs from here.
* create new questions at '/dashboard/questions/new'
* create new faqs at '/dashboard/faqs/new'
* view classic and equitable success pages text content at '/dashboard/contents'. They can also edit that text content from here.

###Super Admin###

An admin with the superadmin attribute can ...
* create new admins at '/dashboard/admins/new'
* delete admins at '/dashboard/admins/edit'

# Install Features #
After cloning this repo in your terminal, run
```terminal
bundle
```

# Database #
In the terminal after navigating to the application folder, you can create the database with
```terminal
rake db:create
```
To migrate the fields of the database run
```terminal
rake db:migrate
```
To seed the database with data run
```terminal
rake db:seed
```

#To Start The Application#
Inside the application folder in the terminal run
```terminal
rails s
```
to start the server. Go to localhost:3000 in your browser to see the application.

# Test Suite #
To run tests, in the terminal run
```terminal
bundle exec rspec
```


