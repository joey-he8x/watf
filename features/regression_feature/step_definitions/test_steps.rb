include Pages
When /^当我已经进入搜索页$/ do
        @page=SearchPage.new @b
        @page.open
        sleep(5)
end


When /^我在搜索框输入<(.+)>商品$/ do |name_input|
  @page.search name_input
  @page=SearchPage.new @b
end

Then /^我查询到叫<(.+)>的商品$/ do |product_name|
  @page.check_search?(product_name).should be_true
end


When /^我选择一个热门词$/ do 
  ENV["LAST_KEYWORD"] = @page.search_hot_link.text()
  @page.search_hot_link.click
end


Then /^我正确进入了该热门词界面$/ do 
  @page = SearchPage.new @b
  @page.check_search?(ENV["LAST_KEYWORD"]).should be_true
end


When /^我点击类别<(.+)>$/ do |catagory_name|
  @page = SearchPage.new @b
  @page.product_click catagory_name
end

When /^我正确进入了类别为<(.+)>的搜索页面$/ do |catagory_name|
	   @page.is_check?catagory_name.should be_true
end

When /^正确的刷新了商品的价格$/ do 
  @page = SearchPage.new @b
 @page.select_reflesh?.should be_true
 
end

##省份
When /^我进入首页界面$/ do
	   @page = HomePage.new @b
	   @page.open
	   sleep(5)
end

When /^我切换省份到<(.+)>然后再切换到<(.+)>$/ do |area1,area2|
  @page = HomePage.new @b
  @page.select_area area1
  sleep(3)
  ENV["First_area"] = @b.link(:onclick,/index_channel_3/).href
  @page.select_area area2
   sleep(3)
  ENV["Last_area"] =  @b.link(:onclick,/index_channel_3/).href
end

Then /^省份<(.+)>和省份<(.+)>的首页广告是不同的$/ do |img1,img2|
# @page = HomePage.new @b
  img1=ENV["First_area"]
  img2=ENV["Last_area"]
  @page.check_src_img?(img1,img2).should be_false
end

When /^我单击了我的积分$/ do 
  @page = ScorePage.new @b
  @page.open
  sleep(5)
end

Then /^正确的查询到当前的积分$/ do 
  #@page = ScorePage.new @b
  @page.check_score?.should be_true
end


When /^我单击了我的订单$/ do 
  @page = MyOrderPage.new @b
  @page.open
end


Then /^正确的显示了我的订单$/ do 
  @page = MyOrderPage.new @b
  @page.check
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



