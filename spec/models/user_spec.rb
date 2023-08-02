require 'rails_helper'

RSpec.describe User, type: :model do
    before(:all) do
        @user_attribute = {
            name: 'test01',
            email: 'test01@yopmail.com',
            password: '1234'
        }
    end

    it 'it is valid' do
        @user = User.create(@user_attribute)
        expect(@user).to be_valid
    end

    it 'Checking the name' do
        @user = User.create(@user_attribute)
        expect(@user.name).to eq('test01')
    end
    it 'Checking the name' do
        @user = User.create(@user_attribute)
        expect(@user.email).to eq('test01@yopmail.com')
    end

end