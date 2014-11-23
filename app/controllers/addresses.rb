get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = Address.new
  erb :'/addresses/new'
end

post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @contact.addresses << Address.create!(params[:address])
  redirect "/contacts/#{@contact.id}"
end

get 'contacts/:id/addresses/:id' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:id])
end

