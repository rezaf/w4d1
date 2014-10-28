class ContactsController < ApplicationController
  def index
    if params.has_key?(:user_id)
      # index of nested resource
      @contacts = Contact.where(user_id: params[:user_id])
      @contacts += User.find(params[:user_id]).shared_contacts
      
      render json: @contacts
    else
      render json: "no contacts :("
    end
  end
  
  def show
    contact = Contact.find(params[:id])
    render json: contact
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end
  
  def update
    @contact = Contact.find(params[:id])
    @contact.update!(contact_params)
    render json: @contact
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy!
    render json: @contact
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
