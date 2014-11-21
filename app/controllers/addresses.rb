require_relative '../models/address'

# Get new address form
get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  @address = Address.new # Dummy to render the view
  erb :'addresses/new'
end

# Edits address
post '/contacts/:id/addresses' do
  @address = Address.create(params[:address])
  @contact = Contact.find(params[:id])
  @contact.addresses << @address
  redirect "/contacts/#{params[:id]}" # Need double quotes when using string interpolation
end

# Gets edit form for address
get '/contacts/:id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:address_id])
  erb :'addresses/edit'
end

# Update address and redirect
post '/contacts/:id/addresses/:address_id' do
  @contact = Contact.find(params[:id])
  @address = Address.find(params[:address_id])
  @address.update(params[:address])
  redirect "/contacts/#{params[:id]}"
end

# Deletes address record.  Need to add a row to HTML.
delete '/contacts/:id/addresses/:address_id' do
  @address = Address.find(params[:address_id])
  @address.destroy
  redirect "/contacts/#{params[:id]}"
end
