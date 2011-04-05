["java", "#{File.dirname(__FILE__)}/../lib/web_spec"].concat(Dir["#{File.dirname(__FILE__)}/../lib/jar/*.jar"]).each { |file| require file; puts file }
WebSpec.extra_careful_pause_until_ready false
#WebSpec.webspec_home = "lib";
#@spec = WebSpec.new.mozilla
