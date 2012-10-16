class ApplicationController < ActionController::Base
  # layout "custom_thing" # tells rails to use app/views/layouts/custom_thing.html.erb as default layout for all views
  protect_from_forgery
end
