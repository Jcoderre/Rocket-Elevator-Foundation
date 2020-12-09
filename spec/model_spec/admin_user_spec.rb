require 'rails_helper'


describe User, :type => :model do
  
    before(:all) do
      @user1 = create(:admin_user)
    end
    
    it "is valid with valid attributes" do
      expect(@user1).to be_valid
    end
    
    it "Doesnt pass with password less then 6 character" do
      user2 = build(:admin_user, password: "ahoy")
      expect(user2).to_not be_valid
    end
    
    it "is not valid without a password" do 
      user2 = build(:admin_user, password: nil)
      expect(user2).to_not be_valid
    end

    it "is not valid without an email" do
      user2 = build(:admin_user, email: nil)
      expect(user2).to_not be_valid
    end
  end

