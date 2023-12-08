class CodefileWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(code_files, _type)
    code_files.each do |code_file|
      code_file.readline

      content
    end
  end
end
