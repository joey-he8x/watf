include Pages
When /^我将下列商品添加到购物车:$/ do |products|
  @page = ProductPage.new @b
  products.hashes.each do |product|
    @page.add_to_cart product["product_id"],product["amount"]
  end

end
 
Then /^购物车里应该有商品:$/ do |products|
  @page = CartPage.new @b
  @page.open
  flag = true
  products.hashes.each do |product|
    flag &= @page.check_product product["product_id"]
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
end

When /^选择默认的收货地址$/ do
  @page.select_default_receiver if not @page.receiver_info_done?
end

When /^选择默认的配送方式$/ do
  @page.select_default_delivery if not @page.delivery_info_done?
end

When /^选择付款方式为<(.+)>$/ do |payment|
  @page.select_payment payment
end

When /^确认订单$/ do
  @page.submit_order
end

Then /^应该提示下单成功$/ do
  @page.is_success?
end

Then /^数据库中生成正确的订单$/ do
  order_id = @page.order_id
  order_code = @page.order_code
  order_amount = @page.order_amount
  order = BO::SO.find order_id
  order.should be
  order.code.should == order_code
  order.amount.should == order_amount
end
