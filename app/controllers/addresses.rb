
get '/contacts/:contact_id/addresses/new' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.new
  erb :"addresses/new"
end

post '/contacts/:contact_id/addresses' do
  @contact = Contact.find(params[:contact_id])
  @contact.addresses << Address.create(params[:address])
  redirect "/contacts/#{params[:contact_id]}"
end

get "/contacts/:contact_id/addresses/:address_id/edit" do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])
  erb :"addresses/edit"
end

post "/contacts/:contact_id/addresses/:address_id" do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])
  @address.update(params[:address])
  redirect "/contacts/#{params[:contact_id]}"
end

delete '/contacts/:contact_id/addresses/:address_id' do
  @address = Address.find(params[:address_id])
  @address.destroy
  redirect "/contacts/#{params[:contact_id]}"
end
