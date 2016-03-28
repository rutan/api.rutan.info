module RutanAPI
  module V1
    class Root < Grape::API
      version 'v1', using: :path

      namespace :help do
        resource :ping do
          get rabl: 'v1/commons/message.rabl' do
            @message = 'hoge'
          end
        end
      end
    end
  end
end
