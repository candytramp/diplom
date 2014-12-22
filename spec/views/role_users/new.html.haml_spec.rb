require 'rails_helper'

RSpec.describe "role_users/new", :type => :view do
  before(:each) do
    assign(:role_user, RoleUser.new(
      :user => nil,
      :role => nil,
      :department => "MyText"
    ))
  end

  it "renders new role_user form" do
    render

    assert_select "form[action=?][method=?]", role_users_path, "post" do

      assert_select "input#role_user_user_id[name=?]", "role_user[user_id]"

      assert_select "input#role_user_role_id[name=?]", "role_user[role_id]"

      assert_select "textarea#role_user_department[name=?]", "role_user[department]"
    end
  end
end
