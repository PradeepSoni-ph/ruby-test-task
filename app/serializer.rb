class Serializer
 
 def self.fields
    @fields
 end

  def self.object
    @object
  end 	

 def self.attribute(attr_name,&block)    
    @fields =  @fields || []        
    @fields_with_block = []
   	 if block.nil?     	       
       	@fields << attr_name       
   	else
	   	@fields_with_block << [attr_name,block]
    end
 end

  def self.new(object)
  	 @object = object
  	 self 
  end

 def self.serialize 
   json = {} 		
   @fields.each{|key| json.merge!("#{key.to_s}": @object["#{key}"]) }		
   @fields_with_block.each{|key| json.merge!("#{key[0].to_s}": key[1].call(@object))}
   json
 end

end
