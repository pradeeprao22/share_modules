module CodeFilesource
  extend ActiveSupport::Concern

  def code_file_create(post)
    params.fetch(:post, {}).fetch(:code_files, []).each do |code_file|
      name = code_file[:file].original_filename
      file_type = code_file[:file].content_type
      post_column = code_file[:post_column]
      post_id = post.id
      user_id = post.user.id

      # Saving each uploaded file to a specific directory
      file_path = File.join(Rails.root, 'app', 'assets', 'code_files', name)
      File.open(file_path, 'wb') do |file|
        file.write(code_file[:file].tempfile.read)
      end

      # Extracting the file size
      size = File.size(file_path)

      # Read the entire file into a string
      content = File.read(file_path)

      # Assign the file content to the correct post column
      case post_column
      when 'html'
        post.frontend = content
      when 'css'
        post.frontend_css = content
      when 'javascript'
        post.javascript = content
      end

      post.code_files.new(name:, size:, file_type:, post_column:,
                          post_id:, user_id:)
      post.save!
    end
  end
end
