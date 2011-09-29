module Pages
  class CheckoutPage < BasePage
    def initialize b
      super b
      @name = "结算页"
      @url = "www.yihaodian.com/checkout/index.do"
      @elements = [confirm_receiver_btn,confirm_delivery_btn,confirm_payment_btn,confirm_order_btn,
                  pay_by_cash_radio,pay_by_card_radio,pay_by_bank_radio,pay_by_online_radio,
                  pay_by_post,cmb_radio,order_amount_text,order_code_link
                  ]
    end

###  elements
    def info_body_div
      @b.div(:id => "head_info_check")
    end
    
    def confirm_receiver_btn
      @b.button(:id,"confirm_address")
    end

    def confirm_delivery_btn
      @b.button(:id,"doSaveDeliveryBtn")
    end

    def confirm_payment_btn
      @b.button(:id,"doSavePaymentButton")
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

    def pay_by_bank_radio
      @b.radio(:id,"paymentMethodIDTmp5")
    end

    def pay_by_online_radio
      @b.radio(:id,"paymentMethodIDTmp4")
    end

    def pay_by_post
      @b.radio(:id,"paymentMethodIDTmp6")
    end

    def cmb_radio
      @b.radio(:id,"74")
    end

    def order_amount_text
      @b.span(:class => "red blod",:text => /￥/)
    end

    def order_code_link
      @b.link(:href,/orderParticular.do/)
    end
    
###  Action
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
      @b.radio(:name => "receiverAddress",:index => 1).click
      confirm_receiver_btn.click
    end
    
    def select_default_delivery
      confirm_delivery_btn.when_present.click
    end

    def select_payment payment,bank
      #puts payment +'|'+ bank
      case payment
      when "货到付款": pay_by_cash_radio.when_present.click
      when "货到刷卡": pay_by_card_radio.when_present.click
      when "网上支付":
        pay_by_online_radio.when_present.click
        #case bank
        #when "招商银行":
        #  cmb_radio.when_present.click
        #end
      when "银行转帐": 
        pay_by_bank_radio.when_present.click
      when "邮局汇款":
        pay_by_post.when_present.click
      else puts "pending"
      end
      confirm_payment_btn.when_present.click
    end

    def submit_order
      confirm_order_btn.when_present.click
    end

    def is_success?
      msg=@b.div(:text,/订单已提交/)
      msg.exists? && msg.visible?
    end

    def wait_page_present
      info_body_div.wait_until_present
    end

    def get_first_order_id
      href=@b.link(:href,/orderParticular.do/).href
      href.match(/orderId=(\d+)/)[1]
    end
  end
end
