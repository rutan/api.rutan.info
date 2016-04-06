require 'apis/error_formatter'
require 'apis/v1/root'

module RutanAPI
  class Root < Grape::API
    formatter :xml, Grape::Formatter::Rabl
    formatter :json, Grape::Formatter::Rabl
    error_formatter :xml, RutanAPI::ErrorFormatter
    error_formatter :json, RutanAPI::ErrorFormatter

    ALLOW_FORMATS = %w(json xml)

    before do
      unless ALLOW_FORMATS.include?(params[:format].to_s)
        params[:format] = :json
        env['api.format'] = :json
        error!("require extension [#{ALLOW_FORMATS.join(', ')}]", 400)
      end
    end

    mount RutanAPI::V1::Root

    route :any, '*path' do
      error!('not found', 404)
    end
  end
end

