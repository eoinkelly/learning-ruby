# INBOX

# really cool tdd class http://www.youtube.com/watch?v=ra8Q0M3DJYk
# http://ruby.railstutorial.org/

# rails routing is http://<server-name>/<controller-name/<action-name>
# rails calls methods within controllser "action methods"
# each action method typically has it's own view
# in erb the <% %> and <%= %> are different!
# activepack is the rails component that implemetns controllers and views
# activerecord is the rails component that implemetns models

# writing tests first lets us test whether the test itself works as we actually
# see the red and green states. if we wrote test after implemetation we would
# have to comment out the implementation to test the red state - this takes
# longer.

# running your test in the red state checks for any problems in the test itself - you can check that it is actually failing in the expected way

# a class is a combination of state and methods

# Command Line
# ############

# rails new <projectname>
# cd <projectname>
# rake about # gives a bunch of info about the project
# rake doc:rails # builds rails api docs, also online at http://api.rubyonrails.org/
# rake -T # list all rake tasks available
# rake -D <taskname> # get a description of a task
# rails server
# rails server -e development # or set RAILS_ENV to rake
# rails server -e test
# rails server -e production
# rails generate controller <ControllerClassName> <method1> <method2> ...

# rake db:migrate
# rake db:rollback
# rake db:migrate:redo # this can help if get weird problems
# rake db:seed # replace the database with whatever /db/seeds.rb gives us

# rails destroy # delete the stuff created by generate
# ctrl+pause to kill rails server in windows cmd prompt
# rails generate scaffold Product title:string description:text image_url:string price:decimal


# Rails Helpers
# #############

# * link_to
#   link_to "Pretty Text" <controllernamelowercase>_<methodname>_path

#   when using method: :delete
#     * can take 'method' parameter that specifies which HTTP method to use. rails puts a data-method="delete".
#     * The rails js then POST request and sends a form data field of '_method: delete' when rails gets this it knows

#   HTML forms (up to HTML version 4 and XHTML 1) only support GET and POST as HTTP
#   request methods. A workaround for this is to tunnel other methods through POST
#   by using a hidden form field which is read by the server and the request
#   dispatched accordingly.

#   However, for the vast majority of RESTful web services GET, POST, PUT and DELETE
#   should be sufficient. All these methods are supported by the implementations of
#   XMLHttpRequest in all the major web browsers (IE, Firefox, Opera).

#   The default rails JS (loaded from jquery_ujs.js) is setup to automatically do stuff based on data-* attributes in HTML elements
#     data-confirm = popup an alert box requesting confirmation
#     data-method = what HTTP verb should we use here
#   These data-* attributes are placed on elements using the rails helpers e.g. link_to

# * cycle
# * truncate
# * strip_tags
# * image_tag url, class: 'class-name'

# <%= %>
# Content between <%= and %> is executed as ruby code and the result is converted to a string and pasted in instead.
# How does this conversion happen? Is there a to_s invoked somewhere? if so, where?

# <% %>
# Content between these is executed as ruby code but not converted to a string - I think any output is thrown away -check this

# By convention, POST requests are associated with 'create' actions (aka methods) in rails

# Rails Naming Conventions
# ------------------------

# Rails assumes:
# * database table names are plural, lowercase, separated by _ .g. orders, line_items
# * class names are MixedCase and are the singular version of the table name e.g. Order, LineItem
# * files are named in lowercase, words separated by _
#   ? does Person -> people work? or is it a simple "add s" mapping

# To get the table name from the class name:
1. lowercase it
2. separate words with underscores
3. pluralize it using a fairly sophisticated algorightm

# Aside: pluralising table names is controversial, some DBAs reckon the table
# name should refer to what one record in it represents.
# * You can turn it off with
#   ActiveRecord::Base.pluralize_table_names = false
# * Devs like plural names as we think of tables as "collections"

# For the 'foo' controller, rails assumes
# * They are stored in /app/controllers
# * The file name is foo_controller.rb
# * The class name is FooController
# * The helper module is in the file /app/helpers/foo_helper.rb
# * The helper module is named FooHelper
# * The view templates for this controller are in /app/views/foo/
# * The output of those templates should be wrapped in the /app/views/layouts/foo.html.erb

# For the 'book' controller that exists in the admin dir
# * controller is in /app/controllers/admin/book_controller.rb
# * class name is Admin::BookController
# * View templates are in /app/views/admin/book/
# * Admin::BookHelper and is found in /app/helpers/admin/book_helper.rb

# For the 'book' controller that exists in the content dir
# * Content::BookController class is in /app/controllers/content/book_controller.rb
# * View templates are in /app/views/content/book/
# * The helper module is named Content::BookHelper and is found in /app/helpers/content/book_helper.rb

