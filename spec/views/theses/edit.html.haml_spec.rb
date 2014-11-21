require 'rails_helper'

RSpec.describe "theses/edit", :type => :view do
  before(:each) do
    @thesis = assign(:thesis, Thesis.create!(
      :person => nil,
      :speciality => "MyText",
      :council => "MyText",
      :theme => "MyText",
      :ttype => "MyString",
      :year => 1,
      :in_time => "MyText",
      :council_code => "MyString"
    ))
  end

  it "renders the edit thesis form" do
    render

    assert_select "form[action=?][method=?]", thesis_path(@thesis), "post" do

      assert_select "input#thesis_person_id[name=?]", "thesis[person_id]"

      assert_select "textarea#thesis_speciality[name=?]", "thesis[speciality]"

      assert_select "textarea#thesis_council[name=?]", "thesis[council]"

      assert_select "textarea#thesis_theme[name=?]", "thesis[theme]"

      assert_select "input#thesis_ttype[name=?]", "thesis[ttype]"

      assert_select "input#thesis_year[name=?]", "thesis[year]"

      assert_select "textarea#thesis_in_time[name=?]", "thesis[in_time]"

      assert_select "input#thesis_council_code[name=?]", "thesis[council_code]"
    end
  end
end
