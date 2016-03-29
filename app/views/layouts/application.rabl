object :response if params[:format] == 'xml'

node :meta do
  {
    status: status,
    error: @error
  }.delete_if { |_, v| v.nil? }
end

node(:result) do
  case params[:format]
  when 'json'
    JSON.parse(yield)
  when 'xml'
    (Nori.new(parser: :rexml).parse(yield) || {})['hash']
  end
end

