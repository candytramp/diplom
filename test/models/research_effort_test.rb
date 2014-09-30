require 'test_helper'

class ResearchEffortTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
<<<<<<< HEAD

  test "save research_effort with wrong year" do
 		effort = ResearchEffort.new
		stprogram = StateProgram.create(name: "Federal Innovations")
		grnti = Grnti.create(grnti: "Gr", name: "Grnti_name")
		field = Field.create(name: "applied math", code: 12345678)
		nirtype = NirType.create(name: "NIr_type")
		source = Source.create(funding_source: "Federal budget")
		
    effort.attributes = {name: "Unstable equations", state_program: stprogram, start_date: Date.today+1.month, finish_date: Date.today+1.year,grnti: grnti, field: field, full_value: 2530000000.52, year_value: {'2014' => 150000}, state_reg_number:1268,nir_number: 45874, inventory_number: 9879845651, nir_type: nirtype, source: source, scientific_school: "dfqfewf", is_nir: false}
		assert_not effort.save
	end

=======
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
		eff.attributes = { name: "dfgerg", state_program: stprogram , start_date: Date.today - 5.years, 
											finish_date: Date.today + 1.year, grnti: grnti, field: field, full_value: 1000000000, 
											year_value: {'2010'=>2000000}, state_reg_number: 1, nir_number: 1, inventory_number: 1,
											nir_type: nir, source: source, 	scientific_school: scientific_school, is_nir: nil}
		eff.save
		assert_equal false, eff.is_nir
	end

   
>>>>>>> 0b5582bd5f3fdae21cce0540402249c40a677fde
end
