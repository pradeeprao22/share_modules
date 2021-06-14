class ContactTablesController < ApplicationController
    def create
      @contact_table = ContactTable.new
      if params[:contact_table]
        @contact_table.name = params[:contact_table][:name]
        @contact_table.number = params[:contact_table][:number]
        @contact_table.phonenumber = params[:contact_table][:phonenumber]
        @contact_table.message = params[:contact_table][:message]
        end
        if params[:contact_table]
          @contact_table.save!
          flash[:notice] = "Your message is saved we will contact you in 2HRS..."
          redirect_to pages_success_path
        else
          flash[:alert] = "Something went wrong we are working on it...."
        end
    end
  
    private
    def contact_table_params
      params.required(:contact_table).permit :name, :number, :phonenumber, :message
      #change the number to email IMPORTANT
    end
end