require 'rails_helper'

RSpec.describe ResearchEffort, :type => :model, :versioning => true do
  #pending "add some examples to (or delete) #{__FILE__}"

	let(:stprogram){FactoryGirl.create :state_program}
	let(:gnti){FactoryGirl.create :state_program}
  let(:field){FactoryGirl.create :state_program}
  let(:nir_type){FactoryGirl.create :state_program}
	let(:scientific_school){FactoryGirl.create :state_program}

  it { should belong_to(:state_program) }
	it { should validate_presence_of (:name)}
end
