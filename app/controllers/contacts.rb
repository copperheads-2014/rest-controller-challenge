
# show all contacts
get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

# new contact is in the contact instance variable but has not been
# saved to database
get '/contacts/new' do 
  @contact = Contact.new
  erb :'contacts/new'
end

# create contact and saves to database
post '/contacts' do
  Contact.create(params[:contact])
  redirect '/contacts'
end

# edit contact
get '/contacts/:id' do |id|
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end

get '/contacts/:id/edit' do |id|
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end

post '/contacts/:id' do # works with post but not put?
  @contact = Contact.find(params[:id])
  @contact.update(params[:contact])
  redirect '/contacts'
end

delete '/contacts/:id' do 
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect '/contacts'
end

# Can we use pry with this?