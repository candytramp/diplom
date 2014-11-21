require 'rails_helper'

RSpec.describe "conference_people/show", :type => :view do
  before(:each) do
    @conference_person = assign(:conference_person, ConferencePerson.create!(
      :conference => nil,
      :person => nil,
      :old_lastname => "Old Lastname",
      :is_teacher => false,
      :is_staffteacher => false,
      :is_student => false,
      :is_postgrad => false,
      :details => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Old Lastname/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
  end
end
