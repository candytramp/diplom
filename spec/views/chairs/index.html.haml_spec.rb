require 'rails_helper'

RSpec.describe "chairs/index", :type => :view do
  before(:each) do
    assign(:chairs, [
      Chair.create!(
        :name => "MyText",
        :number => 1,
        :department => nil
      ),
      Chair.create!(
        :name => "MyText",
        :number => 1,
        :department => nil
      )
    ])
  end

  it "renders a list of chairs" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
