module Pages
  class SearchPage < BasePage
    def initialize b
      super b
      @name ="搜索页"
      @url ="http://search.yihaodian.com/s/c0-k"
      #@element =[search_name_input,search_btn,search_hot_link,search_hot_link,buy_button]
    end

     def buy_button
      #@b.div(:id =>'buyButton_950028')
     end 
    
 
    
    def product_click name
      @b.link(:text,/#{name}/).click
    end
    
    def is_check? name
      @b.link(:text,/#{name}/).exists?
    end

    def check_search?  title
        div=@b.link(:title,/#{title}/)
        div.exists?
    end   
   # 搜索页价格
   
    def select_reflesh?
      @b.div(:id =>'buyButton_950028').exists?
    end
   
    def selfcheck
      super.selfcheck
      bottom_brand_div.wait_until_present
    end
  
  end
end
