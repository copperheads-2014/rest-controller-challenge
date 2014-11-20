get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

get '/contacts/new' do
  @contact = Contact.new
  erb :'contacts/new'
end

post '/contacts' do
  contact_data = params["contact"]
  @contact = Contact.create(name: contact_data["name"], email: contact_data["email"])
  redirect '/contacts'
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end

post '/contacts/:id' do
  @contact = Contact.find(params[:id])
  contact_data = params["contact"]
  @contact.update(name: contact_data["name"], email: contact_data["email"])
  redirect '/contacts'
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect '/contacts'
end

get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = Address.new
  erb :'addresses/new'
end

post '/contacts/:id/addresses' do
  p params
  @contact = Contact.find(params[:id])
  contact_data = params["address"]
  @contact.addresses << Address.create(street: contact_data["street"], city: contact_data["city"], state: contact_data["state"], zip: contact_data["zip"])
  redirect:"/contacts/#{@contact.id}"
end

get '/contacts/:id/addresses/:id/edit' do |contact_id, address_id|
  @contact = Contact.find(contact_id)
  @address = @contact.addresses.find(address_id)
  erb :'/addresses/edit'
end

post '/contacts/:id/addresses/:id' do |contact_id, address_id|
  @contact = Contact.find(contact_id)
  @address = @contact.addresses.find(address_id)
  contact_data = params["address"]
  @address.update(street: contact_data["street"], city: contact_data["city"], state: contact_data["state"], zip: contact_data["zip"])
  redirect:"/contacts/#{@contact.id}"
end

delete '/contacts/:id/addresses/:id' do |contact_id, address_id|
  @contact = Contact.find(contact_id)
  @address = @contact.addresses.find(address_id)
  @address.destroy
  redirect:"/contacts/#{@contact.id}"
end




