# © José Bonnet
require 'json'

class SnippetApp < Sinatra::Base

  get '/' do
    logger.info(log_message) {'entered'}
    logger.info(log_message) {"session=#{session.inspect}"}
    @snippets = Snippet.order(updated_at: :desc)
    erb :index
  end

  post '/snippets' do
    logger.info(log_message) {'entered'}
    @snippet = Snippet.create(title: params[:title], body: params[:body])
    if @snippet.save
      session[:message] = "Snippet titled \"#{params[:title]}\" saved!"
      logger.info(log_message) {"session=#{session.inspect}"}
    else
      session[:message] = "Snippet titled \"#{params[:title]}\" NOT saved!"
      logger.info(log_message) {"session=#{session.inspect}"}
    end   
    redirect '/'
  end
end
