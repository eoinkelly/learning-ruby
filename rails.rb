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

rails new <projectname>
cd <projectname>
rake about # gives a bunch of info about the project
rake doc:rails # builds rails api docs, also online at http://api.rubyonrails.org/
rails server
rails generate controller <ControllerClassName> <method1> <method2> ...
ctrl+pause to kill rails server in windows cmd prompt


helpers:
  link_to "Pretty Text" <controllernamelowercase>_<methodname>_path


<%= %>
Content between <%= and %> is executed as ruby code and the result is converted to a string and pasted in instead.
How does this conversion happen? Is there a to_s invoked somewhere? if so, where?

<% %>
Content between these is executed as ruby code but not converted to a string - I think any output is thrown away -check this