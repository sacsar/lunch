require 'sinatra'
require 'slim'

class Restaurant
  attr_accessor :name, :location, :fast, :cheap
  
  def initialize (name, location, fast = False, cheap = False)
    @name = name
    @location = location
    @fast = fast
    @cheap = cheap
  end
end

get '/' do
  slim :index
end