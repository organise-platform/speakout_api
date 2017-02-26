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

    def create(attributes)
    
    end

    def update(attributes)
      #return 
    end

    def stats

    end
  end
end