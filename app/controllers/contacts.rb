get '/' do
  redirect '/contacts'
end

get '/contacts' do
  @contact = Contact.all
  erb :'contacts/index'
end

get '/contacts/new' do
  @contact = Contact.new
  erb :'/contacts/new'
end

post '/contacts' do
  @contact = Contact.create(params[:contact])
  redirect '/'
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'/contacts/show'
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :'/contacts/edit'
end

post '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update(params[:contact])
  redirect '/'
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect '/'
end


