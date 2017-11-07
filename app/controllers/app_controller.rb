# © José Bonnet
class SnippetApp < Sinatra::Base

  get '/' do
    method = "#{self.class.name} #{request.env["REQUEST_METHOD"]} #{request.env["REQUEST_PATH"]}"
    logger.info(method) {'root accessed'}
    erb :index
  end
end
