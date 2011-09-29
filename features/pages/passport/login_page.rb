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


    def login username,password
      name_input.set username
      password_input.set password
      login_btn.click
    end
  end
end
