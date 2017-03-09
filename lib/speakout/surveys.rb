require_relative 'survey.rb'

module Speakout
  class Surveys
    def initialize(api)
      @api = api
    end

    def all
      @api.get('surveys')
    end

    def create(attributes)
      response = @api.post('surveys', attributes.to_json)
      unless response['errors']
        return Speakout::Survey.new(@api, response['id'])
      else
        return response
      end
    end

    def find_by_id(id)
      if @api.get("surveys/#{id}")
        Speakout::Survey.new(@api, id)
      else
        raise "Not found"
      end
    end

    def exists?(id)
      
    end
  end
end