module RutanAPI
  class ErrorFormatter
    class << self
      def call(message, _backtrace, _options, env)
        env['rutan_api.message'] = message
        env['api.tilt.layout'] = 'layouts/error'
        Grape::Formatter::Rabl.call(message, env)
      end
    end
  end
end

