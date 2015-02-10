require 'rails_helper'

RSpec.describe "role_users/index", :type => :view do
  before(:each) do
    assign(:role_users, [
      RoleUser.create!(
        :user => nil,
        :role => nil,
        :department => "MyText"
      ),
      RoleUser.create!(
        :user => nil,
        :role => nil,
        :department => "MyText"
      )
    ])
  end

  it "renders a list of role_users" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
