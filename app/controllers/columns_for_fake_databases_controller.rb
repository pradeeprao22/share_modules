class ColumnsForFakeDatabasesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_column, only: [:show]
  
  def index 
    @column = ColumnsForFakeDatabase.where(user_id: current_user)
  end

  def create
    @column =  ColumnsForFakeDatabase.new(column_params)
    @column.user_id = current_user.id

    if (@column.user_id == Post.last.user_id) && (@column.user_id == current_user.id)
        @column.post_id = Post.last.id
        @column.save!
        @post = Post.last
        @column.update(post_id: Post.last.id)
        DatabaseAndItsColumn.create(columns_for_fake_database_id: @column.id, database_table_id: Post.last.database_id, post_id: Post.last.id, user_id: current_user.id)
        flash[:notice] = "Columns for database has been created"
       # redirect_to post_path(@post)
        #@column.database_table_id << Post.last.database_id
    else
      flash[:notice] = "Some error happened"
    end
    
  end

  def update
    if columns_params
      @column = ColumnsForFakeDatabase.update(column_params)
    end
  end

  def show
    @column = @column
  end

  def new
    @column =  ColumnsForFakeDatabase.new
  end

  private

  def find_column
    @column = ColumnsForFakeDatabase.find(params[:id])

    return if @column
    flash[:danger] = "Column not exist!"
    redirect_to root_path
  end

  def column_params
    params.require(:columns_for_fake_database).permit(:name, :tag, :database_table_id, :column_type)
  end

end