#view all contacts
get '/contacts' do
	@contacts = Contact.all
	erb :'/contacts/index'
end


#create new contacts
#this route only works if it is above get '/contacts/:id' do... why?
get '/contacts/new' do
	#this line is to prevent an error for interpolating q stored name from params into
	 #the form field. The name however doesnt exist yet so an error is thrown.
	@contact = Contact.new
	erb :'/contacts/new'
end


#view single contact
get '/contacts/:id' do
	@contact = Contact.find(params[:id])

	erb :'/contacts/show'
end



post '/contacts' do
  #What should happen here?
  #Gather all the data for the new contact
  #Create the new contact
  #Send the user back to the contacts index


  #raise params.inspect

  #refactored version, as opposed to filling values for each contact variable. form is slightly 
  #different as well
  Contact.create(params[:contact])

  redirect '/contacts'
end


#delete contacts

#add delete form to contacts index.erb

delete '/contacts/:id' do
	@contact = Contact.find(params[:id])
	@contact.destroy
  redirect '/contacts'
end


#edit/update contacts
#from the show page (Add a link in the show page to edit the contact)

get '/contacts/:id/edit' do
	@contact = Contact.find(params[:id])
	erb :'/contacts/edit'
end


post '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update(params[:contact])

  redirect "/contacts/#{@contact.id}"
end





