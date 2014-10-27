require 'test_helper'

class SourceTest < ActiveSupport::TestCase
  test "name test" do
		src = FactoryGirl.build :source, :fed_funding_source
		src1 = FactoryGirl.build :source, :fed_funding_source
		assert src.save
		assert_not src1.save, 'Name of funding_source should be different'
	end

 
end
