require 'rails_helper'

RSpec.describe User, type: :model do
  
  context 'Validations tests' do
    it 'is not valid without a first name' do
      user = build(:user, first_name: nil)
      expect(user).to_not be_valid
    end
  end

  it 'is not valid with a valid last name' do
    user = build(:user, last_name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a valid email' do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end

  #password validations
  it 'is invalid when password is nil' do
    user = build(:user, password_digest: nil)
  end
  
  #password confirmation validations
  it 'is invalid when password_confirmation is nil' do
    user = build(:user, password_confirmation: nil)
  end

  #hashes the password
  it 'hashes the password' do
    user = create(:user)
    expect(user.password_digest).not_to eq 'password'
  end

  # context 'Uniqueness tests' do
  #   it 'is not valid without a unique email' do
  #     user1 = create(:user)
  #     user2 = build(:user, email: user1.email)

  #     expect(user2).to_not be_valid
  #     expect(user2.errors[:email]).to include('has already been taken')
  #   end
  # end

  # context 'destroy user and everything dependent on it' do
  #   let (:user) { create(:user) }
  #   let (:user_id) { user.id }

  #   before do
  #     user.destroy
  #   end

  #   it 'deletes user profile' do
  #     profile = Profile.find_by(user_id: user_id)
  #     expect(profile).to be_nil
  #   end
  # end
end
