class SourceValidator < ActiveModel::Validator
  def validate(record)
   
   	if !record.source.has_key?(:type) 
    	record.errors[:source] << "Type of document is not specified!"
    elsif 
    	case record.source[:type]
    	when "magazine"
    		if !validates_magazine(record.source) 
    			record.errors[:source] << "Incorrect attridbute value (magazine)"	
    		end	  		  
    		
    	when "collected papers"
    		if !validates_papers(record.source) 
    			record.errors[:source] << "Incorrect attribute value (paper)"
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
    			#puts "missed attribute"
    			return false 
      end			
    end
  	hash.each do |key, value|
  	  if key.kind_of?(String)
  		  value = value.strip 
  		  hash[key] = value.gsub(/\s+/,' ')
  		end  
  		if (key == :name && value!="") ||	(key == :type) ||
  		     (key == :year && value!='' && value.to_i >0 && value.to_i<Date.today.year)||		
  		     (key == :output && value!='' && value.to_i >0)||
  		     ((key == :is_russian || key == :in_rinc ) && ([true,false].include?(value)))
  		   next
  		else
  			return false
  		end
  	end
  	
  end
  
  def validates_papers(hash)
    required_keys=[:name, :year,:type]
    
    required_keys.each do |key|
    	if !hash.has_key?(key)
    			#puts "missed attribute"
    			return false 
      end			
    end
  	hash.each do |key, value|
  	  if key.kind_of?(String)
  		  value = value.strip 
  		  hash[key] = value.gsub(/\s+/,' ')
  		end  
  		if (key == :name && value!="")||(key == :type) ||
  	       (key == :year && value!="" && value.to_i >0 && value.to_i<Date.today.year)
  	     next
  	  else
  	     return false   
  		end
  	end
  	return true
  end
   
end
class Article < ActiveRecord::Base
	include StringStrip
	
	validates_with SourceValidator
	before_validation :copy_year
	
	#has_attached_file :document, styles: {thumbnail: "60x60#"}
	#validates_attachment :document, content_type: { content_type: "application/pdf" }
	
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

#product = Product.first
#product.save if product.changed? save serislize fields only vhen they are changed
