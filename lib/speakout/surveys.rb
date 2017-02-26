module Speakout
  class Surveys
    def initialize(api)
      @api = api
    end

    def all
      @api.get('surveys')
    end
  end
end