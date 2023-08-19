class CodeFile < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_one_attached :file

  after_create :add_fileid

  def add_fileid
    random = UUID.new
    file_id = random.generate
    self.fileid = file_id
    self.save!
  end
  
end