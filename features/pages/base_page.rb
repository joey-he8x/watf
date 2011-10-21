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
   
   

   
   def check_area 
   
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

  end
end
