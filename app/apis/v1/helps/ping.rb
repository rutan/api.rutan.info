module RutanAPI
  module V1
    module Helps
      class Ping < Grape::API
        version 'v1', using: :path

        namespace :helps do
          resource :ping do
            get rabl: 'commons/message.rabl' do
              @message = 'pong'
            end
          end
        end
      end
    end
  end
end
