
get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

get '/contacts/new' do
  @contact = Contact.new # Why do I need this line?
  erb :'contacts/new'
end

post '/contacts' do
  Contact.create(params[:contact])
  redirect '/contacts'
end

get '/contacts/:id' do |id|
  # p params
  @contact = Contact.find(id)
  @address = @contact.addresses.first
  erb :'contacts/show'
end

get '/contacts/:id/edit' do |id|
  # p params
  @contact = Contact.find(id) # Do i need to find this contact this again?
  erb :'contacts/edit'
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id]) # Do i need to find this contact this again?
  @contact.update(params[:contact])
  redirect "/contacts/#{@contact.id}"
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect '/contacts'
end
