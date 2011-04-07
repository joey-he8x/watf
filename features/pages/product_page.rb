module Pages
  class ProductPage < BasePage
    def initialize b
      super b
      @name = "产品详细页"
      @url = "www.yihaodian.com/product/"
    end

    def open pid
     @b.goto @url + pid
    end

    def amount_input
      @b.text_field(:name => "product_amount")
    end

    def buy_btn
      @b.button(:class => "input_shopcart")
    end

    def add_to_cart pid,amount
      open pid
      amount_input.set amount
      buy_btn.click
      validate_province_btn.click if validate_province_btn.exists? and validate_province_btn.visible?

    end

   
  end
end
