module Pages
  class MyOrderPage < BasePage
    def initialize b
      super b
      @name = "订单列表页"
      @url = "www.yihaodian.com/usermanager/order/myOrder.do"
    end

#Elements
    def test
    end


#Actions
    def cancel_order code
      @b.button(:id,code)
    end
    
    def cancel_recent_order
      btn=@b.button(:xpath,"/html/body/div[2]/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr[2]/td[9]/input[@value='取消']")
      btn.click
    end

    def is_recent_order_canceled?
      btn=@b.button(:xpath,"/html/body/div[2]/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr[2]/td[9]/input[@value='取消']")
      !btn.exists?
 
    end

  end
end
