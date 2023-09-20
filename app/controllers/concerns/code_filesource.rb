module CodeFilesource
    extend ActiveSupport::Concern
    
    def code_file_create(post)
        if params[:post][:code_files]
            byebug
            params[:post][:code_files].each do |code_file|
                name = code_file[:file].original_filename
                file_type = code_file[:file].content_type
                post_column = code_file[:post_column]
                post_id = post.id
                user_id = post.user.id

                #Saving each uploaded file to a specific directory
                File.open(Rails.root.join("app/assets/code_files/#{name}"), 'wb') do |file|
                file.write(code_file[:file].tempfile.read)
                end

                #Extracting the file size
                size = File.size(Rails.root.join("app/assets/code_files/#{name}"))

                # Empty array for stroing files code
                files = []

                File.foreach(Rails.root.join("app/assets/code_files/#{name}")) do |file|
                    files << file.chomp

                    f = files.join()
                    if post_column == "html"
                        post.frontend = f
                    elsif post_column == "css"
                        post.frontend_css = f
                    elsif post_column == "javascript"
                        post.javascript = f       
                    end

                    post.save!
                end

                byebug

                post.code_files.new(name: name, size: size, file_type: file_type, post_column: post_column, post_id: post_id, user_id: user_id)
                post.save!
            end
        end
    end

end