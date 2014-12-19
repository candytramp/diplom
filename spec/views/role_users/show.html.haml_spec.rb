require 'rails_helper'

RSpec.describe "role_users/show", :type => :view do
  before(:each) do
    @role_user = assign(:role_user, RoleUser.create!(
      :role => nil,
      :user => nil,
      :dept => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
