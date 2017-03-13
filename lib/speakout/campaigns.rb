module Speakout
  class Campaigns
    def initialize(api)
      @api = api
    end

    def all
      @api.get('campaigns')
    end

    def create(attributes)
      response = @api.post('campaigns', attributes.to_json)
      unless response['errors']
        return Speakout::Campaign.new(@api, response['id'])
      else
        return response
      end
    end

    def find_by_id(id)
      if @api.get("campaigns/#{id}")
        Speakout::Campaign.new(@api, id)
      else
        raise "Not found"
      end
    end

    def exists?(id)
      
    end
  end
end