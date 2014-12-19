require 'rails_helper'

RSpec.describe "role_users/index", :type => :view do
  before(:each) do
    assign(:role_users, [
      RoleUser.create!(
        :role => nil,
        :user => nil,
        :dept => nil
      ),
      RoleUser.create!(
        :role => nil,
        :user => nil,
        :dept => nil
      )
    ])
  end

  it "renders a list of role_users" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
