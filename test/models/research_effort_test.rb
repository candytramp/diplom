require 'test_helper'

class ResearchEffortTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "dont save vith incorrect year" do
		stprogram = StateProgram.create(name: "STprtog")
    
		grnti = Grnti.create(grnti: "STp", name: "dqwdqw")
		field = Field.create(name: "Field#2", code: "124sdwop")
		source = Source.create(funding_source: "Source")
		nir = NirType.create(name: "Nir")
		scientific_school = ScientificSchool.create(name: "STprtog")
		eff = ResearchEffort.new 
		eff.attributes = { name: "dfgerg", state_program: stprogram , start_date: Date.today - 5.years, 
											finish_date: Date.today + 1.year, grnti: grnti, field: field, full_value: 1000000000, 
											year_value: {'2010'=>20000000000000}, state_reg_number: 1, nir_number: 1, inventory_number: 1,
											nir_type: nir, source: source, 	scientific_school: scientific_school, is_nir: false}
		puts eff.inspect
		assert_not eff.save
		#puts eff.errors.inspect
		#assert_not research_efforts(:one).save
	end
end
