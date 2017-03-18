require_relative 'survey.rb'

module Speakout
  class Surveys
    def initialize(api)
      @api = api
    end

    def all
      response, status = @api.get('surveys')
      response
    end

    def create(attributes)
      response, status = @api.post('surveys', attributes.to_json)
      unless status >= 400
        return Speakout::Survey.new(@api, response['id'])
      else
        return response
      end
    end

    def find_by_id(id)
      if @api.get("surveys/#{id}")[1] < 400
        Speakout::Survey.new(@api, id)
      else
        raise "Not found"
      end
    end

    def exists?(id)
      
    end
  end
end