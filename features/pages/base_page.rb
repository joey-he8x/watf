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
      @b.jquery("#logout:visible").exists?
    end

    def logout
      #@browser.jquery("#logout a").click if is_login?
      @b.open "www.yihaodian.com/passport/logoff.do"
    end

    def check 
      flag=true
      flag
    end

    def open
      @b.open @url
    end

    def clear_cookie
      @b.cookie.all.delete
    end
  end
end
