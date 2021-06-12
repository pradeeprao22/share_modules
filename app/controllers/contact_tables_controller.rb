class ContactTablesController < ApplicationController
    def create
      @contact_table = ContactTable.new(contact_table_params)
      if @contact_table.save
        flash[:alert] = "You details has been submited succesfully we will contact you in 2hrs...."
      else 
        flash[:alert] = "Something went wrong we are working on it...."
      end
    end
  
    private
    def contact_table_params
      params.required(:contact_table).permit :name, :number, :phonenumber, :message
    end
end