# © José Bonnet
require 'json'

class SnippetApp < Sinatra::Base

  get '/' do
    logger.info(log_message) {'entered'}
    @snippets = Snippet.order(updated_at: :desc)
    erb :index
  end

  post '/snippets' do
    logger.info(log_message) {'entered'}
    @snippet = Snippet.create(title: params[:title], body: params[:body])
    if @snippet.save
      "Saved with title #{params[:title]}, body #{params[:body]}"
    else
      "Error saving!"
    end   
  end
end
