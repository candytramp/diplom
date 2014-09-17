class PresenceCheck
  def check(value)
    !value.blank?
  end
end

class YearCheck
  def check(value)
    year = value.to_i
    year > 0 &&  year < Date.today.year
  end
end

class BooleanCheck
  def check(value)
    [true,false].include?(value)
  end
end

class PositiveCheck
  def check(value)
    value.to_i > 0
  end
end




class SourceValidator < ActiveModel::Validator
  def initialize(value)
    @checks = {
      name: [PresenceCheck.new],
      year: [PresenceCheck.new, YearCheck.new],
      output: [PositiveCheck.new],
      is_russian: [BooleanCheck.new], 
      in_rinc: [BooleanCheck.new],
	  type: []
    }
    #@checks.default_value = []
  end

  def validate(record)
    result = ""
   	if !record.source.has_key?(:type) 
    	record.errors[:source] << "Type of document is not specified!"
    elsif 
    	case record.source[:type]
    	when "magazine"
			result = validates_magazine(record.source) 
    		if !result.blank?
    			record.errors[:source] << "Incorrect attridbute value  #{result}"	
    		end	  		  
    		
    	when "collected papers"
			result = validates_papers(record.source) 
    		if !result.blank?
    			record.errors[:source] << "Incorrect attribute value #{result}"
      		end 	
    	else
    	  	record.errors[:source] << "Incorrect type value"	
    	end	
    end  
  end
  
  private
  
  def validates_magazine(hash)
    required_keys=[:name, :year,:type,:output,:is_russian,:in_rinc]
    
    required_keys.each do |key|
    	if !hash.has_key?(key)
    		return "#{key} (missed attribute)"
        end			
    end
  	hash.each do |key, value|
  	  	if key.kind_of?(String)
  		  value = value.strip 
  		  hash[key] = value.gsub(/\s+/,' ')
  		end
		@checks[key].each do |check| 
		  #puts key.to_s
  		  return key unless check.check(value)
  		end
  	end
 	return ""
  	
  end
  
  def validates_papers(hash)
    required_keys=[:name, :year,:type]
    puts required_keys.inspect
    required_keys.each do |key|
    	if !hash.has_key?(key)
    			#puts "missed attribute"
    			return "#{key} (missed attribute)"
        end			
    end
  	hash.each do |key, value|
  	  if key.kind_of?(String)
  		  value = value.strip 
  		  hash[key] = value.gsub(/\s+/,' ')
  	  end  
	  @checks[key].each do |check| 
	 	  #puts key.to_s
  		  return key unless check.check(value)
  	  end
  	end
  	return ""
  end
   
end
class Article < ActiveRecord::Base
	include StringStrip
	
	validates_with SourceValidator
	before_validation :copy_year
	
	has_attached_file :document, styles: {thumbnail: "60x60#"}
	validates_attachment :document, content_type: { content_type: "application/pdf" }
	
	serialize :source
	#validates :name, uniqueness: true
	validates :name, :start_page, :finish_page, :year, presence: true
	validates :start_page, :finish_page, :year,
	      numericality: { only_integer: true, greater_than: 0 }
	validates :year, numericality: {less_than_or_equal_to: Date.today.year}     
	def copy_year
		self.year=self.source[:year]
	end
end
 
