include Pages
Given /^我已经登录$/ do 
  @page = LoginPage.new @b
  @page.open
  #当 %{我以<#{@user.email}/#{@user.password}>这个身份登录}
  当 %{我以<qa123@yihaodian.com/111111>这个身份登录}
  那么 %{我应该成功登录网站}
end

Given /^我没有登录$/ do
  @page = HomePage.new @b
  @page.open
  当 %{我登出网站}
  那么 %{我应该登出网站}
  而且 %{我应该在<首页>}
end

When /^我登出网站$/ do
  @page ||= HomePage.new @b
  @page.logout
end

When /^我以<(.+)\/(.+)>这个身份登录$/ do |username,password|
  @page ||= LoginPage.new @b
  @page.login username,password
end

Then /^我应该成功登录/ do 
  @page.is_login?.should be_true
end

Then /^我应该登出网站$/ do
  @page.is_login?.should be_false
end

Then /^登录页面提示<(.+)>$/ do |msg|
  rs = @page.account_desc_text.text.include? msg
  rs2 = @page.pwd_desc_text.text.include? msg
  (rs ||rs2).should be_true
end
