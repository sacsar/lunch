require 'sinatra'

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

restaurantlist=[bona,jasmine,mesa,wally,camdi]

get '/' do
  erb :index
end

post '/lunch' do
  consider=Array.new
  if params[:location] == "any"
    consider = restaurantlist.entries
  else
    consider = restaurantlist.select{|restaurant| restaurant.location == params[:location]}
  end
  if params[:fast] == "yes"
    consider.select!{|restaurant| restaurant.fast}
  end
  if params[:cheap] == "yes"
    consider.select!{|restaurant| restaurant.cheap}
  end
  r=rand(consider.size)
  @choice = consider[r]
  erb :lunch
end