object :response if env['api.format'].to_s == 'xml'

node :meta do
  {
    status: (@status || status),
    error: env['rutan_api.message'],
    hoge: @message
  }.delete_if { |_, v| v.nil? }
end
