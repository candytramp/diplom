require 'rails_helper'

RSpec.describe "departments/index", :type => :view do
  before(:each) do
    assign(:departments, [
      Department.create!(
        :full_name => "MyText",
        :short_name => "Short Name"
      ),
      Department.create!(
        :full_name => "MyText",
        :short_name => "Short Name"
      )
    ])
  end

  it "renders a list of departments" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
  end
end
