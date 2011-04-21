module Pages
  class CartPage < BasePage
    def initialize b
      super b
      @name = "购物车页"
      @url = "www.yihaodian.com/product/cart.do?action=view"
    end

###  elements
    
    def next_step_btn
      @b.button(:id,"button9")
    end

    def confirm_receiver_btn
      @b.button(:id,"confirm_address")
    end

    def confirm_delivery_btn
      @b.button(:id,"confirm_delivery")
    end

    def confirm_payment_btn
      @b.button(:id,"confirm_payment")
    end

    def confirm_order_btn
      @b.link(:id,"confirm_goods")
    end

    def pay_by_cash_radio
      @b.radio(:id,"paymentMethodIDTmp2")
    end

    def pay_by_card_radio
      @b.radio(:id,"paymentMethodIDTmp3")
    end

    def order_amount
      @b.span(:class => "red blod",:text => /￥/).text
    end

    def order_code
      @b.link(:href,/orderParticular.do/).text
    end
    
    def order_id
      href=@b.link(:href,/orderParticular.do/).href
      href.match(/orderId=(\d+)/)[1]
    end

###  Action
    def check_product pid
      #span = @b.link(:xpath,"//div[@class='productname']/span/a[contains(@href,'#{pid}')]")
      span = @b.link(:href ,/product\/#{pid}_/)
      span.exists?
    end
  
    def next_step
      next_step_btn.click
    end

    def receiver_info_done?
      div = @b.div(:id,"receiver_info_check")
      div.exists? && div.visible?
    end

    def delivery_info_done?
      div = @b.div(:id,"delivery_info_check")
      div.exists? && div.visible?
    end

    def payment_info_done?
      div = @b.div(:id,"payment_info_check")
      div.exists? && div.visible?
    end

    def select_default_receiver
      @b.radio(:xpath,"//div[contains(text(),'#{curr_province}')]/input").click
      confirm_receiver_btn.click
    end
    
    def select_default_delivery
      confirm_delivery_btn.when_present.click
    end

    def select_payment payment
      case payment
      when "货到付款": pay_by_cash_radio.when_present.click
      when "货到刷卡": pay_by_card_radio.when_present.click
      else puts "pending"
      end
      confirm_payment_btn.click
    end

    def submit_order
      confirm_order_btn.when_present.click
    end

    def is_success?
      msg=@b.div(:text,/您的订单已提交完成/)
      msg.exists? && msg.visible?
    end

  end
end
