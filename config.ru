require 'bundler'
require 'rexml/document'
require 'json'
Bundler.require

$: << File.expand_path('../src', __FILE__)

use Rack::Config do |env|
  env['api.tilt.root'] = File.expand_path('../view', __FILE__)
end

require 'rutan_api/root'

run RutanAPI::Root

