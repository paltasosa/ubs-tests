require "watir"
require "rspec/expectations"
chromedriver_path = '/usr/local/bin/chromedriver'
Selenium::WebDriver::Chrome::Service.driver_path= chromedriver_path

Given("the user access ubs.com page") do
  @browser ||= Watir::Browser.new
  @browser.goto "ubs.com"
end

When("page is loaded") do 
  logo =  @browser.div class:'header__logoTitle'
  logo.should be_present
end

Then("domicile selection button is displayed") do
  domicile = @browser.button class: /domicileSelection/
  domicile.should be_present
end

Then("UBS login button is displayed") do
  login = @browser.button class: /headerLogin/
  login.should be_present
end

Then("contact icon is displayed") do
  contact = @browser.span class: /contactIcon/
  contact.should be_present
end

Then("wealth management link is displayed") do
  wealth = @browser.a href: /wealth-management/
  wealth.should be_present
end

Then("asset management link is displayed") do
  asset = @browser.a href: /asset-management/
  asset.should be_present
end

Then("investment bank link is displayed") do
  investment = @browser.a href: /investment-bank/
  investment.should be_present
end

Then("corporate and institutional client link is displayed") do
  corporate = @browser.a href: /#/
  corporate.should be_present
end

Then("about us link is displayed") do
  about = @browser.a href: /our-firm/
  about.should be_present
end

Then("careers link is displayed") do
  careers = @browser.a href: /careers/
  careers.should be_present
end

When("user selects country from domicile") do
  case ENV['COUNTRY']
  when "france"
    (@browser.button class: /domicileSelection/).click
    (@browser.button class: /domicileSelection__select--region/).click
    (@browser.button visible_text: /Europe/).click
    (@browser.button class: /domicileSelection__select--domicile/).click
    (@browser.a visible_text: /France/).click
    (@browser.span visible_text: /Global Topics/).wait_while_present
  when "usa"
    (@browser.button class: /domicileSelection/).click
    (@browser.button class: /domicileSelection__select--region/).click
    (@browser.button visible_text: /North America/).click
    (@browser.button class: /domicileSelection__select--domicile/).click
    (@browser.a visible_text: /United States/).click
    (@browser.span visible_text: /Global Topics/).wait_while_present
  else
    puts "No country specified or specified country not supported yet"
  end  
end

Then("ubs logins options are displayed correctly for country") do
  case ENV['COUNTRY']
  when "france"
    (@browser.button visible_text: /UBS logins/).click
    (@browser.a visible_text: /UBS e-Banking France/).wait_until_present
    (@browser.a visible_text: /UBS e-Banking France/).should be_present
    (@browser.a visible_text: /UBS Quotes/).should be_present
    (@browser.a visible_text: /UBS Connect France/).should be_present
    (@browser.a visible_text: /Investment Bank Client Portal/).should be_present
    (ubs_neo_link = @browser.a visible_text: /UBS Neo/).should be_present
  when "usa"
    (@browser.button visible_text: /UBS logins/).click
    (@browser.a visible_text: /Online Services/).wait_until_present
    (@browser.a visible_text: /Online Services/).should be_present
    (@browser.a visible_text: /UBS Private Bank Account Login/).should be_present
    (@browser.a visible_text: /UBS One Source/).should be_present
    (@browser.a visible_text: /Benefits of Enrolling/).should be_present
    (@browser.a visible_text: /Enroll Now/).should be_present
    (@browser.a visible_text: /Investment Bank Client Portal/).should be_present
    (@browser.a visible_text: /UBS Neo/).should be_present
  else
    puts "No country specified or specified country not supported yet"
  end
end

When("user selects US client account login") do
  (@browser.button visible_text: /UBS logins/).click
  (@browser.a visible_text: /UBS E-Banking Switzerland/).wait_until_present
  (@browser.a visible_text: /US client account login/).click
  (@browser.a visible_text: /US client account login/).wait_while_present
end

Then("user is redirected to login page") do
  (@browser.h1 visible_text: /Welcome to UBS Online Services/).wait_until_present
end

Then("login is working for specified user and password") do
  if (ENV['USERNAME']!=nil && ENV['PASSWORD']!=nil) 
    puts "We would see login successfully here, but I don't have valid credentials to create this test yet"
  else
    puts "Username and password must be specified to run this test"
  end
end

When("user tries to login") do
    if (ENV['USERNAME']!=nil && ENV['PASSWORD']!=nil) 
    (@browser.text_field id:/username/).set ENV['USERNAME']
    (@browser.text_field id:/password/).set ENV['PASSWORD']
    (@browser.input id:/submit/).click
  else
    puts "Username and password must be specified to run this test"
    (@browser.input id:/submit/).click
    (@browser.div visible_text: /Enter your user name/).wait_until_present
    (@browser.div visible_text: /Enter your user name/).should be_present
  end
end

Then("user can select register now to start a new registration process correctly") do
  (@browser.button id:/registernow/).click
  (@browser.h2 visible_text: /Enter Personal Information/).wait_until_present
  (@browser.input id: /ssn/).should be_present
  (@browser.input id: /lastname/).should be_present
  (@browser.input class: /account-branch/).should be_present
  (@browser.input class: /account-number/).should be_present
  (@browser.input class: /month/).should be_present
  (@browser.input class: /day/).should be_present
  (@browser.input class: /year/).should be_present
  (@browser.input type: /submit/).should be_present
end