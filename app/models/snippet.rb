require 'sinatra/activerecord'

class Snippet < ActiveRecord::Base
  validates :body, presence: true
end
