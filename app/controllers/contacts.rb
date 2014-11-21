require_relative "../models/contact"

get "/contacts" do
  @contacts = Contact.all
  erb :"contacts/index"
end

get "/contacts/new" do
  @contact = Contact.new
  erb :"contacts/new"
end

post "/contacts" do
  Contact.create(name: params[:contact][:name], email: params[:contact][:email])

  erb :"contacts/_form"
end

# {
#   :contact =>
#     {
#       :name => "Lucas",
#       :email => "me@ltw.io"
#     }
# }
# contact_data = params[:contact]
# contact_data[:name]
