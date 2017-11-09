# © José Bonnet
require 'json'

class SnippetApp < Sinatra::Base

  get '/' do
    logger.info(log_message) {'entered'}
    erb :index
  end

  post '/snippets' do
    logger.info(log_message) {'entered'}
    "Title is #{params[:title]}, body is #{params[:body]}"
  end
end
