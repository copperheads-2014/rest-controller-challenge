get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

get '/contacts/new' do
  @contact = Contact.new
  erb :'contacts/new'
end

post '/contacts' do
  Contact.create(params[:contact])
  redirect '/contacts'
end

get '/contacts/:contact_id/edit' do
  @contact = Contact.find(params[:contact_id])
  erb :'contacts/edit'
end

get '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  erb :'contacts/show'
end

post '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  @contact.update(params[:contact])
  redirect '/contacts'
end

delete '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  @contact.destroy
  redirect '/contacts'
end


get '/' do
  erb :index
end



