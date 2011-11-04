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
   
     #####切换地区
 ##  def  click_area
   #  area_btn.wait_until_present
    # area_btn.click
    #end
    
   #def select_area are
    # area1=@b.link(:text => are)
    
    # area1.click
   #end
   
   def check_src_img? img1,img2
        #div=b.link(:xpath =>"div[id('first_banner_slider')]/div/div[1]/a/img")
        img==img2 
       
 end
  
   
  end
end
