# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'log4r'
# Initialize the Rails application.
Rails.application.initialize!

Rails.logger = Logger.new(STDOUT)
