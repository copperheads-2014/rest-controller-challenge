get '/contacts/:id/addresses/new' do
  @address = Address.new
  @contact = Contact.find(params[:id])
  erb :'addresses/new'
end

post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @address = Address.create(params[:address])
  @contact.addresses << @address 
  redirect "/contacts/#{@contact.id}"
end 

get "/contacts/:contact_id/addresses/:address_id/edit" do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])
  erb :"addresses/edit"
end

put "/contacts/:contact_id/addresses/:address_id" do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])
  @address.update(params[:address])
  redirect "/contacts/#{params[:contact_id]}"
end