module Pages
  class LoginPage < BasePage
    def initialize b
      super b
      @name = "登录页"
      @url = "www.yihaodian.com/passport/login_input.do"
    end

    def name_input
      @b.jquery('input[name=name]')
    end

    def password_input
      @b.jquery('input[name=password]:visible')
    end

    def login_btn
      @b.jquery("img[src='/images/login2.gif']").parent.a
    end

    def login username,password
      name_input.set 'value',username
      password_input.set 'value',password
      login_btn.click
    end
  end
end
