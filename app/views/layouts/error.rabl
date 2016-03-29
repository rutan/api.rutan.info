object :response if params[:format] == 'xml'

node :meta do
  {
    status: status,
    error: @error
  }.delete_if { |_, v| v.nil? }
end

