module Speakout
  class Campaign
    def initialize(api, id = nil)
      @api = api
      @id = id
    end

    def attributes
      if @id
        @api.get("campaigns/#{@id}")
      else
        nil
      end
    end
    
    def update(attributes)
      puts "Attributes being sent: #{attributes.inspect}"

      response, status = @api.put("campaigns/#{@id}", attributes) 
      if status < 400 
        return true
      else
        return false, response['errors']
      end 
    end

    def stats

    end
  end
end