require 'rails_helper'

RSpec.describe "chairs/show", :type => :view do
  before(:each) do
    @chair = assign(:chair, Chair.create!(
      :name => "MyText",
      :number => 1,
      :department => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
