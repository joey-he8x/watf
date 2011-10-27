module Pages
  class UnionPage < BasePage
    def initialize b
      super b
      @name = "网盟登陆"
      @url = "http://union.yihaodian.com/passport/login_input.do"
      @elements = [search_hot_link]
    end

#Elements


    
    
#Actions


  
  #网盟
  def wang_username
   @b.text_field(:id =>'account')
  end
  
  def wang_passwod
   @b.text_field(:id =>'password')
  end
  
  def login_button
    @b.button(:text,"登录")
  end
  
  def login_wangmeng username ,password
      wang_username.set username
      wang_passwod.set password
      login_button.click
  end
  
  
  def check_wangmeng?
    div =b.link(:xpath =>"//id('container')/x:div[1]/x:dl/x:dd[1]/x:a")
    div.exists?
   
  end
  
  end
end
