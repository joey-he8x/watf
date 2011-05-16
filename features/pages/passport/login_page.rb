module Pages
  class LoginPage < BasePage
    def initialize b
      super b
      @name = "登录页"
      @url = "www.yihaodian.com/passport/login_input.do"
    end

    def name_input
      @b.text_field(:name =>'name')
    end

    def password_input
      @b.text_field(:name => 'password', :class => "login_input")
    end

    def login_btn
      @b.image(:src => "/images/login2.gif")
    end

    def login username,password
      name_input.set username
      password_input.set password
      login_btn.click
    end
  end
end
