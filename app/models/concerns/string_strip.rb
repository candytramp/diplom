module StringStrip
  extend ActiveSupport::Concern 
  included do
    before_validation :process_field_string
  end    
  def process_field_string
    self.attributes.each do |attribute|
       if attribute.is_a?(String)
         attribute.strip!
         attribute.gsub!(/\s*/,' ')
       end
    end
  end
end
