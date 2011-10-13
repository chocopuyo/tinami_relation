# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TinamiRelation::Application.initialize!

require "#{Rails.root}/lib/tinami"
require "#{Rails.root}/lib/ex_tinami"
