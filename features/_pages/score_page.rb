module Pages
  class ScorePage < BasePage
    def initialize b
      super b
      @name = "首页"
      @url = "http://www.yihaodian.com/usermanager/order/myOrder.do"
    end
    
    #Elements
   def score 
       @b.link(:xpath =>"//div[id('container')]//a",:index =>0)
    end
   
   #Actions
   
   
   # 积分 与余额
 
  
   
  
  
   def check_score? 
     #click_score.wait_until_present
      score.exists?
   end
  
  
  def order
     @b.goto "http://www.yihaodian.com/usermanager/order/myOrder.do"
  end
  
  
  def check_order?
     div=@b.div(:id =>'doneOrder')
     div.exists?
  end
   
  end
end
