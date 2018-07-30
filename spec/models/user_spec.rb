require 'rails_helper'

describe User, type: :model do
 
  describe 'validation' do

    context "Email Id, First name , Last name and password" do
      #let(:organization) { FactoryGirl.create(:organization, organizational_key: "Key12345") }
      let(:user) { FactoryGirl.build(:user) }
      it "When invalid email format" do
        user.email = 'test12234'
        expect(user).not_to be_valid 
      end

      it "When valid email format" do
        user.email = 'test12@yopmail.com'
        expect(user).to be_valid 
      end

      it "When password is blank" do
        user.password = ''
        expect(user).not_to be_valid 
      end

      it "When password is present" do
        user.password = 1234566
        expect(user).to be_valid 
      end 
    end
  end
end
