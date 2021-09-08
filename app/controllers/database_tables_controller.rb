class DatabaseTablesController < ApplicationController
    def index
      @database_table = DatabaseTable.all
      render json: @database_table
    end
end