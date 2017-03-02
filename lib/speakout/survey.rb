module Speakout
  class Survey
    def initialize(api, id = nil)
      @api = api
      @id = id
    end

    def attributes
      if @id
        @api.get("surveys/#{@id}")
      else
        nil
      end
    end

    def create(attributes)
    
    end

    def update(attributes)
      #return 
    end

    def results

    end
  end
end