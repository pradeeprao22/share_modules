module BackendRunner
  extend ActiveSupport::Concern
  def get_backend_code(post_id)
    backend_code = Post.find(post_id).backend
  end

  # No need to write the method syntex on frontend
  def code_execute
    puts backend_code
  end
end
