# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
# Add beautifully gzipped responses
use Rack::Deflater

run Rails.application
