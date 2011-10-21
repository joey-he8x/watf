module Pages
  class SearchPage < BasePage
    def initialize b
      super b
    end

    def name_input
      @b.text_field(:id =>'keyword')
    end

    
    def search_btn
      @b.image(:src,/btn_search.jpg/)
    end
    
    def search_hot_link
      div=@b.link(:xpath=>"//div[@id='hotKeywordsShow']//a",:index=>0)
    end
     
     def search_hot_link_page1
      @b.div(:id => "bottomBrand")
    end 
    
    
     
     #搜索框搜索
    def search keyword
      name_input.set keyword
      search_btn.click
    end
    
    
    def check_search?
        div=@b.link(:title,/海飞丝丝源复活组合洗发露530ml/)
        #debugger
        #puts div.title
        div.exists?
    end
    
    #热门搜索
    def check_hot_search?
        search_hot_link.wait_until_present
        search_hot_link.exists?
    end
    
    def click_search_hot
      #div=@b.link(:xpath=>"div([@id="hotKeywordsShow"]",:index=>0)
      search_hot_link.click
    end
    
    def check_hot_search_page?
      #div=@b.link(:xpath=>"div([@id="hotKeywordsShow"]",:index=>0)
      search_hot_link.wait_until_present
      search_hot_link_page1.exists?
    end
    
    #产品列别说明
     def product_select
      #div=@b.link(:xpath=>"div([@id="hotKeywordsShow"]",:index=>0)
      div=@b.link(:xpath=>"//div[@id='propertiescon']//a",:index=>0)
    end
    
     def product_click
      product_select.click
    end
    
   # 搜索页价格
   
     def select_reflesh?
    div = @b.div(:id =>'buyButton_950028')
     div.wait_until_present

      div.exists?
    end
   
   #切换省份
    def  area_btn
    @b.link(:xpath =>"//div[@id='index_header']/div[2]/div[1]/a")
   
    end
    
    def  click_area
     area_btn.wait_until_present
     area_btn.click
    end
   
   def  src_img
     div=b.link(:xpath =>"div[id('first_banner_slider')]/div/div[1]/a/img")
     img=div.src()
     puts img
   end
   
   def check_src_img?
       
       
   end
   
   def select_area are
     area1=@b.link(:text => are)
     area1.click
   end
   
   def check_area 
   
   end
   
   #积分
 
   def click_score 
     @b.goto "http://my.yihaodian.com/points/displayPointAccount.do"
   end
  
    def score 
       @b.link(:xpath =>"//div[id('container')]//a",:index =>0)
    end
  
  
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
  
  #网盟
  def wang_username
   @b.text_field(:id =>'account')
  end
  
  def wang_passwod
   @b.text_field(:id =>'password')
  end
  
  def login_button
    @b.button(:text,"登录")
  end
  
  def login_wangmeng username ,password
      wang_username.set username
      wang_passwod.set password
      login_button.click
  end
  
  
  def check_wangmeng?
    div =b.link(:xpath =>"//id('container')/x:div[1]/x:dl/x:dd[1]/x:a")
    div.exists?
   
  end
  
  end
end
