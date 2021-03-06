class Api::ContactsController < ApplicationController
  def index
    input = params["input"]
    if current_user
      @contacts = current_user.contacts
      if input
        @contacts = current_user.contacts.where("name ILIKE ? OR middle_name ILIKE ? OR street_address ILIKE ? OR city ILIKE ? OR state ILIKE ? OR email ILIKE ? OR phone ILIKE ? OR bio ILIKE ?", "%#{input}%", "%#{input}%", "%#{input}%", "%#{input}%", "%#{input}%", "%#{input}%", "%#{input}%", "%#{input}%")
      end
      render "index.json.jbuilder"
    else
      render json: []
    end
  end

  def create
    @contact = Contact.new(
      name: params["name"],
      middle_name: params["middle_name"],
      street_address: params["street_address"],
      city: params["city"],
      state: params["state"],
      zip: params["zip"],
      email: params["email"],
      phone: params["phone"],
      bio: params["bio"],
      user_id: current_user.id
      )
    @contact.save
    if @contact.save
      render "show.json.jbuilder"
    else
      render json: {errors: @contact.errors.full_messages}, status: 422
    end
  end

  def show
    @contact = Contact.find_by(id: params["id"])
    render "show.json.jbuilder"
  end

  def update
    @contact = Contact.find_by(id: params["id"])
    @contact.name = params["name"] || @contact.name
    @contact.middle_name = params["middle_name"] || @contact.middle_name
    @contact.street_address = params["street_address"] || @contact.street_address
    @contact.city = params["city"] || @contact.city
    @contact.state = params["state"] || @contact.state
    @contact.zip = params["zip"] || @contact.zip
    @contact.email = params["email"] || @contact.email
    @contact.phone = params["phone"] || @contact.phone
    @contact.bio = params["bio"] || @contact.bio
    @contact.save
    if @contact.save
      render "show.json.jbuilder"
    else
      render json: {errors: @contact.errors.full_messages}, status: 422
    end
  end

  def destroy
    @contact = Contact.find_by(id: params["id"])
    @contact.destroy
    render json: {message: "Contact has been deleted."}
  end
end
