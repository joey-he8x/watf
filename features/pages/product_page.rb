module Pages
  class ProductPage < BasePage
    def initialize b
      super b
      @name = "产品详细页"
      @url = "www.yihaodian.com/product/"
    end

    def open pid
     @b.open @url + pid 
    end


   
  end
end
