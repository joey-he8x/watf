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

    def pay_by_bank_radio
      @b.radio(:id,"paymentMethodIDTmp5")
    end

    def pay_by_online_radio
      @b.radio(:id,"paymentMethodIDTmp4")
    end

    def pay_by_post
      @b.radio(:id,"paymentMethodIDTmp6")
    end

    def bank_select
      @b.select_list(:id,"bank")
    end

    def cmb_radio
      @b.radio(:id,"3")
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

    def wait_page_present
      @b.div(:id,"SwitchWindow").wait_until_present
    end
  
    def next_step
      next_step_btn.click
    end

    def receiver_info_done?
      wait_page_present
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

    def select_payment payment,bank
      #puts payment +'|'+ bank
      case payment
      when "货到付款": pay_by_cash_radio.when_present.click
      when "货到刷卡": pay_by_card_radio.when_present.click
      when "网上支付":
        #pay_by_online_radio.when_present.click
        case bank
        when "招商银行":
          cmb_radio.when_present.click
        end
      when "银行转帐": 
        pay_by_bank_radio.when_present.click
        bank_select.select bank
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
      msg=@b.div(:text,/您的订单已提交完成/)
      msg.exists? && msg.visible?
    end

  end
end
