require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'report_builder'
require 'site_prism'

#include Capybara::DSL

Capybara.register_driver :selenium do |app|
  #Configura a incilização do Chrome
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
    #Carrega o Chrome
    config.default_driver = :selenium
    #Define o tempo de timeout na localização de objetos
    config.default_max_wait_time = 5
end

class Cucumber::Core::Test::Step
    def name
 
      return text if text == 'Before hook'
 
      return text if text == 'After hook'
 
      "#{source.last.keyword}#{text}"
 
    end
end