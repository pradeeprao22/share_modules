module BackendRunner
    extend ActiveSupport::Concern
 def get_backend_code post_id
    backend_code = Post.find(post_id).backend
 end

 def code_execute
    puts backend_code
 end
end