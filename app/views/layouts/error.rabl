object :response if params[:format] == 'xml'

node :meta do
  {
    status: status,
    error: env['rutan_api.message'],
    hoge: @message
  }.delete_if { |_, v| v.nil? }
end
