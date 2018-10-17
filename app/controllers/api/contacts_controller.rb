class Api::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render "index.json.jbuilder"
  end

  def create
    @contact = Contact.new(
      name: params["name"],
      street_address: params["street_address"],
      city: params["city"],
      state: params["state"],
      zip: params["zip"],
      email: params["email"],
      phone: params["phone"],
      )
    @contact.save
    render "show.json.jbuilder"
  end

  def show
    @contact = Contact.find_by(id: params["id"])
    render "show.json.jbuilder"
  end

  def update
    @contact = Contact.find_by(id: params["id"])
    @contact.name = params["name"] || @contact.name
    @contact.street_address = params["street_address"] || @contact.street_address
    @contact.city = params["city"] || @contact.city
    @contact.state = params["state"] || @contact.state
    @contact.zip = params["zip"] || @contact.zip
    @contact.email = params["email"] || @contact.email
    @contact.phone = params["phone"] || @contact.phone
    @contact.save
    render "show.json.jbuilder"
  end

  def destroy
    @contact = Contact.find_by(id: params["id"])
    @contact.destroy
    render json: {message: "Contact has been deleted."}
  end
end
