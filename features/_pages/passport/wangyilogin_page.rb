module Pages
  class WangyiLoginPage < HomePage
    def initialize b
      super b
      @name ="新浪登陆首页"
      #@url ="https://passport.yihaodian.com/passport/login_input.do"
      #@element =[search_name_input,search_btn,search_hot_link,search_hot_link]
    end

   #elements
    # 新浪微博
      # def xinlang_login_button
       #     @b.link(:class =>"a_sina")     
       #end
       
    def name_input
      @b.text_field(:name =>"username")
    end

 
    def password_input
      @b.text_field(:name =>"password")
    end

    def login_btn
      @b.button(:class,"blue_btn")
    end
       
 
       
     #Actions
    def wangyi_login username ,password
      name_input.set username
      password_input.set password
      login_btn.click
    end
    
   
  
  end
end
