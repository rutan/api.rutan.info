require 'apis/v1/utils/shuffle_name'
require 'apis/v1/helps/ping'

module RutanAPI
  module V1
    class Root < Grape::API
      mount RutanAPI::V1::Utils::ShuffleName
      mount RutanAPI::V1::Helps::Ping
    end
  end
end
