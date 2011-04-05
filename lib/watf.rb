["java", "#{File.dirname(__FILE__)}/webspec/web_spec"].concat(Dir["#{File.dirname(__FILE__)}/webspec/jar/*.jar"]).concat(Dir["#{File.dirname(__FILE__)}/module/**/*"]).each { |file| require file }

