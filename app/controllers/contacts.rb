get '/contacts' do
  @contacts = Contact.all
  erb :"contacts/index"

end

get '/contacts/new' do
  @contact = Contact.new
  erb :"contacts/new"
end

post '/contacts' do
  @contact = Contact.new(params[:contact])
  @contact.save!
  redirect "/contacts"
end

get '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  erb :"contacts/show"
end

get '/contacts/:contact_id/edit' do
  @contact = Contact.find(params[:contact_id])
  erb :"contacts/edit"
end

post '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  binding.pry
  @contact.update(params[:contact])
  redirect "/contacts"
end

delete '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  @contact.destroy
  redirect "/contacts"
end
