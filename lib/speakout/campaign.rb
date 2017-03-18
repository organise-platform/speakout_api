module Speakout
  class Campaign
    def initialize(api, id = nil)
      @api = api
      @id = id
    end

    def attributes
      if @id
        response, status = @api.get("campaigns/#{@id}")
        return response
      else
        nil
      end
    end
    
    def update(attributes)
      puts "Attributes being sent: #{attributes.inspect}"

      attributes.delete('id')

      response, status = @api.put("campaigns/#{@id}", attributes) 
      if status < 400 
        return true
      else
        return false, response['errors']
      end 
    end

    # Copies the campaign and returns a Speakout::Campaign with new campaign
    def clone
      response, status = @api.post("campaigns/#{@id}/clone")
      if status < 400
        new_id = response['id']
        return Speakout::Campaign.new(@api, new_id)
      else
        return false
      end
    end

    def stats

    end
  end
end