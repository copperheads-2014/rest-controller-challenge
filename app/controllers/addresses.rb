get '/contacts/:id/addresses/new' do |id|
  @contact = Contact.find(id)
  @address = Address.new
  erb :'addresses/new'
end

post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @contact.addresses << Address.create(params[:address])
  redirect "/contacts/#{@contact.id}"
end

get '/contacts/:id/addresses/:id/edit' do |con_id, addr_id|
  @contact = Contact.find(con_id)
  @address = Address.find(addr_id)
  erb :'addresses/edit'
end

put '/contacts/:id/addresses/:id' do |con_id,addr_id|
  @address = Address.find(addr_id)
  @address.update(params[:address])
  redirect "/contacts/#{con_id}"
end

delete '/contacts/:id/addresses/:id' do |con_id,addr_id|
  @address = Address.find(addr_id)
  @address.destroy
  redirect "/contacts/#{con_id}"
end
