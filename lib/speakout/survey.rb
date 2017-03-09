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

    def update(attributes)

      # transform here so it fits straight into Rails' nested attributes structure
      attributes['question_blocks_attributes'] = attributes['question_blocks']
      attributes.delete('question_blocks')

      attributes['question_blocks_attributes'] = attributes['question_blocks_attributes'].map do |key, question_block|
        question_block['questions_attributes'] = question_block['questions'].map{|k,v| v}
        question_block.delete('questions')
        question_block
      end

      puts "Attributes being sent: #{attributes.inspect}"

      response, status = @api.put("surveys/#{@id}", attributes) 
      if status < 400 
        return true
      else
        return false, response['errors']
      end
    end

    def results

    end
  end
end