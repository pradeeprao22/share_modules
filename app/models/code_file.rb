class CodeFile < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many_attached :files

  after_create :add_fileid

  def add_fileid
    random = UUID.new
    file_id = random.generate
    self.fileid = file_id
    save!
  end
end
