module Pages
  class HomePage < BasePage
    def initialize b
      super b
      @name = "首页"
      @url = "www.yihaodian.com/"
    end
    
    #Elements
    def  first_banner_link
      b.link(:xpath =>"div[id('first_banner_slider')]/div/div[1]/a/img")
    end
   
   #Actions
   def check_src_img?
       
   end
  end
end
