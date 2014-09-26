require 'test_helper'

class ResearchEffortTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
=begin
  test "save research_effort with wrong year" do
 		effort = ResearchEffort.new
		stprogram = StateProgram.create(name: "Federal Innovations")
		grnti = Grnti.create(grnti: "Grn", name: "Grnti_name")
		field = Field.create(name: "applied math", code: 12345678)
		nirtype = NirType.create(name: "NIr_type")
		source = Source.create(funding_source: "Federal budget")
		
    effort.attributes = {name: "Unstable equations", state_program: stprogram, start_date: Date.today+1.month, finish_date: Date.today+1.year,
												grnti: grnti, field: field, full_value: 2530000000.52, year_value: {'2014' => 150000}, state_reg_number:1268,
 												nir_number: 45874, inventory_numbe: 9879845651, nir_type: nirtype, source: source, scientific_school: "dfqfewf",
												is_nir: false}
		assert_not effort.save
	end
=end
end
