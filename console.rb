["java", "lib/webspec/web_spec"].concat(Dir["lib/webspec/jar/*.jar"]).concat(Dir["lib/module/**/*"]).concat(Dir["features/pages/*.rb"]).each { |file| require file }
WebSpec.extra_careful_pause_until_ready false

