$KCODE = 'u'
module WATF
  class Site
    attr_accessor :title,:domain,:page_map
    def initialize
    end

    def get_page page_name
      page_map[page_name]
    end
  end
end

if __FILE__ == $0

s = WATF::Site.new
s.title='f'
require 'yaml'
f=open('t.yaml','w')
s.page_map={"test" => "shanghai"}
puts f
YAML.dump s,f
f.close
end
