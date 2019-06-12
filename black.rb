require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

Capybara.current_driver = :selenium
Capybara.app_host = "http://www.blacklistalert.org"
Capybara.default_max_wait_time = 5

module Crawler
  class BlackListAlert
    include Capybara::DSL

    def domain_check(target)
      visit('/')
      fill_in 'q', :with => target
      click_button 'check'

      within(:xpath, '/html/body/center/font/form') do
        alert_notice if page.has_content?('Listed!')
      end
      page.save_screenshot('screenshot.png')
    end

    def alert_notice
      puts 'Alert!!'
    end
  end
end

crawler = Crawler::BlackListAlert.new
# crawler.domain_check('mail.google.com')
crawler.domain_check('5.142.16.89')
