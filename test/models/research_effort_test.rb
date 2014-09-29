require 'test_helper'

class ResearchEffortTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "dont save vith incorrect year" do
		eff = ResearchEffort.new 
	eff.attributes = { name: "dfgerg", state_program_id: 1, start_date: Date.today - 5.years, finish_date: Date.today + 1.year, grnti_id: 1, field_id: 1, 					full_value: 1000000000, year_value: {'2010'=>2000000}, state_reg_number: 1, nir_number: 1, inventory_number: 1, nir_type_id: 1, source_id: 1, 					scientific_school_id: 1, is_nir: false}

		puts eff.inspect
		assert eff.save
		#assert_not research_efforts(:one).save
	end
end
