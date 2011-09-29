module Pages
  class CartPage < BasePage
    def initialize b
      super b
      @name = "购物车页"
      @url = "www.yihaodian.com/product/cart.do?action=view"
      @elements = [next_step_btn,ino_btn,clean_cart_btn]
    end

###  elements
    
    def next_step_btn
      @b.button(:id,"button9")
    end

    def ino_btn
      @b.link(:class,"inobtn")
    end

    def clean_cart_btn
      @b.link(:class,"btn_clean")
    end

###  Action
    def clean_cart
      clean_cart_btn.click if clean_cart_btn.exists? && clean_cart_btn.visible?
    end
    def check_product pid
      #span = @b.link(:xpath,"//div[@class='productname']/span/a[contains(@href,'#{pid}')]")
      span = @b.link(:href ,/product\/#{pid}_/)
      span.exists?
    end

    def skip_activities
      ino_btn.click if ino_btn.exists? && ino_btn.visible?
    end

    def next_step
      next_step_btn.click
      #Pages::CheckoutPage.new @b
    end

  end
end
