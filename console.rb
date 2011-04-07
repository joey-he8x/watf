require 'rubygems'
["java", "lib/webspec/web_spec"].concat(Dir["lib/webspec/jar/*.jar"]).concat(Dir["lib/module/**/*"]).each {|file| require file}
require 'features/support/db'
require 'features/pages/base_page'
Dir["features/pages/*.rb"].concat(Dir["features/modules/*.rb"]).each { |file|puts file; require file }
WebSpec.extra_careful_pause_until_ready false

