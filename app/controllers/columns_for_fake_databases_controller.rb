class ColumnsForFakeDatabasesController < ApplicationController

  def create
    @column =  ColumnsForFakeDatabase.new(column_params)
    @column.user_id = current_user.id

    if (@column.user_id == Post.last.user_id) && (@column.user_id == current_user)
        @column.post_id = Post.last.id
        DatabaseAndItsColumn.create(columns_for_fake_database_id: @column.id, database_table_id: Post.last.database_id, post_id: Post.last.id)
        #@column.database_table_id << Post.last.database_id
    else
      flash[:notice] = "Some error happened"
    end
    
    if @column.save!
      @post = Post.last
      @column.update(post_id: Post.last.id)
      redirect_to post_path(@post)
      flash[:notice] = "Columns for database has been created"
    end
  end

  def new
    @column =  ColumnsForFakeDatabase.new
  end

  def column_params
    params.require(:columns_for_fake_database).permit(:name, :tag, :database_table_id, :column_type)
  end

end