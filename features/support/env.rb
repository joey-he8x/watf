require 'cucumber/formatter/unicode'

require 'yaml'
require "#{File.dirname(__FILE__)}/site"
site=YAML.load_file 'features/pages/site.yaml'
require "rubygems"
require "watir-webdriver"
require "watir-webdriver/wait"
b = Watir::Browser.new :firefox

#capabilities = Selenium::WebDriver::Remote::Capabilities.htmlunit(:javascript_enabled => true)
#b = Watir::Browser.new(:remote, :url => "http://192.168.145.1:4444/wd/hub", :desired_capabilities => :htmlunit)
#b = Watir::Browser.new(:remote, :url => "http://192.168.145.1:4444/wd/hub", :desired_capabilities => :firefox)


at_exit do
#  java.lang.System.exit(1) 
end

Before do
  @b = b
  @site = site
  #@b.cookie.all.delete
end

After do |scenario|
  # Do something after each scenario.
  # The +scenario+ argument is optional, but
  # if you use it, you can inspect status with
  # the #failed?, #passed? and #exception methods.

end
