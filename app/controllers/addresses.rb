require_relative "../models/address"

get "/" do
    erb :"index"
end

get "/address/new" do
  @address = Address.new
  erb :"/addresses/_form"
end
