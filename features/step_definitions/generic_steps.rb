# frozen_string_literal: true
#
Given(/^user visit the "([^"]*)" page$/) do |page|
  user = FactoryBot.create(:user)
  Kernel.puts(user.email)
  Kernel.puts(user.password)
  UrlNavigationCapybara.navigate_to(Config.urls[page])
  GenericPage.search
end
