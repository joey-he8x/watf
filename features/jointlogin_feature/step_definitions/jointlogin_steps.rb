include Pages
When /^我进入登陆首页$/ do
        @page=LoginPage.new @b
        @page.open
end

When /^我单击新浪微博链接$/ do
        #@page.xinlang_login_click_link
          @b.link(:class =>"a_sina").click
          sleep(5)
        @b.windows.last.use
        @page = SinaLoginPage.new @b
   
end

When /^我以<(.+)>\/<(.+)>这个新浪微博身份登录$/ do |username,password|
      @page.xinlang_login username, password
      sleep(5)
      @b.windows.last.use
      @page = HomePage.new @b
end

Then /^我应该用新浪微博成功登录$/ do
	
    @page.is_login?.should be_true
end



######网易
When /^我单击网易链接$/ do
        #@page.xinlang_login_click_link
          @b.link(:class =>"a_163").click
          sleep(5)
        @b.windows.last.use
        @page = WangyiLoginPage.new @b
end


When /^我以<(.+)>\/<(.+)>这个网易身份登录$/ do |username,password|
      @page.wangyi_login username, password
      sleep(5)
      @b.windows.last.use
      @page = HomePage.new @b
end

Then /^我应该用网易成功登录$/ do
	
    @page.is_login?.should be_true
end


#########开心网
When /^我单击开心网链接$/ do
        #@page.xinlang_login_click_link
          @b.link(:class =>"a_kaixin").click
          sleep(5)
        @b.windows.last.use
        @page = KaixinLoginPage.new @b
end


When /^我以<(.+)>\/<(.+)>这个开心网身份登录$/ do |username,password|
      @page.kaixin_login username, password
      sleep(5)
      @b.windows.last.use
      @page = HomePage.new @b
end

Then /^我应该用开心网账户成功登录$/ do
	
    @page.is_login?.should be_true
end


###########MSN登陆
When /^我单击msn链接$/ do
        #@page.xinlang_login_click_link
          @b.link(:class =>"a_msn").click
          sleep(5)
        @b.windows.last.use
        @page = MsnLoginPage.new @b
end


When /^我以<(.+)>\/<(.+)>这个msn身份登录$/ do |username,password|
      @page.msn_login username, password
      sleep(5)
      @b.windows.first.use
      @page = HomePage.new @b
end

Then /^我应该用msn账户成功登录$/ do
      @page.is_login?.should be_true
end

#######人人网登陆
When /^我单击人人网链接$/ do
        #@page.xinlang_login_click_link
          @b.link(:class =>"a_renren").click
          sleep(5)
        @b.windows.last.use
        @page = RenrenLoginPage.new @b
end


When /^我以<(.+)>\/<(.+)>这个人人网身份登录$/ do |username,password|
      @page.renren_login username, password
      sleep(5)
      @b.windows.last.use
      @page = HomePage.new @b
      
end

Then /^我应该用人人网账户成功登录$/ do
    @page.is_login?.should be_true
end