module Pages
  class BasePage
    attr_accessor :name,:url,:browser

    def initialize browser
      @b = browser
    end

    def method_missing(sym, *args, &block)
      @b.send sym, *args, &block
    end

    def is_login?
      @b.span(:id =>"logout").exists? and @b.span(:id =>"logout").visible? 
    end

    def logout
      #@browser.jquery("#logout a").click if is_login?
      @b.goto "www.yihaodian.com/passport/logoff.do"
    end

    def include? msg
      @b.text.include? msg
    end

    def check 
      flag=true
      flag
    end

    def open
      @b.goto @url
    end

    def clear_cookie
      @b.cookie.all.delete
    end

    def validate_province_btn
      @b.link(:id => 'validate')
    end
  end
end
