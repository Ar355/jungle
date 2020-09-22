require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(
      first_name: "Original",
      last_name: "Name3",
      email: "test3@gmail.com",
      password: "test3",
      password_confirmation: "test3"
    )
  end

  describe 'Validations' do
    it 'create new user and save' do
      expect(@user).to be_valid
      puts @user.errors.full_messages
    end

    it 'it gives error when user creation, password_confirmation not matching' do
      @user.password_confirmation = "testInvalid"
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'it gives error when user creation, password/password_confirmation are nil' do
      @user.password_confirmation = nil
      @user.password = nil
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'it gives erro when email is not set' do
      @user.email = nil
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'it gives error when first_name, last_name is not set' do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'returns false if password length is less than 3' do
      @user.password = '12'
      @user.password_confirmation = "12"
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'returns error if not authenticated' do
     user = User.authenticate_with_credentials("test3@gmail.com", "fail")
      expect(user).to be_falsey
    end

    it 'returns true if authenticated' do
      @user.save
      user = User.authenticate_with_credentials("test3@gmail.com", "test3")
      expect(user).to be_truthy
     end
     it 'returns true if authenticated with upper and lowercase' do
      @user.save
      user = User.authenticate_with_credentials("TesT3@Gmail.com", "test3")
      expect(user).to be_truthy
     end

     it 'returns true if authenticated with trailing space' do
      @user.save
      user = User.authenticate_with_credentials(" test3@gmail.com", "test3")
      expect(user).to be_truthy
     end
  end


end
