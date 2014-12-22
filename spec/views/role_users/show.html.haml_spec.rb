require 'rails_helper'

RSpec.describe "role_users/show", :type => :view do
  before(:each) do
    @role_user = assign(:role_user, RoleUser.create!(
      :user => nil,
      :role => nil,
      :department => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
