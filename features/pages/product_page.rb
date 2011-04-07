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

    def amount_input
      @b.jquery("input[name='product_amount']")
    end

    def buy_btn
      @b.jquery(".input_shopcart")
    end

   
  end
end
