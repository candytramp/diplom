require 'rails_helper'

RSpec.describe "departments/new", :type => :view do
  before(:each) do
    assign(:department, Department.new(
      :full_name => "MyText",
      :short_name => "MyString"
    ))
  end

  it "renders new department form" do
    render

    assert_select "form[action=?][method=?]", departments_path, "post" do

      assert_select "textarea#department_full_name[name=?]", "department[full_name]"

      assert_select "input#department_short_name[name=?]", "department[short_name]"
    end
  end
end
