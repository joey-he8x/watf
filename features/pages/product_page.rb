module Pages
  class ProductPage < BasePage
    def initialize b
      super b
      @name = "产品详细页"
      @url = "www.yihaodian.com/product/"
    end

#elements
    def amount_input
      @b.text_field(:name => "product_amount")
    end

    def buy_btn
      @b.button(:class => "input_shopcart")
    end

    def ser_amount_input
      @b.text_field(:id => "amount")
    end

  
#actions
    def open pid
     @b.goto @url + pid
    end

    def is_serial?
      @b.div(:id,"selectedSeries").exists?
    end

    def add_to_cart pid,amount
      open pid
      buy_btn.wait_until_present
      if is_serial?
        ser_amount_input.set amount
        buy_btn.click
      else
        amount_input.set amount
        buy_btn.click
      end

    end

   
  end
end
