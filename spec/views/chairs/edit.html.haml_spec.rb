require 'rails_helper'

RSpec.describe "chairs/edit", :type => :view do
  before(:each) do
    @chair = assign(:chair, Chair.create!(
      :name => "MyText",
      :number => 1,
      :department => nil
    ))
  end

  it "renders the edit chair form" do
    render

    assert_select "form[action=?][method=?]", chair_path(@chair), "post" do

      assert_select "textarea#chair_name[name=?]", "chair[name]"

      assert_select "input#chair_number[name=?]", "chair[number]"

      assert_select "input#chair_department_id[name=?]", "chair[department_id]"
    end
  end
end
