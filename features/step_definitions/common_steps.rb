include Pages
Given /^我在网站<(.+)>$/ do |pagename|
    @page = Object.const_get(@site.get_page(pagename)).new @b
    @page.open
end

When /^我进入<(.+)>$/ do |pagename|
     @page = Object.const_get(@site.get_page(pagename)).new @b
    @page.open
end

 

Then /^我应该在?(?:返回)?<(.+)>$/ do |pagename|
  @page = Object.const_get(@site.get_page(pagename)).new(@b)
end


Then /^应该提示<(.+)>$/ do |msg|
  rs = @page.include? msg
  rs.should be_true
end

Then /^I debug$/ do
  debugger
end
