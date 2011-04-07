module Pages
  class CartPage < BasePage
    def initialize b
      super b
      @name = "购物车页"
      @url = "www.yihaodian.com/product/cart.do?action=view"
    end

    def check_product pid
      span = @b.jquery("div.productname a[href*=#{pid}]")
      span.exists?
    end


  end
end
