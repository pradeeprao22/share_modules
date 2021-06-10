class ContactTablesController < ApplicationController
    def create
      @contact_table = ContactTable.new(contact_table_params)
      @contact_table.save
    end
  
    private
    def contact_table_params
      params.required(:contact_table).permit :name, :number, :phonenumber, :message
    end
end