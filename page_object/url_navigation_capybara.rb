class UrlNavigationCapybara
  extend Capybara::DSL

  class << self
    # Capybara visit url
    def navigate_to(url)
      puts "Trying to visit url: '#{url}'"
      visit url
    end
  end
end
