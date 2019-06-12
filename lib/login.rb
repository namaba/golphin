require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

Capybara.current_driver = :selenium
Capybara.app_host = 'https://affiliate.amazon.co.jp/'
Capybara.default_max_wait_time = 5

module Crawler
  class Amazon
    include Capybara::DSL

    def login
      visit('/')
      click_button 'サインイン'
      fill_in 'email', :with => 'one.2426@gmail.com'
      fill_in 'password', :with => 'nk902426'
      find('#signInSubmit').click
    end

    def sample
      visit('/home/reports')
    end
  end
end

crawler = Crawler::Amazon.new
crawler.login
