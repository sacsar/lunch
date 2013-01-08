require 'sinatra'
require 'slim'

class Restaurant
  attr_accessor :name, :location, :fast, :cheap
  
  def initialize (name, location, fast = false, cheap = false)
    @name = name
    @location = location
    @fast = fast
    @cheap = cheap
  end
end

bona=Restaurant.new("Bona","wash")
jasmine=Restaurant.new("Jasmine Orchard","wash")
mesa=Restaurant.new("Mesa","dinkytown",true,true)
wally=Restaurant.new("Wally's","dinkytown")
camdi=Restaurant.new("Camdi","dinkytown")

restaurantlist=[bona,jasmine,mesa,wally]

get '/' do
  slim :index
end

post '/lunch' do
  consider=Array.new
  if params[:location] == "any"
    consider = restaurantlist
  else
    restaurantlist.each do |restaurant|
      if params[:location] == restaurant.location
        consider.push(restaurant)
      end
    end
  end
  r=rand(consider.size)
  @choice = consider[r]
  slim :lunch
end