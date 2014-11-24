#create new address

get '/contacts/:id/addresses/new' do
	@contact = Contact.find(params[:id])
  	@address = Address.new 
  	erb :'/addresses/new'
end

post '/contacts/:id/addresses' do
	@contact = Contact.find(params[:id])
  #@address = Address.create(params[:address])
  	@contact.addresses.create(params[:address])

  redirect "/contacts/#{@contact.id}"
end

#edit existing address

get '/contacts/:id/addresses/:address_id/edit' do
	@contact = Contact.find(params[:id])
	@address = @contact.addresses.find(params[:address_id])

	erb :'/addresses/edit'
end


#put or post??
post '/contacts/:id/addresses/:address_id' do
  @contact = Contact.find(params[:id])
  @address = @contact.addresses.find(params[:address_id])
  @address.update(params[:address])

  redirect "/contacts/#{@contact.id}"
end