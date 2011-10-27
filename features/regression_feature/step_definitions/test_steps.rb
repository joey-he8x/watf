include Pages
When /^当我已经进入搜索页$/ do
        @page=SearchPage.new @b
        @page.open
end


When /^我在搜索框输入<(.+)>商品$/ do |name_input|
 #@page = SearchPage.new
  @page.search name_input
  @page=SearchPage.new @b
end

Then /^我查询出搜索到的商品$/ do 
  @page.check_search?("ttt").should be_true
end

Then /^我查询到叫<(.+)>的商品$/ do |product_name|
  @page.check_search?(product_name).should be_true
end


When /^我选择一个热门词$/ do 
  #@page = BasePage.new @b
  @page.check_hot_search?.should be_true
  @page.click_search_hot
end


Then /^我正确进入了该热门词界面$/ do 
  @page = SearchPage.new @b
  @page.check_hot_search_page?.should be_true
end


When /^选择一个列别$/ do 
  @page = SearchPage.new @b
  @page.product_click
end

When /^正确的刷新了商品的价格$/ do 
  @page = SearchPage.new @b
  @page.select_reflesh?.should be_true
end

##省份
When /^我进入首页界面$/ do
	   @page = HomePage.new @b
	   @page.open
end

When /^我选择<(.+)>的省份$/ do |are|
  @page = HomePage.new @b
  @page.click_area
  @page.select_area are
end

Then /^不同商家的省份的首页广告是不同的$/ do
  @page = HomePage.new @b
  @page.check_src_img?.should be_true
end

When /^我单击了我的积分$/ do 
  @page = ScorePage.new @b
  @page.open
end

When /^正确的显示了当前的积分$/ do 
  @page = ScorePage.new @b
  @page.check_score?
end


When /^我单击了我的订单$/ do 
  @page = ScorePage.new @b
  @page.order
end


When /^正确的显示了我的订单$/ do 
  @page = ScorePage.new @b
  @page.check_order?
end

#网盟
When /^我登录网盟界面$/ do 
  @page = UnionPage.new @b
  @page.open
end

When /^当我以<(.+)\/(.+)>这个身份登录$/ do |username,password|
  @page = UnionPage.new @b
  @page.login_wangmeng username,password
end



When /^网盟登录成功$/ do
  @page = UnionPage.new @b
  @page.check_wangmeng?
end



