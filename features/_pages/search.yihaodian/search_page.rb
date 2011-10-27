module Pages
  class SearchPage < BasePage
    def initialize b
      super b
      @name ="搜索页"
      @url ="http://search.yihaodian.com/s/c0-k"
      #@element =[search_name_input,search_btn,search_hot_link,search_hot_link]
    end

   
    
    
    def check_search?  title
        #div=@b.link(:title,/海飞丝丝源复活组合洗发露530ml/)
      div=@b.link(:title,/#{title}/)
        div.exists?
    end
    
    #热门搜索
    def check_hot_search?
        search_hot_link.wait_until_present
        search_hot_link.exists?
    end
    

    
    def check_hot_search_page?
     
      search_hot_link.wait_until_present
      search_hot_link_page1.exists?
    end
    
    
    
    
    
    #产品列别说明
     def product_select
     
      div=@b.link(:xpath=>"//div[@id='propertiescon']//a",:index=>0)
    end
    
     def product_click
      product_select.click
    end
    
   # 搜索页价格
   
     def select_reflesh?
    div = buy_button
     div.wait_until_present
      div.exists?
    end
   
   
  
  end
end
