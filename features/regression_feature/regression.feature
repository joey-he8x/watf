# language: zh-CN  
@checklist_tc
功能: 回归测试用例
  checklist的用例
 

    
  场景大纲:  搜索框搜索
    假如 当我已经进入搜索页
    当 我在搜索框输入<<product_code>>商品
    那么 我查询到叫<<product_title>>的商品
    
  例子:  例子
    | product_code       | product_title |
    | 0009500281         | 海飞丝         |
    | 0000316847         | 有友           |
     
    
    
  场景:  热门词搜索
    假如 当我已经进入搜索页
    而且 我选择一个热门词
    那么 我正确进入了该热门词界面
    
  场景大纲:  产品类别搜索
    假如 当我已经进入搜索页
    当 我点击类别<<category>>
    那么 我正确进入了类别为<<category>>的搜索页面
    
  例子:  例子
    | category |
    | 食品、饮料、酒水|
    |美容化妆、个人护理   |
    |母婴食品、母婴用品|
    |厨房用品、清洁用品|
    |手机通讯、数码电器|
    |大家电、生活电器|
    |电脑,软件,办公用品|
    |家居汽饰、箱包运动|
    |玩具、图书音像|
    |服装鞋帽|
    |营养保健、健康器械|
    |机票车票,充值,健康|
    |1号礼品|
    

  场景:  价格页搜索
    假如 当我已经进入搜索页
    当 我在搜索框输入<0009500281>商品
    那么 正确的刷新了商品的价格
    
  场景:  首页切换省份
    假如 我进入首页界面
    当 我切换省份到<上海>然后再切换到<四川>
    那么 省份<上海>和省份<四川>的首页广告是不同的

    
  场景:  我的一号店
    假如 我已经登录
    当 我单击了我的积分
    那么 正确的查询到当前的积分
    当  我单击了我的订单
    那么 正确的显示了我的订单
    
  场景:  网盟
    假如 我登录网盟界面
    当 当我以<test110/test110>这个身份登录 
    那么 网盟登录成功
