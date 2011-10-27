module Pages
  class BasePage
    attr_accessor :name,:url,:browser,:elements

    def initialize browser
      @b = browser
    end

    def method_missing(sym, *args, &block)
      @b.send sym, *args, &block
    end

#Elements
    def val_province_btn
      @b.link(:id => 'currentProvinceName')
    end

    def  area_btn
      @b.link(:xpath =>"//div[@id='index_header']/div[2]/div[1]/a")
    end
    
     ###  ËÑË÷Ò³ÔªËØ
        def search_name_input
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
     
     def buy_button
      @b.div(:id =>'buyButton_950028')
     end 
     
    def account_desc_text
      @b.span(:id =>'user_name')
    end
  
  #############ÇĞ»»Ê¡·İ
    def  area_btn
    @b.link(:xpath =>"//div[@id='index_header']/div[2]/div[1]/a")
    end
    
    def  src_img
     div=b.link(:xpath =>"div[id('first_banner_slider')]/div/div[1]/a/img")
     img=div.src()
     #puts img
   end
   
  

#Actions

    def is_login?
      @b.span(:id =>"logout").exists? and @b.span(:id =>"logout").visible? 
    end

    def logout
      #@browser.jquery("#logout a").click if is_login?
      @b.goto "www.yihaodian.com/passport/logoff.do"
    end

    def include? msg
      @b.text.include? msg
    end

    def selfcheck 
      flag=true
      @elements.each do |e|
        if !e.exists? then
          flag=false
          puts e.inspect
        end
      end
      flag
    end
    
    def wait_until_present
    
    end

    def open
      @b.goto @url
    end

    def clear_cookie
      @b.cookie.all.delete
    end

    def curr_province
      @b.div(:id,"currProvince").text
    end

   def select_area are
     area_btn.click
     area1=@b.link(:text => are)
     area1.click
   end

   ####ËÑË÷Ò³
  def search keyword
      search_name_input.set keyword
      search_btn.click
    
    end
    
    
    def click_search_hot
      #div=@b.link(:xpath=>"div([@id='hotKeywordsShow']",:index=>0)
      search_hot_link.click
    end
    
  
    

  end
end
