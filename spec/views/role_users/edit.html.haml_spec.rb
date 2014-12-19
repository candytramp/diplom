require 'rails_helper'

RSpec.describe "role_users/edit", :type => :view do
  before(:each) do
    @role_user = assign(:role_user, RoleUser.create!(
      :role => nil,
      :user => nil,
      :dept => nil
    ))
  end

  it "renders the edit role_user form" do
    render

    assert_select "form[action=?][method=?]", role_user_path(@role_user), "post" do

      assert_select "input#role_user_role_id[name=?]", "role_user[role_id]"

      assert_select "input#role_user_user_id[name=?]", "role_user[user_id]"

      assert_select "input#role_user_dept_id[name=?]", "role_user[dept_id]"
    end
  end
end
