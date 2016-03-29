require 'apis/error_formatter'
require 'apis/v1/root'

module RutanAPI
  class Root < Grape::API
    formatter :xml, Grape::Formatter::Rabl
    formatter :json, Grape::Formatter::Rabl
    error_formatter :xml, RutanAPI::ErrorFormatter
    error_formatter :json, RutanAPI::ErrorFormatter

    before do
      # 拡張子無しのリクエストやめてほしい
      unless params[:format]
        params[:format] = 'xml'
        error!('require extension xml or json.', 400)
      end
    end

    mount RutanAPI::V1::Root
  end
end

