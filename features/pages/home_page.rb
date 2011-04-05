module Pages
  class HomePage < BasePage
    def initialize b
      super b
      @name = "首页"
      @url = "www.yihaodian.com/"
    end
  end
end
