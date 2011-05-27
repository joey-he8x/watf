require 'rubygems'
require 'irb/completion'
Dir["lib/module/**/*"].each {|file| require file}
require 'features/support/db'
require 'features/pages/base_page'
Dir["features/pages/*.rb"].concat(Dir["features/modules/*.rb"]).each { |file|puts file; require file }
require "watir-webdriver"
require "watir-webdriver/wait"
@b = Watir::Browser.new :firefox

