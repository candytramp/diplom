require 'rails_helper'

RSpec.describe "theses/index", :type => :view do
  before(:each) do
    assign(:theses, [
      Thesis.create!(
        :person => nil,
        :speciality => "MyText",
        :council => "MyText",
        :theme => "MyText",
        :ttype => "Ttype",
        :year => 1,
        :in_time => "MyText",
        :council_code => "Council Code"
      ),
      Thesis.create!(
        :person => nil,
        :speciality => "MyText",
        :council => "MyText",
        :theme => "MyText",
        :ttype => "Ttype",
        :year => 1,
        :in_time => "MyText",
        :council_code => "Council Code"
      )
    ])
  end

  it "renders a list of theses" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Ttype".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Council Code".to_s, :count => 2
  end
end
