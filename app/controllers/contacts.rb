require_relative '../models/contact'

# Homepage --> redirect to /contacts
get('/') do
  redirect "/contacts"
end

# List all the contacts
get('/contacts') do
  @contacts = Contact.all
  erb :"contacts/index"
end

# New Contact Form
get('/contacts/new') do
  @contact = Contact.new # Dummy to render the view
  erb :"contacts/new"
end

# Create a new contact
post('/contacts') do
  # Same as Contact.create(name: params[:contact][:name], email: params[:contact][:email])
  @contact = Contact.create(params[:contact])
  redirect '/contacts'
end

# Display contact with an id
get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end

# Gets edit contact form
get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end

# Updates basic contact information.
post '/contacts/:id' do
  @contact = Contact.find(params[:id]).update(params[:contact])
  redirect '/contacts'
end

# Deletes contact from database.  Need to add a row to HTML.
delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect '/contacts'
end
