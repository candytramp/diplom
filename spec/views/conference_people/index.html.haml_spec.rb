require 'rails_helper'

RSpec.describe "conference_people/index", :type => :view do
  before(:each) do
    assign(:conference_people, [
      ConferencePerson.create!(
        :conference => nil,
        :person => nil,
        :old_lastname => "Old Lastname",
        :is_teacher => false,
        :is_staffteacher => false,
        :is_student => false,
        :is_postgrad => false,
        :details => "MyText"
      ),
      ConferencePerson.create!(
        :conference => nil,
        :person => nil,
        :old_lastname => "Old Lastname",
        :is_teacher => false,
        :is_staffteacher => false,
        :is_student => false,
        :is_postgrad => false,
        :details => "MyText"
      )
    ])
  end

  it "renders a list of conference_people" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Old Lastname".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
