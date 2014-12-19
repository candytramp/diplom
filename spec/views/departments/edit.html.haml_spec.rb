require 'rails_helper'

RSpec.describe "departments/edit", :type => :view do
  before(:each) do
    @department = assign(:department, Department.create!(
      :full_name => "MyText",
      :short_name => "MyString"
    ))
  end

  it "renders the edit department form" do
    render

    assert_select "form[action=?][method=?]", department_path(@department), "post" do

      assert_select "textarea#department_full_name[name=?]", "department[full_name]"

      assert_select "input#department_short_name[name=?]", "department[short_name]"
    end
  end
end
