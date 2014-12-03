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
