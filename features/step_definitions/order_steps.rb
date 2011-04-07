include Pages
When /^我将下列商品添加到购物车:$/ do |products|
  @page = ProductPage.new @b
  products.each do |product|
    @page.open product.product_id
    @page.amount_input.set 'value',product.amount
    @page.buy_btn.click
  end

end
 
Then /^购物车里应该有商品:$/ do |products|
  @page = CartPage.new @b
  flag = true
  products.each do |product|
    flag &= @page.check_product product.product_id
  end
  flag.should be_true

end
