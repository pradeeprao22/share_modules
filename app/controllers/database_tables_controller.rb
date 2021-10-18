class DatabaseTablesController < ApplicationController
  before_action :authenticate_user!

    def index
      @database_table = DatabaseTable.all
      render json: @database_table
    end

    def create
      # Database table should have post name also
      @database_table = DatabaseTable.new(database_params)
      @database_table.user_id = current_user.id
      if @database_table.save!
        redirect_to new_columns_for_fake_database_path(@database_table.id)
        flash[:notice] = "Database was created please create columns for database"
      end
    end

    def new
      @database_table = DatabaseTable.new
    end

    private

    def find_column
      @database = DatabaseTable.find(params[:id])
  
      return if @database
      flash[:danger] = "Database not exist!"
      redirect_to root_path
    end
  
    def database_params
      params.require(:database_table).permit(:databasename, :databasetable)
    end
end