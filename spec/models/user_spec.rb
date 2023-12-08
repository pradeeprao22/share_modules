require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'pradeep', password: 'justanexample', email: 'pradeep.rao@londevs.com', website: 'londevs.com',
             bio: 'This is a example user')
  end

  before { subject.save! }

  it 'User is created' do
    expect(subject).to be_valid
  end
end
