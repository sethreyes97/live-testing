# frozen_string_literal: true

# Class to manage API request for execution
class ApiRequestHandler
  class << self
    # This method perform complete request to any API
    def api_post_request(endpoint, body, header = nil)
      uri = URI.parse(endpoint)
      params = config_post_request(uri, header, body)
      perform_request(uri, params)
    end

    # This method perform complete request to any API GET with basic auth
    def api_get_request(endpoint, user, password)
      uri = URI.parse(endpoint)
      params = config_get_request(uri, user, password)
      perform_request(uri, params)
    end

    # Set configuration to perform request, converts body hash to json
    # This is for post request
    def config_post_request(uri, header, body)
      req = Net::HTTP::Post.new(uri.path, header)
      req.body = body.to_json
      req
    end

    # Set configuration to perform request, converts body hash to json
    # This is for post request
    def config_get_request(uri, user, password)
      req = Net::HTTP::Get.new(uri.path)
      req.basic_auth(user, password)
      req
    end

    def perform_request(uri, params)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      https.request(params)
    end
  end
end
