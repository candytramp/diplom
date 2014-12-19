require 'rails_helper'

RSpec.describe "chairs/new", :type => :view do
  before(:each) do
    assign(:chair, Chair.new(
      :name => "MyText",
      :number => 1,
      :department => nil
    ))
  end

  it "renders new chair form" do
    render

    assert_select "form[action=?][method=?]", chairs_path, "post" do

      assert_select "textarea#chair_name[name=?]", "chair[name]"

      assert_select "input#chair_number[name=?]", "chair[number]"

      assert_select "input#chair_department_id[name=?]", "chair[department_id]"
    end
  end
end
