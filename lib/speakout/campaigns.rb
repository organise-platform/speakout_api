module Speakout
  class Campaigns
    def initialize(api)
      @api = api
    end

    def all
      response, status = @api.get('campaigns')
      response 
    end

    def create(attributes)
      response, status = @api.post('campaigns', attributes.to_json)
      unless status >= 400
        return Speakout::Campaign.new(@api, response['id'])
      else
        return response
      end
    end

    def find_by_id(id)
      if @api.get("campaigns/#{id}")[1] < 400
        Speakout::Campaign.new(@api, id)
      else
        raise "Not found"
      end
    end

    def exists?(id)
      
    end
  end
end