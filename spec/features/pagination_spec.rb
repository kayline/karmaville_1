require 'spec_helper'

describe "paginating", :js => true do

  context "on the first page" do
	  let!(:users) {create_list(:user_with_karma, 40, :karma_count => rand(100...800), :points => 2)}
	  let!(:user_high) { create(:user_with_karma, :karma_count => 1000, :points => 2) }
	  let(:name) {user_high.first_name}
  	it "should display the user with the most karma" do
  		visit root_path
  		page.should have_content(name)
  	end

  	it "should disable the 'previous' and 'first' links"

  end

  context "on the last page" do
		let!(:users) {create_list(:user_with_karma, 40, :karma_count => rand(100...800), :points => 2)}
		let!(:user_low) { create(:user_with_karma, :karma_count => 20, :points => 2) }
		let(:name) {user_low.first_name}
  	it "should display the user with the least karma" do
  		visit '/users?page=2'
  		page.should have_content(name)
  	end

  	it "should disable the 'next' and 'last' links"


  end

end