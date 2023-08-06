class CodeFile < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :add_fileid

  def add_fileid
    random = SecureRandom.hex(4)
    self.fileid = random
    self.save!
  end
  
end