# there is a view template for each action (method) but how do these get combined into layouts?

# * Rails classes that wrap database tables provide a set of *class level* methods that perform *table level* operations
#   * class level = I don't need an instance of the object.
#   * table level = SQL operations that are ???

# so the class maps to the table as a whole and each row maps to an instance of the class?

# ORM maps
#   classes to tables
#   objects to rows
#   attributes to columns

# Class level methods are used to perform operations on tables and instance methods are used to perform operations on individual rows

# Active Record = the Rails ORM layer

require 'active_record'

class Order < ActiveRecord::Base
end


order = Order.find(1) # .find operates on the table so is class level
order.pay_type = 'Purchase Order'
order.save # .save operates on an individual row so is an instance method

# ? is there a "save" that operates on the whole table?

# Examples of class methods in ORM
# .where
# .find

# Active record also does validation of the data

# Rails makes heavy use of class level methods. Normally these methods make
# assertions about the class so AWDWR calls them "declarations"

# rails mixes in helper modules into the *view* templates

# YAML
# ####

# * YAML is whitespace sensitive (indentation matters)
# * Used extensively in rails for representing data

# Marshaliling - convert an object to a stream of bytes that can later be read into this (or another) app.
# * Not all object can be marshalled e.g.
#   objects that include bindings
#   instances of IO classes
# singleton objects
#   anonymous modules or classes (???)

# * Rails uses marshalling to store session data We use the 'model' declaration in
# * the controller to list all objects that will be marshalled - this lets rails
# * load the encessary classes to understand them.

# Format is: class NewClass < ModuleName::ClassName
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      # t.string(:title)
      t.text :description
      # t.text(:description)
      t.string :image_url
      # t.string(:image_url)
      t.decimal :price, precision: 8, scale: 2
      # t.decimal(:price, {precision: 8, scale: 2})
      t.timestamps
    end
  end
end


# Sometimes a class method needs to create an instance of the object

# Consider:
class Person < ActiveRecord::Base
  def self.for_dave # by specificing the receiver I am making a class method (bit confused about mechanics of this??)
    Person.new(name: 'dave') # Person.new({ name: 'Dave'})
  end
end

# problem is that anything that inherits from Person will create a new person too

class Employee < Person
end

dave = Employee.for_dave # => returns a Person, not an Employee

class Person < ActiveRecord::Base
  def self.for_dave # by specificing the receiver I am making a class method (bit confused about mechanics of this??)
    self.new(name: 'dave') # self.new returns a new object of the receivers class (so will return an Employee, not a Person above)
  end
end

# bottom line: self.new returns a new object of the receivers class

# Creating our own require_relative

require File.dirname(__FILE__) + '/../test_helper' # book recommends this but can't we just use require_relative
require_relative '/../test_helper'


# Book: Chapter 18 Naming Conventions

# the lib folder holds:
# * code that doesn't fit neatly into a model, view or controller
# * code that is shared between models, views, controllers
# * You can create sub dirs within /lib to organise your code

# * The 'script' dir is for scripts you run from command line that do various maintenace tasks to the app

# Task put some code in the lib dir and  use it both in crontoller and view


# Rails Start-up
# ##############

#   1. Loads and exectues config/enfironment.rb and config/application.rb
#   2. Set load path to include these dirs (iff they exist)
#     * app/controllers
#     * app/models
#     * /vendor
#     * the lib sub-dir in any plugin dir
#     * /app
#     * /app/helpers
#     * /app/mailers
#     * /app/services
#     * /lib

#   3. Load the per environment config file e.g.
#   /config/environments/development.rb Note that the switch that decides which
#   environment to load is external to rails.
#     * You can add new environments if you need e.g. /config/environments/staging.rb

# Rails Naming Conventions
# ######################

# Scaffolding
# ###########

# A scaffold for a model creates
# 1. model
# 2. views
#   * _form
#   * edit
#   * index
#   * new
#   * show
# 3. controller
# 3. an empty helper module
# 3. css
#   * scaffolds css ?
# 3. js/coffee
#   * empty coffee file
# 4. db migration
# 5. functional tests
# 6. starters for unit tests
# 6. starter test fixtures

# for a given model in one go

# Example:
# rails generate scaffold Product title:string description:text image_url:string price:decimal

# * rails takes the calss name we gave it (Product) and creates a pluralized, lowercased, underscore seperated version of it and uses that as the table name in the db migration
# * rails now has the table name and can figure out which database to use from /config/database.yml and also knowing which environment we are running in.