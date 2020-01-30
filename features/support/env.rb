require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'report_builder'
require 'site_prism'

include Capybara::DSL

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      'chromeOptions' =>  { 'args' => [ '--disable-infobars',
                                        'window-size=1600,1024'
                                      ]
                          }
    )
  )
 end




Capybara.configure do |config|
    config.default_driver = :selenium
    config.default_max_wait_time = 5
end

class Cucumber::Core::Test::Step
    def name
 
      return text if text == 'Before hook'
 
      return text if text == 'After hook'
 
      "#{source.last.keyword}#{text}"
 
    end
end