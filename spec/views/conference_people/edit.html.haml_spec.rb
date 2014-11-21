require 'rails_helper'

RSpec.describe "conference_people/edit", :type => :view do
  before(:each) do
    @conference_person = assign(:conference_person, ConferencePerson.create!(
      :conference => nil,
      :person => nil,
      :old_lastname => "MyString",
      :is_teacher => false,
      :is_staffteacher => false,
      :is_student => false,
      :is_postgrad => false,
      :details => "MyText"
    ))
  end

  it "renders the edit conference_person form" do
    render

    assert_select "form[action=?][method=?]", conference_person_path(@conference_person), "post" do

      assert_select "input#conference_person_conference_id[name=?]", "conference_person[conference_id]"

      assert_select "input#conference_person_person_id[name=?]", "conference_person[person_id]"

      assert_select "input#conference_person_old_lastname[name=?]", "conference_person[old_lastname]"

      assert_select "input#conference_person_is_teacher[name=?]", "conference_person[is_teacher]"

      assert_select "input#conference_person_is_staffteacher[name=?]", "conference_person[is_staffteacher]"

      assert_select "input#conference_person_is_student[name=?]", "conference_person[is_student]"

      assert_select "input#conference_person_is_postgrad[name=?]", "conference_person[is_postgrad]"

      assert_select "textarea#conference_person_details[name=?]", "conference_person[details]"
    end
  end
end
