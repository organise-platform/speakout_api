require_relative 'speakout/version'
require 'httpclient'
require 'base64'
require 'json'

module Speakout
  # Initialize the HTTP client
  class API
    attr_accessor :client
    attr_reader :host, :version

    def initialize(host, username, password)
      @username = username
      @password = password
      @version = 'v1'
      @user_agent = "speakout/#{Speakout::VERSION};ruby"
      @host = host

      @client = HTTPClient.new
    end

    def campaigns
      Campaigns.new(self)
    end

    def surveys
      Surveys.new(self)
    end

    def get(path)
      response = @client.get("#{base_url}/#{path}", nil, headers)
      [404, 500].include?(response.status) ? nil : [JSON.parse(response.body), response.status]
    end

    def post(path, data = {})
      response = @client.post("#{base_url}/#{path}", data, headers)
      [404, 500].include?(response.status) ? nil : [JSON.parse(response.body), response.status]
    end

    def put(path, data = {})
      response = @client.put("#{base_url}/#{path}", data.to_json, headers)
      [404, 500].include?(response.status) ? nil : [JSON.parse(response.body), response.status]
    end

    private

    def headers
      auth = Base64.strict_encode64("#{@username}:#{@password}")
      {Authorization: "Basic #{auth}", 'Accept': 'application/json'}
    end

    def base_url
      "#{@host}/api/#{@version}"
    end
  end
end