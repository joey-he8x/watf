require 'cucumber/formatter/unicode'
require 'lib/watf'
#["java", "lib/webspec/web_spec"].concat(Dir["lib/webspec/jar/*.jar"]).concat(Dir["lib/module/**/*"]).each { |file| require file }
#WebSpec.extra_careful_pause_until_ready false

require 'yaml'
site=YAML.load_file 'features/pages/site.yaml'
require "rubygems"
require "watir-webdriver"
require "watir-webdriver/wait"
b = Watir::Browser.new :firefox


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
