module Speakout
  class Campaigns
    def initialize(api)
      @api = api
    end

    def all
      @api.get('campaigns')
    end
  end
end