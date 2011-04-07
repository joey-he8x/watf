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
