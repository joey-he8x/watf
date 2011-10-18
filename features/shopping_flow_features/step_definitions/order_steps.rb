include Pages
When /^我将下列商品添加到购物车:$/ do |products|
  @page = ProductPage.new @b
  products.hashes.each do |product|
    @page.add_to_cart product["product_id"],product["amount"]
  end

end

Given /^购物车里没有商品$/ do
  @page = CartPage.new @b
  @page.open
  @page.clean_cart
end

When /^我购买类型为"(.+)"\(.*\)的商品$/ do |sale_type|
  prods=@prods[sale_type] 
  puts ['product id:'] <<prods
  table=[%w{product_id amount}]
  prods.each{|prod| table << [prod.to_s,1]}
  当 %{我将下列商品添加到购物车:},table(table)
  那么 %{购物车里应该有商品:},table(table)
end


When /^我提交订单$/ do
  当 "我点击结算订单"
  而且 "选择默认的收货地址"
  而且 "选择默认的配送方式"
  而且 "选择付款方式为<货到付款>"
  而且 "确认订单"
end
 
Then /^购物车里应该有商品:$/ do |products|
  @page = CartPage.new @b
  @page.open
  flag = true
  products.hashes.each do |product|
    flag &= @page.check_product(product["product_id"])
  end
  flag.should be_true

end

Given /^我的购物车里有商品:$/ do |products|
    当 %{我将下列商品添加到购物车:},table(products.raw)
    那么 %{购物车里应该有商品:},table(products.raw)
end

When /^我点击结算订单$/ do
  @page = CartPage.new @b
  @page.open
  @page.next_step
  sleep 1
  @page.skip_activities
  @page = Pages::CheckoutPage.new @b
  @page.wait_until_present
end

When /^选择默认的收货地址$/ do
  @page.select_default_receiver if not @page.receiver_info_done?
end

When /^选择默认的配送方式$/ do
  @page.select_default_delivery if not @page.delivery_info_done?
end

When /^选择付款方式为"([^,]+),?([^,]+)?"$/ do |payment,bank|
  @page.select_payment payment,bank
end

When /^确认订单$/ do
  @page.submit_order
end

Then /^应该提示下单成功$/ do
  @page.is_success?
  ENV['order_code'] = @page.order_code_link.text
  ENV['order_amount'] = @page.order_amount_text.text
end

Then /^数据库中生成正确的订单$/ do
  if ENV['db']=='true'
    order_id = @page.order_id
    order_code = @page.order_code
    order_amount = @page.order_amount
    order = BO::SO.find order_id
    order.should be
    order.code.should == order_code
    order.amount.should == order_amount
  else
    #pending 
  end
end

When /^我取消刚才的订单$/ do
  @page = MyOrderPage.new @b
  @page.open
  @page.wait_until_present
  @page.cancel_order ENV['order_code']
end

Then /^最近的订单取消成功$/ do
  #@page.is_recent_order_canceled?.should be_true
end
