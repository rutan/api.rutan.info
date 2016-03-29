require 'bundler'
require 'rexml/document'
require 'json'
Bundler.require

$: << File.expand_path('../app', __FILE__)

use Rack::Config do |env|
  env['api.tilt.root'] = File.expand_path('../app/views', __FILE__)
end

require 'apis/root'

run RutanAPI::Root

