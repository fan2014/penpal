require 'spec_helper'

describe User do
  
  before { @user = User.new(name: "Fan", mood:"happy",
                     password:"justmyluck",
                     password_confirmation: "justmyluck" )}
  
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:mood) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:mails) }
  it { should respond_to(:remember_token) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid}
  end
  
  describe "when name is too long" do
    before { @user.name = "a"*21 }
    it { should_not be_valid }
  end
  
  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = "  " }
    it { should_not be_valid }
  end
  
  describe "when password is too short" do
    before { @user.password = @user.password_confirmation = "a"*7 }
    it { should_not be_valid }
  end
  
  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end
