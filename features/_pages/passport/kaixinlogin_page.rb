module Pages
  class KaixinLoginPage < HomePage
    def initialize b
      super b
      @name ="开心网登陆首页"
      #@url ="https://passport.yihaodian.com/passport/login_input.do"
      #@element =[search_name_input,search_btn,search_hot_link,search_hot_link]
    end

   #elements
   
       
    def name_input
      @b.text_field(:name =>"email")
    end

 
    def password_input
      @b.text_field(:name =>"password")
    end

    def login_btn
      @b.button(:id,"btn_dl")
    end
       
  
       
     #Actions
    
    
    #def check_search?  title
        #div=@b.link(:title,/海飞丝丝源复活组合洗发露530ml/)
     # div=@b.link(:title,/#{title}/)
    
    
    def kaixin_login username ,password
      name_input.set username
      password_input.set password
      login_btn.click
    end
    

  end
end
