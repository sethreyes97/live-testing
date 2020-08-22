# frozen_string_literal: true

Given(/^user visit the "([^"]*)" page$/) do |page|
  UrlNavigationCapybara.navigate_to(Config.urls[page])
  #GenericPage.search
end

Given(/^user makes a "([^"]*)" request$/) do |req_type|
  user = FactoryBot.create(:user)
  endpoint = Config.test_api['endpoint']
  case req_type.to_sym
  when :post
    header = Config.test_api['header']
    body = {
              title: 'foo',
              body: 'bar',
              userId: 1
           }
    response = ApiRequestHandler.api_post_request(endpoint, body, header)
    raise "Response code is #{response.code}" unless response.code.to_i == 201
  when :get
    endpoint = "#{endpoint}#{user.id}"
    response = ApiRequestHandler.api_get_request(endpoint, user.email, user.password)
    raise "Response code is #{response.code}" unless response.code.to_i == 200
    Kernel.puts response.body
  end

end
