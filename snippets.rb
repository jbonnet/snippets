# © José Bonnet
# encoding: utf-8
ENV['RACK_ENV'] ||= 'production'

require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/logger'
#require 'sinatra/sessions'

# Require the bundler gem and then call Bundler.require to load in all gems listed in Gemfile.
require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

['app/commands', 'app/models', 'app/views'].each do |dir|
  Dir[File.join(File.dirname(__FILE__), dir, '**', '*.rb')].each do |file|
    require file
  end
end

class SnippetApp < Sinatra::Base
  register Sinatra::CrossOrigin
  register Sinatra::ActiveRecordExtension
  register Sinatra::Logger
  
  set :root, File.dirname(__FILE__)
  set :public_folder, File.join(File.dirname(__FILE__), 'public')
  set :views, Proc.new { File.join(root, "app/views") }
  set :bind, '0.0.0.0'
  set :time_at_startup, Time.now.utc
  set :environments, %w(development test production)
  set :environment, ENV['RACK_ENV'] || :development

  # Sessions
  enable :sessions
  
  # Logging
	enable :logging
  set :logger_level, :debug # or :fatal, :error, :warn, :info
  FileUtils.mkdir(File.join(settings.root, 'log')) unless File.exists? File.join(settings.root, 'log')
  logfile = File.open(File.join('log', ENV['RACK_ENV'])+'.log', 'a+')
  logfile.sync = true
  logger = Logger.new(logfile)
    
  enable :cross_origin

  logger.info("SnippetApp") {"started at #{settings.time_at_startup}"}

  get '/' do
    logger.info(log_message) {'entered'}
    logger.info(log_message) {"session=#{session.inspect}"}
    @snippets = ShowManySnippetsCommand.new.execute
    erb :index
  end

  post '/snippets' do
    logger.info(log_message) {'entered'}
    @snippet = CreateSnippetCommand.new(title: params[:title], body: params[:body], logger: logger).execute
    if @snippet
      session[:message] = "Snippet titled \"#{params[:title]}\" saved!"
      logger.info(log_message) {"session=#{session.inspect}"}
    else
      session[:message] = "Snippet titled \"#{params[:title]}\" NOT saved!"
      logger.info(log_message) {"session=#{session.inspect}"}
    end   
    redirect '/'
  end
  private
  def log_message
    "#{self.class.name} #{request.env["REQUEST_METHOD"]} #{request.env["REQUEST_PATH"]}"
  end
end
