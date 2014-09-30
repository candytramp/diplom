require 'test_helper'

class ResearchEffortTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    stprogram = StateProgram.create(name: "STprtog")   
		grnti = Grnti.create(grnti: "STp", name: "dqwdqw")
		field = Field.create(name: "Field#2", code: "124sdwop")
		source = Source.create(funding_source: "Source")
		nir = NirType.create(name: "Nir")
		scientific_school = ScientificSchool.create(name: "STprtog")

  test "dont save vith incorrect year" do
		
		eff = ResearchEffort.new 
		eff.attributes = { name: "dfgerg", state_program: stprogram , start_date: Date.today - 5.years, 
											finish_date: Date.today + 1.year, grnti: grnti, field: field, full_value: 1000000000, 
											year_value: {'2030'=>2000000}, state_reg_number: 1, nir_number: 1, inventory_number: 1,
											nir_type: nir, source: source, 	scientific_school: scientific_school, is_nir: false}
		#puts eff.inspect
		assert_not eff.save
	end


  test "nir check" do
		eff = ResearchEffort.new 
		eff.attributes = {name: "dfgerg", state_program: stprogram , start_date: Date.today - 5.years, 
											finish_date: Date.today + 1.year, grnti: grnti, field: field, full_value: 1000000000, 
											year_value: {'2010'=>2000000}, state_reg_number: 1, nir_number: 1, inventory_number: 1,
											nir_type: nir, source: source, 	scientific_school: scientific_school, is_nir: "sfasfs"}
		eff.save
		assert_equal true, eff.is_nir
	end

   
end
