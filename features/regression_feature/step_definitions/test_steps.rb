include Pages
When /^我输入<(.+)>商品$/ do |name_input|
  @page = SearchTest.new @b
  @page.search name_input
end

When /^我查询出搜索到的商品$/ do 
  @page = SearchTest.new @b
  @page.check_search?.should be_true
end

When /^我选择一个热门词$/ do 
  @page = SearchTest.new @b
  @page.check_hot_search?.should be_true
  @page.click_search_hot
end


When /^我正确进入了该热门词界面$/ do 
  @page = SearchTest.new @b
  @page.check_hot_search_page?.should be_true
end


When /^选择一个列别$/ do 
  @page = SearchTest.new @b
  @page.product_click
end

When /^正确的刷新了商品的价格$/ do 
  @page = SearchTest.new @b
  @page.select_reflesh?.should be_true
end


When /^我选择<(.+)>的省份$/ do |are|
  @page = SearchTest.new @b
  @page.click_area
  @page.select_area are
end

When /^不同商家的省份的首页广告是不同的$/ do
  @page = SearchTest.new @b
  @page.src_img
 
end




When /^我单击了我的积分$/ do 
  @page = SearchTest.new @b
  @page.click_score
end

When /^正确的显示了当前的积分$/ do 
  @page = SearchTest.new @b
  @page.check_score?
end


When /^我单击了我的订单$/ do 
  @page = SearchTest.new @b
  @page.order
end


When /^正确的显示了我的订单$/ do 
  @page = SearchTest.new @b
  @page.check_order?
end


#网盟
When /^我登录网盟界面$/ do 
    @b.goto "http://union.yihaodian.com/passport/login_input.do"
end

When /^当我以<(.+)\/(.+)>这个身份登录$/ do |username,password|
  @page = SearchTest.new @b
  @page.login_wangmeng username,password
end



When /^网盟登录成功$/ do
  @page = SearchTest.new @b
  @page.check_wangmeng?
end


