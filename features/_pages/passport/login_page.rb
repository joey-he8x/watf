module Pages
  class LoginPage < BasePage
    def initialize b
      super b
      @name = "登录页"
      @url = "https://passport.yihaodian.com/passport/login_input.do"
      @elements = [name_input,password_input,login_btn,account_desc_text,pwd_desc_text]
    end

    def name_input
      @b.text_field(:id =>'un')
    end

    def password_input
      @b.text_field(:id => 'pwd')
    end

    def login_btn
      @b.button(:text,"登　录")
    end

    def account_desc_text
      @b.span(:id =>"accountDesc")
    end

    def pwd_desc_text
      @b.span(:id => "pwd_desc")
    end

   ## 联合登陆
   def sinalogin_button
    @b.link(:class =>'a_sina')
   end
   
   def wangyilogin_button
    @b.link(:class =>'a_163')
   end
   
   def kaixinwang_button
     @b.link(:class =>'a_kaixin')
   end
   
   def msn_button
     @b.link(:class =>'a_msn')
   end

   def renrenwang_button
      @b.link(:class=>'a_renren')
   end


    def login username,password
      name_input.set username
      password_input.set password
      login_btn.click
    end
  end
end
