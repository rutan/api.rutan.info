require 'apis/v1/helps/ping'

module RutanAPI
  module V1
    module Utils
      class ShuffleName < Grape::API
        version 'v1', using: :path

        namespace :utils do
          resource :shuffle_name do
            params do
              requires :name, type: String, desc: 'shuffle name'
            end
            post rabl: 'commons/message.rabl' do
              @message = params[:name].split(//).shuffle.join
            end
          end
        end
      end
    end
  end
end
