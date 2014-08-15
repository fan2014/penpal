require 'spec_helper'

describe "sign in" do
  
  subject { page }
  before { visit signin_path }
  it { should have_content('Password') }
  
  describe "with invalid information" do
    before { click_button "Sign in" }
    
    it { should have_content('Password') }
  end
end
