require 'rails_helper'

RSpec.describe "theses/show", :type => :view do
  before(:each) do
    @thesis = assign(:thesis, Thesis.create!(
      :person => nil,
      :speciality => "MyText",
      :council => "MyText",
      :theme => "MyText",
      :ttype => "Ttype",
      :year => 1,
      :in_time => "MyText",
      :council_code => "Council Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Ttype/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Council Code/)
  end
end
