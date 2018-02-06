SET NAMES UTF8;
DROP DATABASE IF EXISTS shoe;
CREATE DATABASE shoe CHARSET=UTF8;
use shoe;


#首页
#-- 已插入
#banner轮播
CREATE TABLE banner_carousel(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	href VARCHAR(128),
	title VARCHAR(64)
);
#banner轮播数据
INSERT INTO banner_carousel VALUES
(null,"img/index_banner/cropped_jainding1600x560.jpg","new.html?pid=1","即使是这个鉴定量爆炸的11月，我们也坚持每月免费鉴定1次！"),
(null,"img/index_banner/cropped_CX1600x560.jpg","new.html?pid=2","醉是那一抹北卡蓝——Converse X Air Jordan Pack开箱"),
(null,"img/index_banner/cropped_haojia1600x560.jpg","new.html?pid=3","get潮流|Michael鉴赏Supreme x Stone Island 联名系列卫衣"),
(null,"img/index_banner/cropped_harden1600x560_1_.jpg","new.html?pid=4","惊喜还是惊吓？Harden Vol.2 新色谍照释出"),
(null,"img/index_banner/cropped_fashion1600x560.jpg","new.html?pid=5","这家店不仅有好价球鞋，还有超给力礼物！"),
(null,"img/index_banner/cropped_ler160x560.jpg","new.html?pid=6","【Jesse专栏】 第十七期 不止LBJ15，老詹的鞋一直很讲究");

/**购物车条目**/
CREATE TABLE shoe_cart(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  size VARCHAR(16),
  color VARCHAR(16),
  is_checked BOOLEAN #是否已勾选，确定购买
);
#热门讯息
CREATE TABLE news(
	hid INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(64),
	publish_time INT,
	view INT,
	sm VARCHAR(128),
	details VARCHAR(128),
	style VARCHAR(16),
	des VARCHAR(1024)
);
INSERT INTO news VALUES
	(null,"Air Jordan 13“Wheat”明日登场！",1507824835,0,"img/news/sm/1.jpg","img/news/md/1.jpg","篮球 最新","Air Jordan Wheat丰收黄系列中的一款力作Air Jordan 13“Wheat”将于明日在官网上架！该鞋搭载浅褐配色，鞋舌、鞋面及绗缝侧拼接均采用翻毛皮设计。黑豹之眼全息图案与黑色外底垫片结合，致敬MJ为元年款注入非凡灵感的黑豹风范。"),
	(null,"Nike Air Foamposite One“Legion Green”本周四上架！",1507925835,0,"img/news/sm/2.jpg","img/news/md/2.jpg","篮球","这双喷以军绿色加身，鞋面带有全息光泽，承接黑色橡胶外底，带来极佳视觉体验。喜欢的朋友一定不要错过！"),
	(null,"发售敲定！Air Jordan 6“Like Mike”官图释出",1508025835,0,"img/news/sm/3.jpg","img/news/md/3.jpg","篮球 最新","以乔丹在1991年拍摄的佳得乐广告为灵感所打造的Air Jordan 6 Retro“Like Mike”，今日释出官图以及官方发售信息。鞋面以白橙双色拼接打造，Jumpman Logo以及鞋带扣等细节选以绿色点缀，并随鞋附赠复古Jumpman吊牌。"),
	(null,"秋冬专属！Air Jordan 6“Wheat”实物赏析",1508125835,0,"img/news/sm/4.jpg","img/news/md/4.jpg","篮球","秋冬专属配色Air Jordan 6“Wheat”明日即将发售，小麦色的鞋身搭配秋天的落叶，画面太美！上脚太帅！你会入手吗？"),
	(null,"原谅绿！Air Jordan 6 Gatorade“Green Suede”即将发售",1508126835,0,"img/news/sm/5.jpg","img/news/md/5.jpg","篮球 最新","期待已久的Air Jordan 6 Gatorade“Green Suede”即将迎来发售!从此次释出的图片中可以看到，“Like Mike”的特致鞋盒为橙色，鞋盒上印有“Mike”字样以及佳得乐经典闪电Logo，鞋盒内的防尘纸也相当别致。"),
	(null,"最佳组合？Air Jordan 1 Retro High OG“Bred Toe”释出",1508156835,0,"img/news/sm/6.jpg","img/news/md/6.jpg","篮球 最新","Air Jordan 1“Bred”和Air Jordan 1“Black Toe”一直以来都是AJ1中的经典，此番，Jordan Brand别出心裁的将二者结合，推出Air Jordan 1 Retro High OG“Bred Toe”。"),
	(null,"Off White X Air Jordan 1“The Ten”官方发售终于来临！",1508186835,0,"img/news/sm/7.jpg","img/news/md/7.jpg","篮球","年初就开始预热的Off White X Air Jordan“The Ten”系列，在此前并未通过Nike官方渠道发售。"),
	(null,"又见麂皮！Nike PG1“Blue Suede”PE释出",1508286835,0,"img/news/sm/8.jpg","img/news/md/8.jpg","篮球","年初就开始预热的Off White X Air Jordan“The Ten”系列，在此前并未通过Nike官方渠道发售。"),
	(null,"Alexander Wang x adidas Originals Season 2 第四波新品公布",1508386835,0,"img/news/sm/9.jpg","img/news/md/9.jpg","潮流 最新","adidas Originals 近日与时装设计师 Alexander Wang 再度带来了第四波新品，此次系列涵盖了 AW Run Mid、AW Skate Mid 以及 AWBballLo三双鞋款，分别采用针织、反绒皮等材质打造鞋面，并将深空灰、墨绿和湖蓝配色贯穿鞋面呈现。"),
	(null,"Converse 带来与Miley Cyrus 的联名系列",1508399835,0,"img/news/sm/10.jpg","img/news/md/10.jpg","潮流","adidas Originals 近日与时装设计师 Alexander Wang 再度带来了第四波新品，此次系列涵盖了 AW Run Mid、AW Skate Mid 以及 AWBballLo三双鞋款，分别采用针织、反绒皮等材质打造鞋面，并将深空灰、墨绿和湖蓝配色贯穿鞋面呈现。"),
	(null,"adidas Originals YEEZY POWERPHASE 深灰配色即将发售",1508419835,0,"img/news/sm/11.jpg","img/news/md/11.jpg","潮流 最新","据爆料帐号 @yeezyseason2 的确认，这双货号为 CG6422 的YEEZY POWERPHASE 深灰配色将于今年 12 月 9 日正式发售。采用了全灰鞋身设计，同时以侧身红色“三叶草”Logo 及烫金“CALABASAS”字样作点缀。"),
	(null,"VLONE 即将带来黑五限定系列",1508699835,0,"img/news/sm/12.jpg","img/news/md/12.jpg","潮流","为了迎接一年一度的黑色星期五，VLONE日前放出了预告，将以骷髅头为设计元素，同时辅以VLONE经典标语“LIVE ALONE，DIE ALONE”，带来包括帽衫、短袖等单品。"),
	(null,"Billionaire Boys Club 为纽约旗舰店周年带来纪念别注系列",1508799835,0,"img/news/sm/13.jpg","img/news/md/13.jpg","潮流 最新","Billionaire Boys Club 位于纽约 Soho 区的旗舰店于不久前正式迎来了开业一周年。品牌专门为其打造了一个名为“212”的别注系列作为纪念。本次的别注系列以灰色与白色为主，并使用高档 French Terry 打造，推出了搭载“212”Logo 的帽衫、运动裤、T-Shirt 等基础街头装备。"),
	(null,"Kareem 'Biggs' Burke 与 Urban Outfitters 打造 JAY Z 首张专辑纪念服饰系列",1508799835,0,"img/news/sm/14.jpg","img/news/md/14.jpg","潮流","Kareem “Biggs” Burke 日前又与 Urban Outfitters 合作，以 JAY Z 1996 年个人首张专辑《Resonable Doubt》 为主题打造了全新产品系列，其中包括 T-Shirt、帽衫、长袖 Tee 以及帽款。"),
	(null,"WEGO x FILA 打造 2017 秋冬联乘企划",1508709835,0,"img/news/sm/15.jpg","img/news/md/15.jpg","潮流 最新","Kareem “Biggs” Burke 日前又与 Urban Outfitters 合作，以 JAY Z 1996 年个人首张专辑《Resonable Doubt》 为主题打造了全新产品系列，其中包括 T-Shirt、帽衫、长袖 Tee 以及帽款。"),
	(null,"OFF-WHITE x Champion 联名单品预览",1508799835,0,"img/news/sm/16.jpg","img/news/md/16.jpg","潮流","OFF-WHITE 与Champion联名系列，日前带来了卫衣、短裤等单品，将Champion以及OFF-WHITE的标志性logo融入于衣服之中，目前已可由官网购得，感兴趣的朋友不妨点击这里购买。"),
	(null,"哦？Michael Jordan也穿上了Yeezy？",1508899835,0,"img/news/sm/17.jpg","img/news/md/17.jpg","潮流 跑步","今日，爆料账户@pinoe77 晒照并激动的称，乔丹本身上脚了Yeezy ！ 可以说是爆炸性的新闻了....
	你怎么看？可以看出他上脚的是一双Yeezy 350v2 Boost 在去年黑五期间发售的一双黑绿配色，要不要来双Michael Jordan 同款Yeezy？"),
	(null,"抢先预览！ Nike VaporMax Plus 全新“Olive”配色",1508999835,0,"img/news/sm/18.jpg","img/news/md/18.jpg","潮流 跑步","将在明年登场的 Nike Air VaporMax 全新 Plus 变奏版本已经曝光一些新配色了，且仍在继续中，此番带来全新的“Olive”配色设计。新版本将带有独特纹路的 Air Max Plus 鞋身与 Air VaporMax 招牌气垫大底相结合，营造出浓烈的复古视觉效果。加上橄榄绿的点缀，以及中足处金属配件的加持，更多了一些机能的味道。目前官方尚未透露有关这双混血新作的具体发售消息。"),
	(null,"Supreme Week 14 单品已上架球鞋指数",1508999835,0,"img/news/sm/19.jpg","img/news/md/19.jpg","潮流 达人","上周刚发售的Supreme Week 14周单品，现已可通过球鞋指数求购，如果你手里有货，不妨放在球鞋指数上进行出售，如果你想购买，也不妨在球鞋指数上求购哦。让我们拒绝套路，让买卖潮品更加的方便快捷。"),
	(null,"Supreme We“鞋子不骚我不穿”——唐斯定制球鞋精选",1509059835,0,"img/news/sm/20.jpg","img/news/md/20.jpg","篮球 达人","明尼苏达森林狼队的状元秀卡尔-安东尼-唐斯，自15年与Nike签约以来，一直代言Nike的团队篮球鞋系列，Hyperdunk 2016、Hyperdunk 2017等鞋款都曾被他多次上脚，Nike也曾为他推出了专属的PE。"),
	(null,"活力橙调 | size?独占NMD R1 “Neon Orange”配色",1509081835,0,"img/news/sm/21.jpg","img/news/md/21.jpg","跑步 健身 达人","adidas Originals 为 size?设计了一款独占配色的adidas NMD R1 ，经典的R1鞋型搭配亮丽的橙色色调，为冬日带来更多活力。鞋面采用更加厚实的织物设计，舒适柔软贴合脚面，鞋领、后跟提带、鞋带、中底色块等位置融入黑色点缀，最后搭载经典的Boost中底及黑色橡胶外底。"),
	(null,"致敬老兵！Lining Way Of Wade 6“Veterans Day”即将发售",1509181835,0,"img/news/sm/22.jpg","img/news/md/22.jpg","篮球 达人","韦德曾经在老兵节当天上脚的Way Of Wade“Veterans Day”将于近日迎来发售。该鞋由编织材质打造鞋面，绑带则依旧选用碳纤维材质。鞋身以美国国旗蓝为主调，内衬、鞋舌Wade Logo以及鞋侧Wade Logo则以红色呈现，后跟拉环注入美国国旗的条纹元素，让人过目难忘。"),
	(null,"敲响2018年，Nike Air Max 98 “Gundam”",1509281835,0,"img/news/sm/23.jpg","img/news/md/23.jpg","跑步 健身 达人","今年的 Nike Air Max 97 热潮还未退去，明年的 Nike Air Max 98 也迫不及待面世。网络曝光的全新的 Nike Air Max 98 “Gundam”配色，采用白蓝色调呈现，依旧延续复古的外形，点缀红色刺绣 Swoosh，据悉还有更多配色会陆续曝光，不知道会不会如 Nike Air Max 97 一样收获更多人气？"),
	(null,"简约不简单！Air Jordan 9“LA”全明星周末发售",1509481835,0,"img/news/sm/24.jpg","img/news/md/24.jpg","篮球 达人","此前我们已经看过了Air Jordan 9“LA”的Sample，在今日释出了该鞋的实物图。与之前释出的Sample一样，该鞋以经典的黑白配色呈现，鞋面采用白色荔枝皮与黑色麂皮打造，搭配奶白色水晶大底，简单通透。鞋子最大的亮点要数鞋垫上的洛杉矶地图，诚意十足，令人印象深刻。"),
	(null,"A Bathing APE 巴黎限定系列释出",1509681835,0,"img/news/sm/25.jpg","img/news/md/25.jpg","潮流 达人","即将于12月1日开幕的A BATHING APE 巴黎门店，日前释出 了巴黎限定系列。将法国国旗配色融入标志性 1ST CAMO 迷彩中，带来包括卫衣卫裤等一系列单品。"),
	(null,"KITH x Moncler 2017 冬季联名系列完整公开",1509981835,0,"img/news/sm/26.jpg","img/news/md/26.jpg","潮流 达人","KITH 日前带来与 Monclear 的2017冬季联名系列，带来包括夹克、羽绒服、鞋款等36件单品。"),
	(null,"北卡氛围！Air Jordan 6“UNC”细节近赏！",1510081835,0,"img/news/sm/27.jpg","img/news/md/27.jpg","潮流 达人","本周末即将迎来Air Jordan 6“UNC”的正式发售，今日，该鞋又释出一组美图，让我们一起来欣赏一下。"),
	(null,"质感至上，Saucony Shadow 6000 HT “Perf Pack”发售",1510281835,0,"img/news/sm/28.jpg","img/news/md/28.jpg","跑步 达人","近日，传统跑鞋品牌Saucony以套装 “Perf Pack”的形式发售了全新配色的 Saucony Shadow 6000 。套装包含两双，分别为白色和绿色。"),
	(null,"OVO x Timberland 6-Inch Boots 联名靴款发售日期揭晓",1510681835,0,"img/news/sm/29.jpg","img/news/md/29.jpg","潮流 达人","Timberland 日前曝光了与OVO联名的靴款，双方本次合作共带来棕色和黑色两款经典选择，设计上均采用上乘磨砂皮制作而成，同时搭载 GORE-TEX 衬里提升户外防水和保暖性能，至于鞋舌和吊牌上则是 OVO 经典的「猫头鹰」Logo。"),
	(null,"折型上管 Canyon Inflite CF SLX公路越野车",1510881835,0,"img/news/sm/30.jpg","img/news/md/30.jpg","骑行 达人","对于一些人来说，适合越野的季节已经接近，而对于任何想要购买新款CX（公路越野）车型的人来说，Canyon新推出的Inflite CF SLX就是为了满足车友对于CX的需求，它采用了山地自行车的几何形状，拥有良好的排泥性和碳纤维车架，重量是940g。"),
	(null,"小姐姐骑的摩拜单车竟是迪士尼定制款",1510891835,0,"img/news/sm/31.jpg","img/news/md/31.jpg","骑行 达人","继上个月小黄人和ofo联合搞事情之后，摩拜最近和迪士尼也来搞事情了。就在昨天，由迪士尼设计师设计的定制版摩拜单车在上海上线了。米奇和米妮，还是情侣车，我就骑个车而已，为什么要给我发狗粮啊。米妮款的车头还有大大的蝴蝶结，真是少女心爆棚啊。但是有网友表示很担心，这个蝴蝶结应该很快就会被人偷走。话说，你们觉得好看吗？我觉得小姐姐好看。"),
	(null,"创新与鸡肋并存：5大被遗忘的山地车技术",1510898835,0,"img/news/sm/32.jpg","img/news/md/32.jpg","骑行 达人","如果山地自行车技术没有不断创新，我们现在可能仍然活在鼓式刹车时代。 然而，创新路上也并非一翻风顺，每件产品都能迎合时代潮流，许多创新的山地车产品却是还未推出市场就胎死腹中。今天，我们就来聊聊5件“短命”的山地车产品。"),
	(null,"以新发型亮相 萨甘霸气回归！",1510899835,0,"img/news/sm/33.jpg","img/news/md/33.jpg","骑行 达人","在经历环法驱逐退赛风波之后，萨甘带着新发型霸气回归，带着队友一起出征了于7月29号举办的环波兰比赛，并赢得了该赛事第一个赛段的冠军。"),
	(null,"不负众望 2018款Specialized Enduro即将发布",1510989835,0,"img/news/sm/34.jpg","img/news/md/34.jpg","骑行 达人","距离2018款Specialized产品发布时间越近，保密工作自然也越难，今日来自法国的bike-magazine.com网站爆料了三辆不同配置的2018款Specialized Enduro整车效果图，并且附有详细的配置和几何等数据，而它们分别是Elite 650b 、Coil 29和Comp 650b三个型号。"),
	(null,"Giant发布新款Reign27.5山地车",1510999835,0,"img/news/sm/35.jpg","img/news/md/35.jpg","骑行 达人","作为全球销量最好的Enduro车型之一，Giant Reign在7月下旬再次迎来了更新。时至今日，Reign已经走过了漫漫13年。在上周的意大利发布会上，我们终于等到了第六代的Reign。更长，更低，不再那么激进的几何设计，这一切都预示着山地车并不是固步自封。"),
	(null,"弗鲁姆的Dogma F10和X-Light",1511009835,0,"img/news/sm/36.jpg","img/news/md/36.jpg","骑行 达人","本届环法“大表哥”弗鲁姆“黄了”。大表哥在本届环法中拥有好几辆战车，包括Pinarello Dogma F10和新的Pinarello Dogma F10 X-Light。虽然在配置和几何尺寸上是相同的，但它们之间存在一些微妙的差异。到底差异在哪呢？在环意赛事的最后一周，一些天空车队的车手首次在比赛中测试了新的Dogma F10 X-Light。顾名思义，车架与F10基本相同，但是更轻。Pinarello声称通过使用极少的树脂和较轻的Torayca T1100G UD碳布，以及新的模具工艺，将车架重量削减了60g。"),
	(null,"环法第二十一赛段：荷兰小子神奇冲刺 英国表哥四冠创史",1511029835,0,"img/news/sm/37.jpg","img/news/md/37.jpg","骑行 达人","2017年7月23日，环法第二十一赛段结束。荷兰小将格鲁内维亨（荷兰乐透）在香榭丽舍大街远距离冲刺成功，在最后一天赢得赛段冠军。弗鲁姆顺利完赛，成为环法历史上第五个至少三次赢得总冠军的车手。"),
	(null,"意式气动的胜利 Bianchi Oltre XR4",1511329835,0,"img/news/sm/38.jpg","img/news/md/38.jpg","骑行 达人","Bianchi是一个有着百余年历史的品牌，它从最初的钢管公路车到现今的全碳纤公路，一直在国际上享有非常高的声誉，它的发展可谓见证了自行车史发展。在今日的环法第17赛段上，普里莫茨·罗格利奇（Primož Roglič）骑乘着Bianchi Oltre XR4获得了赛段的胜利，有趣的是，本届环法荷兰乐透车队在大组赛上并未使用Bianchi的Specialissima公路车，全队在平路和爬坡大组赛中均使用的是意式气动战车Oltre XR4，天空车队虽然也是如此，不过那是因为Pinarello并未专门研发一款纯爬坡车。"),
	(null,"帅气骑乘黑黄配 AXMAN FALCON S3评测",1511329835,0,"img/news/sm/39.jpg","img/news/md/39.jpg","骑行 达人","本次试驾车款为AXMAN FALCON S3，与上次试乘的ENDURO C1相较起来，骑乘感受提升的相当明显，我想这就是运动车款与竞赛车款的差异，唯一不变的是AXMAN的车，总是满满满的CP值。"),
	(null,"天空车队的智能减震战车——全新K10-S发布",1511349835,0,"img/news/sm/40.jpg","img/news/md/40.jpg","骑行 达人","Pinarello每年都会在其工厂所在地意大利特雷维索举行Granfondo Pinarello长距离骑行活动，在今年的活动之前，Pinarello召集了全球范围的经销商来到特雷维索，一起骑骑车，同时看一看Pinarello将在2018年上市的全新产品。");



#评论表
CREATE TABLE comments(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(32),
	pname VARCHAR(32),
	comment VARCHAR(256),
	reply VARCHAR(256),
	item_like INT,
	liked VARCHAR(8),
	timer BIGINT,
	news_id INT,
	FOREIGN KEY(news_id) REFERENCES news(hid)
);
INSERT INTO comments VALUES
(null,"zhang","pinglunren1","你好，测试1","",5,"1",1507824835,1),
(null,"tian","pinglunren2","你好，测试2","测试回复1，测试回复2，测试回复3",5,"0",1506824835,1),
(null,"you","pinglunren3","你好，测试3","测试回复1",5,"0",1505824835,1),
(null,"ni","pinglunren1","你好，测试1","",5,"0",1504824835,2),
(null,"hao","pinglunren4","你好，测试2","测试回复1，测试回复2",5,"0",1503824835,2),
(null,"ma","pinglunren1","你好，测试3","测试回复1",5,"0",1502824835,2);
#发售日历
CREATE TABLE publish_time(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	pic VARCHAR(32),
	title VARCHAR(32),
	color VARCHAR(32),
	keyNum VARCHAR(32),
	publish_time VARCHAR(32),
	price VARCHAR(32)
);
INSERT INTO publish_time VALUES
(null,"img/shoe_publishTime/1.jpg","Air Jordan 11 “Win Like 96”","","378037-623","2017-12-9","$220"),
(null,"img/shoe_publishTime/2.jpg","Air Jordan 5 Premium “Bordeaux”","","881432-612","2017-12-14","$190"),
(null,"img/shoe_publishTime/3.jpg","Air Jordan 6 “Gatorade”","","384664-145","2017-12-16","¥1699"),
(null,"img/shoe_publishTime/4.jpg","Air Jordan 13 “Altitude”","Black/Altitude Green","414571-042","2017-12-21","$190"),
(null,"img/shoe_publishTime/5.jpg","Air Jordan 6 “UNC”","Black/Altitude Green","384664-006","2017-12-23","$190"),
(null,"img/shoe_publishTime/6.jpg","Air Jordan 1 Gatorade “Blue Lagoon”","AJ5997-455","384664-006","2017-12-26","$170"),
(null,"img/shoe_publishTime/7.jpg","Nike Air Foamposite One PRM “Abalone”","575420-009","384664-006","2018-1-1","$230");
#实战测评
-- CREATE TABLE test_report(
-- 	tid INT PRIMARY KEY AUTO_INCREMENT,
-- 	title VARCHAR(64),
-- 	publish_time VARCHAR(64),
-- 	score DECIMAL(3,1),
-- 	md VARCHAR(128)
-- );
#新闻资讯
-- CREATE TABLE shoe_news(
-- 	nid INT PRIMARY KEY AUTO_INCREMENT,
-- 	title VARCHAR(64),
-- 	publish_time VARCHAR(64),
-- 	sm VARCHAR(128),
-- 	md VARCHAR(128)
-- )


#用户信息表
CREATE TABLE shoe_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(32),
	upwd VARCHAR(32),
	expire ENUM('0','1') DEFAULT '0'
);

CREATE TABLE shopping_products(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(64),
	title VARCHAR(128),
	price DECIMAL(10,2),
	saleStyle VARCHAR(16),
	style VARCHAR(32),
	label VARCHAR(128),
	size VARCHAR(32),
	color VARCHAR(8),
	detail VARCHAR(128),
	expire enum('0','1'),
	v1 INT,
	v2 VARCHAR(255)
);

INSERT INTO shopping_products VALUES
(null,"img/shoes/md/s1.jpg","Air Jordan 1 Flyknit “Banned” AJ1乔1黑红 919702-919704-001",650,"自营","篮球鞋,AJ1,Air Jordan,经典复刻,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","黑红","img/shoes/s1.jpg",'0',0,''),
(null,"img/shoes/md/s2.jpg","Air Jordan 5 “Blue Suede” AJ5蓝麂皮 136027-401 440888-401",650,"自营","篮球鞋,AJ5,Air Jordan,经典复刻,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","宝蓝","img/shoes/s2.jpg",'0',0,''),
(null,"img/shoes/md/s3.jpg","Air Jordan 13 Playoffs AJ13 季后赛 新黑红 414571-004",650,"自营","篮球鞋,AJ13,Air Jordan,经典复刻,顶级装备,贵族","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","黑红","img/shoes/s3.jpg",'0',0,''),
(null,"img/shoes/md/s4.jpg","Air Jordan 1 OG Quai 54 AJ1 街球黑红黑蓝鸳鸯 AH1040-054",650,"自营","篮球鞋,AJ1,Air Jordan,经典复刻,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","鸳鸯配色","img/shoes/s4.jpg",'0',0,''),
(null,"img/shoes/md/s5.jpg","Air Jordan XXX1“ Why Not ” AJ30.5威少 爆裂纹 AA9794-003",650,"自营","篮球鞋,AJ,Air Jordan,经典复刻,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","爆裂纹","img/shoes/s5.jpg",'0',0,''),
(null,"img/shoes/md/s6.jpg","Nike Air Foamposite Pro 银绿泡 南海岸泡 624041-303",650,"自营","篮球鞋,AJ,Air Jordan,经典复刻,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","银绿","img/shoes/s6.jpg",'0',0,''),
(null,"img/shoes/md/s7.jpg","Air Jordan 5 AJ5 乔5 白水泥 篮球鞋 136027-104",650,"自营","篮球鞋,AJ5,Air Jordan,经典复刻,顶级装备,贵族","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","白灰","img/shoes/s7.jpg",'0',0,''),
(null,"img/shoes/md/s8.jpg","Air Jordan1 闪电 蓝白 332550-400",650,"自营","篮球鞋,AJ1,Air Jordan,经典复刻,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","蓝白","img/shoes/s8.jpg",'0',0,''),
(null,"img/shoes/md/s9.jpg","Air Jordan 1 Retro High 伯爵 332550-024",650,"自营","篮球鞋,AJ1,Air Jordan,经典复刻,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","伯爵","img/shoes/s9.jpg",'0',0,''),
(null,"img/shoes/md/s10.jpg","Air Jordan 4 Pure Money 纯白 308497-100",650,"自营","篮球鞋,AJ4,Air Jordan,经典复刻,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","纯白","img/shoes/s10.jpg",'0',0,''),
(null,"img/shoes/md/s11.jpg","Air Jordan Super.Fly 2017 React 921203-104",650,"自营","篮球鞋,AJ,Air Jordan,经典复刻,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","白红","img/shoes/s11.jpg",'0',0,''),
(null,"img/shoes/md/s12.jpg","Nike LeBron Soldier XI 战士11 黑红 897645-002",650,"自营","篮球鞋,NIKE,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","黑红","img/shoes/s12.jpg",'0',0,''),
(null,"img/shoes/md/s13.jpg","Air Jordan 12 “CNY” 黑白 881427-122",650,"自营","篮球鞋,NIKE,顶级装备,篮球鞋,AJ12,Air Jordan","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","黑白","img/shoes/s13.jpg",'0',0,''),
(null,"img/shoes/md/s14.jpg","Nike Kyrie 3 欧文3 白银 852396-103",650,"自营","篮球鞋,NIKE,欧文,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","白银","img/shoes/s14.jpg",'0',0,''),
(null,"img/shoes/md/s15.jpg","Nike Kyrie3 Flip The Switch 梦幻黑蓝断勾 852396-003",650,"自营","篮球鞋,NIKE,欧文,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","黑红","img/shoes/s15.jpg",'0',0,''),
(null,"img/shoes/md/s16.jpg","Air Jordan XXX1 “Chicago” 845037-600",650,"自营","篮球鞋,篮球鞋,AJ,Air Jordan,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","黑红","img/shoes/s16.jpg",'0',0,''),
(null,"img/shoes/md/s17.jpg","Air Jordan 11 “72-10” 大魔王配色 378037-002",650,"自营","篮球鞋,篮球鞋,AJ11,Air Jordan,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","黑白","img/shoes/s17.jpg",'0',0,''),
(null,"img/shoes/md/s18.jpg","Nike Zoom KD10 白色 897816-100",650,"自营","篮球鞋,KD,NIKE","#新品上架 #篮球鞋 #Air Jordan,顶级装备","40,41,42,43,44","白色 ","img/shoes/s18.jpg",'0',0,''),
(null,"img/shoes/md/s19.jpg","限时秒杀！Nike Air Foamposite One “Copper” 314996-007",650,"自营","篮球鞋,喷炮,NIKE,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","铜色","img/shoes/s19.jpg",'0',0,''),
(null,"img/shoes/md/s20.jpg","限时秒杀！Nike Zoom KD9 黑武士 844382-001",650,"自营","篮球鞋,KD,NIKE,顶级装备,贵族","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","黑色","img/shoes/s20.jpg",'0',0,''),
(null,"img/shoes/md/s21.jpg","Air Jordan 32 AJ32 禁穿黑红 AH3348-001",650,"自营","篮球鞋,AJ32,NIKE,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","黑红","img/shoes/s21.jpg",'0',0,''),
(null,"img/shoes/md/s22.jpg","Nike Kyrie 3 “Aqua” Tiffany绿 852396-401",650,"自营","篮球鞋,欧文,NIKE,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","Tiffany绿","img/shoes/s22.jpg",'0',0,''),
(null,"img/shoes/md/s23.jpg","Nike Kyrie 3 白金 852396-902",650,"自营","篮球鞋,欧文,NIKE,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","白金","img/shoes/s23.jpg",'0',0,''),
(null,"img/shoes/md/s24.jpg","Nike PG 1 黑白 贝多芬 保罗乔治1代 篮球鞋 878628-100",650,"自营","篮球鞋,乔治,PG,NIKE,顶级装备,贵族","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","黑白","img/shoes/s24.jpg",'0',0,''),
(null,"img/shoes/md/s25.jpg","Air Jordan 5 Camo AJ5 军事 迷彩 136027-051",650,"自营","篮球鞋,AJ5,NIKE,顶级装备,贵族","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","迷彩","img/shoes/s25.jpg",'0',0,''),
(null,"img/shoes/md/s26.jpg","Nike PG1 Flip the Switch 断勾 878627-003",650,"自营","篮球鞋,乔治,PG,NIKE,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","黑蓝配色","img/shoes/s26.jpg",'0',0,''),
(null,"img/shoes/md/s27.jpg","Air Jordan 13 GS Bordeaux AJ13 波尔多酒红 439358-112",650,"自营","篮球鞋,AJ13,NIKE,顶级装备","#新品上架 #篮球鞋 #Air Jordan","40,41,42,43,44","酒红","img/shoes/s27.jpg",'0',0,''),
(null,"img/shoes/md/s28.jpg","Adidas阿迪达斯男鞋罗斯DOMINATE III战靴实战篮球鞋CQ0727",650,"自营","篮球鞋,Adidas,阿迪","#新品上架 #篮球鞋 #Adidas","40,41,42,43,44","黑金","img/shoes/s28.jpg",'0',0,''),
(null,"img/shoes/md/s29.jpg","Air Jordan 1 Mid AJ1 男子 军绿麂皮篮球鞋 554724-302",650,"自营","篮球鞋,AJ1","#新品上架 #篮球鞋 #NIKE #Air Jordan","40,41,42,43,44","军绿色","img/shoes/s29.jpg",'0',0,''),
(null,"img/shoes/md/s30.jpg","预售！Air Jordan 11 Low IE AJ11 低帮 白红 919712-101",650,"自营","篮球鞋,AJ11,顶级装备,贵族","#新品上架 #篮球鞋 #NIKE #Air Jordan","40,41,42,43,44","白红","img/shoes/s30.jpg",'0',0,''),
(null,"img/shoes/md/s31.jpg","Nike Kobe AD NXT 黑白 882049-007",650,"自营","篮球鞋,KB","#新品上架 #篮球鞋 #NIKE #实战","40,41,42,43,44","黑白","img/shoes/s31.jpg",'0',0,''),
(null,"img/shoes/md/s32.jpg","Air Jordan 1 Retro High “Space Jam” AJ1 黑漆皮 332550-017",650,"自营","篮球鞋,AJ1,顶级装备","#新品上架 #篮球鞋 #NIKE #实战","40,41,42,43,44","黒漆皮","img/shoes/s32.jpg",'0',0,''),
(null,"img/shoes/md/s33.jpg","Air Jordan 11 Low GS “Blue Moon” 蓝月 580521-408",650,"自营","篮球鞋,AJ11,顶级装备,贵族","#新品上架 #篮球鞋 #NIKE #实战","40,41,42,43,44","蓝色","img/shoes/s33.jpg",'0',0,''),
(null,"img/shoes/md/s34.jpg","Air Jordan 1 “All-Star” 907958-015 907959-015",650,"自营","篮球鞋,AJ1,顶级装备","#新品上架 #篮球鞋 #NIKE #实战","40,41,42,43,44","变色龙","img/shoes/s34.jpg",'0',0,''),
(null,"img/shoes/md/s35.jpg","Air Jordan XXXI 848629-905847-004",650,"自营","篮球鞋,AJ,顶级装备","#新品上架 #篮球鞋 #NIKE #实战","40,41,42,43,44","多彩","img/shoes/s35.jpg",'0',0,''),
(null,"img/shoes/md/s36.jpg","Nike Air Foamposite Pro 末日博士泡 644792-006",650,"自营","篮球鞋,喷泡,顶级装备","#新品上架 #篮球鞋 #NIKE #实战","40,41,42,43,44","黑白","img/shoes/s36.jpg",'0',0,''),



(null,"img/shoes/md/medium_TB2Fe7IcfBNTKJjSszeXXcu2VXa___198328076.jpg","Nike Air Foamposite Pro “Metallic Gold” 液态金泡 金喷泡 624041-701",899.00,"自营","篮球,热门,贵族","#NIKE #新品上架 #篮球鞋","40,41,42,43,44","黑金","img/shoes/zcZAxRGqVhU5fuT-xgBn_image_wh_601x357.jpg",'0',0,''),

(null,"img/shoes/md/medium_TB3.jpg","预售！超限量！Adidas Yeezy 350 Boost V2 “Yebra”黄斑马 侃爷椰子跑鞋 B37572",599.00,"自营","篮球","#Adidas #休闲鞋 #限量预售","40,41,42,43,44","黄斑马","img/shoes/2HhsC3L8rHy3MLnjXwuV_image_wh_724x254.jpg",'0',0,''),

(null,"img/shoes/md/medium_1_-___ (3).jpg","预售！Air Jordan 1 High Wheat 小麦 高帮 麂皮 555088-710",650.00,"自营","篮球,贵族","#Air Jordan #篮球鞋","40,41,42,43,44","小麦色","img/shoes/zcZAxRGqVhU5fuT-xgBn_imawh_601x357.jpg",'0',0,''),

(null,"img/shoes/md/medium_4_-___.jpg","预售！Air Jordan 11 AJ11 大红 高帮 378037-623",650.00,"自营","篮球,热门","#Air Jordan #篮球鞋","40,41,42,43,44","大红","img/shoes/zcZAxRGqVhU5fuT-xgBn_image3_wh_601x357.jpg",'0',0,''),

(null,"img/shoes/md/medium_1.jpg","Air Jordan 12 Bordeaux AJ12 波尔多 酒红 130690-617",750.00,"自营","篮球","#新品上架 #Air Jordan #篮球鞋","40,41,42,43,44","酒红","img/shoes/zcZAxRGqVhU5fuT-xgBn_image5_wh_601x357.jpg",'0',0,''),

(null,"img/shoes/md/medium_JORDAN-ECLIPSE-378037_123_A_PREM.jpg","Air Jordan 11 AJ11 午夜蓝 白蓝 高帮 378037-123",650.00,"自营","篮球,贵族","#Air Jordan #篮球鞋","40,41,42,43,44","白蓝","img/shoes/zcZAxRGqVhU5fuT-xgBn_image6_wh_601x357 (1).jpg",'0',0,''),

(null,"img/shoes/md/medium_TB2wVOyXfnW1eJjSZFqXXa8sVXa___927791264.jpg","Air Jordan 6 Gatorade AJ6 佳得乐 384664-384665-145",650.00,"自营","篮球,贵族","#Air Jordan #篮球鞋","40,41,42,43,44","白橙","img/shoes/zcZAxRGqVhU5fuT-xgBn_image7_wh_601x357.jpg",'0',0,''),

(null,"img/shoes/md/medium_air-jordan-31-E794B7E5AD90E7AFAEE79083E9.jpg","Nike Zoom KD9 黑武士 844382-001",450.00,"自营","篮球,热门,贵族","#实战利器 #篮球鞋 #场地实战 #NIKE","40,41,42,43,44","黑色","img/shoes/zcZAxRGqVhU5fuT-xgBn_image8_wh_601x357.jpg",'0',0,''),

(null,"img/shoes/md/medium_medium_1_-___.jpg","Nike VaporMax 奥利奥 铜勾 大气垫 849558-010",750.00,"自营","跑步","#新品上架 #跑步鞋 #NIKE","40,41,42,43,44","黑白灰","img/shoes/zcZAxRGqVhU5fuT-xgBn_image9_wh_601x357.jpg",'0',0,''),

(null,"img/shoes/md/medium_1_-___ (2).jpg","Adidas NMD R1 Boost 樱花粉 BY9952",450.00,"自营","跑步","#新品上架 #跑步鞋 #Adidas #热销","40,41,42,43,44","白粉","img/shoes/pgysvFRf62WFq5eQJZSN_image10_wh_700x500.jpg",'0',0,''),

(null,"img/shoes/md/medium_1_-___.jpg","Nike VaporMax 白蓝 铜勾 大气垫 849557-104",650.00,"自营","跑步,贵族","#新品上架 #跑步鞋 #NIKE #热销","40,41,42,43,44","白蓝","img/shoes/zcZAxRGqVhU5fuT-xgBn_image11_wh_601x357.jpg",'0',0,''),

(null,"img/shoes/md/medium_TB4.jpg","Adidas Ultra Boost 3.0 黑白 BA8842",450.00,"自营","跑步","#新品上架 #跑步鞋 #Adidas #热销 #夏天怎么穿才型","40,41,42,43,44","黑白","img/shoes/2HhsC3L8rHy3MLnjXwuV_image12_wh_724x254.jpg",'0',0,''),

(null,"img/shoes/md/medium_TB20eXPBypnpuFjSZFkXXc4ZpXa___2638827950.jpg","Adidas NMD R2 BOOST 黑红 CG3384",450.00,"自营","跑步,贵族","#新品上架 #跑步鞋 #Adidas #热销 #夏天怎么穿才型","40,41,42,43,44","黑红","img/shoes/2HhsC3L8rHy3MLnjXwuV_image13_wh_724x254.jpg",'0',0,''),

(null,"img/shoes/md/medium_5_-___.jpg","Nike Air Max 97 OG 粉蛇 粉子弹 粉色气垫跑鞋 917646-600",650.00,"自营","跑步,贵族","#新品上架 #跑步鞋 #Nike #热销","36,37,38","粉色","img/shoes/zcZAxRGqVhU5fuT-xgBn_image14_wh_601x357 (1).jpg",'0',0,''),
 
(null,"img/cloth/md/medium_1__.jpg","JOESPIRIT All Season Pullover Hoodie 透气高弹功能连帽四季卫衣W22",268,"自营","热门,休闲","#新品上架","170,175,180,185","黑色,米色,灰色","img/cloth/sBLFs-nseCgRGMzvs7ww_image1_wh_808x253.jpg",'0',0,''),
(null,"img/cloth/md/medium____-2.jpg","JOESPIRIT oversize hoodies 落肩特殊毛圈质感做旧百搭卫衫H903",268,"自营","热门,休闲","#新品上架","170,175,180,185","黑色,卡其色,灰色","img/cloth/3sdtnNFz88aznNHWz31t_image2_wh_747x321.jpg",'0',0,''),
(null,"img/cloth/md/medium_3____2_.jpg","All Season Pullover Hoodie 透气高弹字母连帽四季卫衣W23",268,"自营","热门,休闲","#新品上架","170,175,180,185","黑色,米色,军绿","img/cloth/M94N6-gcUN-pazvPuNvP_image3_wh_825x264.jpg",'0',0,''),
(null,"img/shoes/md/n1.jpg","Adidas NMD R2 PK 白斑点 BY2245",450,"自营","休闲鞋,Adidas
	,NMD","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n1.jpg",'0',0,''),
(null,"img/shoes/md/n2.jpg","Adidas NMD City Sock PK Core Black 黑白羊毛 BB0679",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n2.jpg",'0',0,''),
(null,"img/shoes/md/n3.jpg","Adidas NMD R1 黑灰白 BB2884",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n3.jpg",'0',0,''),
(null,"img/shoes/md/n4.jpg","Adidas NMD Boost 黑蓝麂皮 S75230",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n4.jpg",'0',0,''),
(null,"img/shoes/md/n5.jpg","Adidas NMD City Sock 2 蓝波点 BA7212",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n5.jpg",'0',0,''),
(null,"img/shoes/md/n6.jpg","Adidas NMD R1 Boost 奥利奥 灰雪花 BY3035",450,"自营","休闲鞋,Adidas
	,NMD","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n6.jpg",'0',0,''),
(null,"img/shoes/md/n7.jpg","Adidas NMD Primeknit Boost 黑白配色 BA8629",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n7.jpg",'0',0,''),
(null,"img/shoes/md/n8.jpg","Adidas NMD XR1 白迷彩 BA7233",450,"自营","休闲鞋,Adidas,NMD,贵族","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n8.jpg",'0',0,''),
(null,"img/shoes/md/n9.jpg","Adidas NMD Primeknit Boost 纯白配色 BA8630",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n9.jpg",'0',0,''),
(null,"img/shoes/md/n10.jpg","Adidas NMD Boost 东京配色 S75338 S79162",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n10.jpg",'0',0,''),
(null,"img/shoes/md/n11.jpg","Adidas NMD R2 PK 海军蓝 BB2952",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n11.jpg",'0',0,''),
(null,"img/shoes/md/n12.jpg","Adidas NMD R2 PK 白红 BA7253",450,"自营","休闲鞋,Adidas,NMD,贵族","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n12.jpg",'0',0,''),
(null,"img/shoes/md/n13.jpg","Adidas NMD R2 PK 蓝白波点 BA7560",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n13.jpg",'0',0,''),
(null,"img/shoes/md/n14.jpg","Adidas NMD R1 Bedwin 黑白 BB3124",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n14.jpg",'0',0,''),
(null,"img/shoes/md/n15.jpg","Adidas NMD R1 “Tri-Color” 黑色法国 BB2887",450,"自营","休闲鞋,Adidas,NMD,贵族","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n15.jpg",'0',0,''),
(null,"img/shoes/md/n16.jpg","断码特惠！Adidas NMD XR1 黑灰 S32215",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n16.jpg",'0',0,''),
(null,"img/shoes/md/n17.jpg","Adidas NMD Boost 黑粉配色 S75234",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n17.jpg",'0',0,''),

(null,"img/shoes/md/n18.jpg","Adidas NMD R1 Bedwin 灰白 BB3123",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n18.jpg",'0',0,''),


(null,"img/shoes/md/n19.jpg","Packer Shoes x Adidas NMD R1 Primeknit 彩色巡游 BB5051",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NMD","40,41,42,43,44","黑白","img/shoes/n19.jpg",'0',0,''),
(null,"img/shoes/md/n20.jpg","Adidas NMD Boost 纽约配色 S75339",450,"自营","休闲鞋,Adidas,NMD,贵族","#新品上架 #adidas #NMD","40,41,42,43,44","黑白","img/shoes/n20.jpg",'0',0,''),
(null,"img/shoes/md/n21.jpg","Adidas NMD XR1 白灰迷彩 S32216",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NMD","40,41,42,43,44","黑白","img/shoes/n21.jpg",'0',0,''),
(null,"img/shoes/md/n22.jpg","Adidas Iniki boost 浅蓝色 BA2099",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NIKE #NMD","40,41,42,43,44","黑白","img/shoes/n22.jpg",'0',0,''),
(null,"img/shoes/md/n23.jpg","Adidas Iniki boost 橙色 BA9998",450,"自营","休闲鞋,Adidas,NMD,贵族","#新品上架 #adidas #NMD","40,41,42,43,44","黑白","img/shoes/n23.jpg",'0',0,''),

(null,"img/shoes/md/n24.jpg","Adidas Iniki boost 粉色 BA9999",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NMD","40,41,42,43,44","黑白","img/shoes/n24.jpg",'0',0,''),
(null,"img/shoes/md/n25.jpg","Adidas Ultra Boost Uncaged PK 黑色 BB3900 BB3904",450,"自营","休闲鞋,Adidas,NMD,贵族","#新品上架 #adidas  #NMD","40,41,42,43,44","黑白","img/shoes/n25.jpg",'0',0,''),
(null,"img/shoes/md/n26.jpg","Adidas NMD Boost Chukka 原色 S79148",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NMD","40,41,42,43,44","黑白","img/shoes/n26.jpg",'0',0,''),
(null,"img/shoes/md/n27.jpg","Adidas NMD Boost 莫斯科配色 S75487 S79160",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NMD","40,41,42,43,44","黑白","img/shoes/n27.jpg",'0',0,''),
(null,"img/shoes/md/n28.jpg","Adidas NMD Boost 原色 S79168",450,"自营","休闲鞋,Adidas,NMD","#新品上架 #adidas #NMD","40,41,42,43,44","黑白","img/shoes/n28.jpg",'0',0,''),
(null,"img/shoes/md/b1.jpg","Adidas Y-3 Qasa High 白武士 AQ5500",980,"自营","休闲鞋,Adidas,NMD,百搭利器","#新品上架 #adidas #NMD","40,41,42,43,44","白色","img/shoes/b1.jpg",'0',0,''),
(null,"img/shoes/md/b2.jpg","Air Jordan 1 OG GS High “Banned” 禁穿配色 575441-001",980,"自营","休闲鞋,AJ,篮球,百搭利器,贵族","#新品上架 #NIKE #AJ","40,41,42,43,44","黑红","img/shoes/b2.jpg",'0',0,''),
(null,"img/shoes/md/b3.jpg","Adidas TUBULAR RADIAL 黑武士 S80115",980,"自营","休闲鞋,Adidas,休闲,百搭利器,贵族","#新品上架 #Adidas #休闲鞋","40,41,42,43,44","黑色","img/shoes/b3.jpg",'0',0,''),
(null,"img/shoes/md/b4.jpg","Nike Kaishi 2.0 黑白 833411-010",980,"自营","跑步鞋,休闲鞋,Nike,休闲,百搭利器","#新品上架 #NIKE #休闲鞋","40,41,42,43,44","黑白","img/shoes/b4.jpg",'0',0,''),
(null,"img/shoes/md/b5.jpg","Adidas Superstar 纯白金属贝壳头 女 s76540",599,"自营","板鞋,休闲鞋,Adidas,休闲,百搭利器,贵族","#新品上架 #Adidas #休闲鞋","36,37,38,39,40","白色","img/shoes/b5.jpg",'0',0,''),
(null,"img/shoes/md/b6.jpg","ENSHADOWER隐蔽者反光印花CITYSHADOW夜跑打底裤",599,"自营","潮流,休闲,百搭利器","#裤子 #百搭利器 #秋冬新品","36,37,38,39,40","白色","img/shoes/65.jpg",'0',0,'');


#产品详情
CREATE TABLE product_pic(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	sm VARCHAR(128),
	fid INT,
	FOREIGN KEY(fid) REFERENCES shopping_products(sid)
);
INSERT INTO product_pic VALUES
(null,"img/shoes/sm/11.jpg",1),
(null,"img/shoes/sm/12.jpg",1),
(null,"img/shoes/sm/13.jpg",1),
(null,"img/shoes/sm/14.jpg",1),
(null,"img/shoes/sm/21.jpg",2),
(null,"img/shoes/sm/22.jpg",2),
(null,"img/shoes/sm/23.jpg",2),
(null,"img/shoes/sm/24.jpg",2),
(null,"img/shoes/sm/31.jpg",3),
(null,"img/shoes/sm/32.jpg",3),
(null,"img/shoes/sm/33.jpg",3),
(null,"img/shoes/sm/41.jpg",4),
(null,"img/shoes/sm/41.jpg",4),
(null,"img/shoes/sm/42.jpg",4),
(null,"img/shoes/sm/43.jpg",4),
(null,"img/shoes/sm/44.jpg",4),
(null,"img/shoes/sm/51.jpg",5),
(null,"img/shoes/sm/52.jpg",5),
(null,"img/shoes/sm/53.jpg",5),
(null,"img/shoes/sm/61.jpg",6),
(null,"img/shoes/sm/62.jpg",6),
(null,"img/shoes/sm/63.jpg",6),
(null,"img/shoes/sm/64.jpg",6),
(null,"img/shoes/sm/71.jpg",7),
(null,"img/shoes/sm/72.jpg",7),
(null,"img/shoes/sm/73.jpg",7),
(null,"img/shoes/sm/74.jpg",7),
(null,"img/shoes/sm/75.jpg",7),
(null,"img/shoes/sm/81.jpg",8),
(null,"img/shoes/sm/82.jpg",8),
(null,"img/shoes/sm/83.jpg",8),
(null,"img/shoes/sm/84.jpg",8),
(null,"img/shoes/sm/91.jpg",9),
(null,"img/shoes/sm/92.jpg",9),
(null,"img/shoes/sm/93.jpg",9),
(null,"img/shoes/sm/94.jpg",9),
(null,"img/shoes/sm/95.jpg",9),
(null,"img/shoes/sm/101.jpg",10),
(null,"img/shoes/sm/102.jpg",10),
(null,"img/shoes/sm/103.jpg",10),
(null,"img/shoes/sm/104.jpg",10),
(null,"img/shoes/sm/111.jpg",11),
(null,"img/shoes/sm/112.jpg",11),
(null,"img/shoes/sm/113.jpg",11),
(null,"img/shoes/sm/114.jpg",11),
(null,"img/shoes/sm/121.jpg",12),
(null,"img/shoes/sm/122.jpg",12),
(null,"img/shoes/sm/123.jpg",12),
(null,"img/shoes/sm/124.jpg",12),
(null,"img/shoes/sm/131.jpg",13),
(null,"img/shoes/sm/132.jpg",13),
(null,"img/shoes/sm/133.jpg",13),
(null,"img/shoes/sm/134.jpg",13),
(null,"img/shoes/sm/135.jpg",13),
(null,"img/shoes/sm/141.jpg",14),
(null,"img/shoes/sm/141.jpg",14),
(null,"img/shoes/sm/142.jpg",14),
(null,"img/shoes/sm/143.jpg",14),
(null,"img/shoes/sm/144.jpg",14),
(null,"img/shoes/sm/151.jpg",15),
(null,"img/shoes/sm/152.jpg",15),
(null,"img/shoes/sm/153.jpg",15),
(null,"img/shoes/sm/154.jpg",15),
(null,"img/shoes/sm/161.jpg",16),
(null,"img/shoes/sm/162.jpg",16),
(null,"img/shoes/sm/163.jpg",16),
(null,"img/shoes/sm/171.jpg",17),
(null,"img/shoes/sm/172.jpg",17),
(null,"img/shoes/sm/173.jpg",17),
(null,"img/shoes/sm/174.jpg",17),
(null,"img/shoes/sm/181.jpg",18),
(null,"img/shoes/sm/182.jpg",18),
(null,"img/shoes/sm/183.jpg",18),
(null,"img/shoes/sm/184.jpg",18),
(null,"img/shoes/sm/191.jpg",19),
(null,"img/shoes/sm/192.jpg",19),
(null,"img/shoes/sm/193.jpg",19),
(null,"img/shoes/sm/194.jpg",19),
(null,"img/shoes/sm/201.jpg",20),
(null,"img/shoes/sm/202.jpg",20),
(null,"img/shoes/sm/211.jpg",21),
(null,"img/shoes/sm/212.jpg",21),
(null,"img/shoes/sm/213.jpg",21),
(null,"img/shoes/sm/214.jpg",21),
(null,"img/shoes/sm/221.jpg",22),
(null,"img/shoes/sm/222.jpg",22),
(null,"img/shoes/sm/223.jpg",22),
(null,"img/shoes/sm/224.jpg",22),
(null,"img/shoes/sm/225.jpg",22),
(null,"img/shoes/sm/231.jpg",23),
(null,"img/shoes/sm/232.jpg",23),
(null,"img/shoes/sm/233.jpg",23),
(null,"img/shoes/sm/234.jpg",23),
(null,"img/shoes/sm/241.jpg",24),
(null,"img/shoes/sm/242.jpg",24),
(null,"img/shoes/sm/243.jpg",24),
(null,"img/shoes/sm/244.jpg",24),
(null,"img/shoes/sm/251.jpg",25),
(null,"img/shoes/sm/252.jpg",25),
(null,"img/shoes/sm/253.jpg",25),
(null,"img/shoes/sm/254.jpg",25),
(null,"img/shoes/sm/261.jpg",26),
(null,"img/shoes/sm/262.jpg",26),
(null,"img/shoes/sm/263.jpg",26),
(null,"img/shoes/sm/264.jpg",26),
(null,"img/shoes/sm/271.jpg",27),
(null,"img/shoes/sm/272.jpg",27),
(null,"img/shoes/sm/273.jpg",27),
(null,"img/shoes/sm/274.jpg",27),
(null,"img/shoes/sm/281.jpg",28),
(null,"img/shoes/sm/282.jpg",28),
(null,"img/shoes/sm/283.jpg",28),
(null,"img/shoes/sm/284.jpg",28),
(null,"img/shoes/sm/291.jpg",29),
(null,"img/shoes/sm/292.jpg",29),
(null,"img/shoes/sm/293.jpg",29),
(null,"img/shoes/sm/294.jpg",29),
(null,"img/shoes/sm/301.jpg",30),
(null,"img/shoes/sm/302.jpg",30),
(null,"img/shoes/sm/303.jpg",30),
(null,"img/shoes/sm/304.jpg",30),
(null,"img/shoes/sm/311.jpg",31),
(null,"img/shoes/sm/312.jpg",31),
(null,"img/shoes/sm/313.jpg",31),
(null,"img/shoes/sm/314.jpg",31),
(null,"img/shoes/sm/321.jpg",32),
(null,"img/shoes/sm/322.jpg",32),
(null,"img/shoes/sm/323.jpg",32),
(null,"img/shoes/sm/324.jpg",32),
(null,"img/shoes/sm/331.jpg",33),
(null,"img/shoes/sm/332.jpg",33),
(null,"img/shoes/sm/333.jpg",33),
(null,"img/shoes/sm/334.jpg",33),
(null,"img/shoes/sm/341.jpg",34),
(null,"img/shoes/sm/342.jpg",34),
(null,"img/shoes/sm/343.jpg",34),
(null,"img/shoes/sm/344.jpg",34),
(null,"img/shoes/sm/351.jpg",35),
(null,"img/shoes/sm/352.jpg",35),
(null,"img/shoes/sm/353.jpg",35),
(null,"img/shoes/sm/354.jpg",35),
(null,"img/shoes/sm/361.jpg",36),
(null,"img/shoes/sm/362.jpg",36),
(null,"img/shoes/sm/363.jpg",36),
(null,"img/shoes/sm/364.jpg",36),
(null,"img/shoes/md/medium_TB2Fe7IcfBNTKJjSszeXXcu2VXa___198328076.jpg",37),
(null,"img/shoes/sm/TKJsAtPp45PTF2asm_t2_image_wh_620x440.jpg",37),
(null,"img/shoes/sm/UTmStybdUrYn-gqfJCv9_image_wh_620x440.jpg",37),
(null,"img/shoes/sm/yKBFj8Tt5Y2jL2r8t7Ks_image_wh_620x440.jpg",37),
(null,"img/shoes/sm/dR6JzvezHKdixUTBsB5H_image_wh_620x440.jpg",37),
(null,"img/shoes/sm/2-1.jpg",38),
(null,"img/shoes/sm/2-2.jpg",38),
(null,"img/shoes/sm/2-3.jpg",38),
(null,"img/shoes/sm/2-4.jpg",38),
(null,"img/shoes/md/medium_1_-___ (3).jpg",39),
(null,"img/shoes/sm/Sfnm6yxDyxAKpLXx2AE5_image_wh_700x500.jpg",39),
(null,"img/shoes/sm/WjX23uCKMiQo2ruD4zgo_image_wh_700x500.jpg",39),
(null,"img/shoes/sm/cg_SL9aj-uCR1zaUFvpQ_image_wh_700x500.jpg",39),
(null,"img/shoes/sm/1.jpg",40),
(null,"img/shoes/sm/2.jpg",40),
(null,"img/shoes/sm/3.jpg",40),
(null,"img/shoes/sm/4.jpg",40),
(null,"img/shoes/sm/5-1.jpg",41),
(null,"img/shoes/sm/5-2.jpg",41),
(null,"img/shoes/sm/5-3.jpg",41),
(null,"img/shoes/sm/5-4.jpg",41),
(null,"img/shoes/sm/5-5.jpg",41),
(null,"img/shoes/sm/5-6.jpg",41),
(null,"img/shoes/sm/6-1.jpg",42),
(null,"img/shoes/sm/6-2.jpg",42),
(null,"img/shoes/sm/6-3.jpg",42),
(null,"img/shoes/sm/6-4.jpg",42),
(null,"img/shoes/sm/6-5.jpg",42),
(null,"",43),
(null,"img/shoes/sm/8-1.jpg",44),
(null,"img/shoes/sm/8-2.jpg",44),
(null,"img/shoes/sm/8-3.jpg",44),
(null,"img/shoes/sm/8-4.jpg",44),
(null,"img/shoes/sm/8-5.jpg",44),
(null,"img/shoes/sm/9-1.jpg",45),
(null,"img/shoes/sm/9-2.jpg",45),
(null,"img/shoes/sm/9-3.jpg",45),
(null,"img/shoes/sm/9-4.jpg",45),
(null,"img/shoes/sm/9-5.jpg",45),
(null,"img/shoes/sm/10-1.jpg",46),
(null,"img/shoes/sm/10-2.jpg",46),
(null,"img/shoes/sm/10-3.jpg",46),
(null,"img/shoes/sm/10-4.jpg",46),
(null,"img/shoes/sm/11-1.jpg",47),
(null,"img/shoes/sm/11-2.jpg",47),
(null,"img/shoes/sm/11-3.jpg",47),
(null,"img/shoes/sm/11-4.jpg",47),
(null,"img/shoes/sm/11-5.jpg",47),
(null,"img/shoes/sm/12-1.jpg",48),
(null,"img/shoes/sm/12-2.jpg",48),
(null,"img/shoes/sm/12-3.jpg",48),
(null,"img/shoes/sm/12-4.jpg",48),
(null,"img/shoes/sm/13-1.jpg",49),
(null,"img/shoes/sm/13-2.jpg",49),
(null,"img/shoes/sm/13-3.jpg",49),
(null,"img/shoes/sm/13-4.jpg",49),
(null,"img/shoes/sm/13-5.jpg",49),
(null,"img/shoes/sm/14-1.jpg",50),
(null,"img/shoes/sm/14-2.jpg",50),
(null,"img/shoes/sm/14-3.jpg",50),
(null,"img/shoes/sm/14-4.jpg",50),
(null,"img/shoes/sm/14-5.jpg",50),
(null,"img/shoes/sm/15-1.jpg",51),
(null,"img/shoes/sm/15-2.jpg",51),
(null,"img/shoes/sm/15-3.jpg",51),
(null,"img/shoes/sm/15-4.jpg",51),
(null,"img/shoes/sm/16-1.jpg",52),
(null,"img/shoes/sm/16-2.jpg",52),
(null,"img/shoes/sm/16-3.jpg",52),
(null,"img/shoes/sm/17-1.jpg",53),
(null,"img/shoes/sm/17-2.jpg",53),
(null,"img/shoes/sm/17-4.jpg",53),
(null,"img/shoes/sm/17-3.jpg",53),
(null,"img/shoes/sm/18-1.jpg",54),
(null,"img/shoes/sm/18-2.jpg",54),
(null,"img/shoes/sm/18-3.jpg",54),
(null,"img/shoes/sm/18-4.jpg",54),
(null,"img/shoes/sm/18-5.jpg",54),
(null,"img/shoes/sm/19-1.jpg",55),
(null,"img/shoes/sm/19-2.jpg",55),
(null,"img/shoes/sm/20-1.jpg",56),
(null,"img/shoes/sm/20-2.jpg",56),
(null,"img/shoes/sm/20-3.jpg",56),
(null,"img/shoes/sm/20-4.jpg",56),
(null,"img/shoes/sm/20-5.jpg",56);




#扫货页面
CREATE TABLE shopping_banner(
	bid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	href VARCHAR(128),
	logo VARCHAR(128)
);

INSERT INTO shopping_banner VALUES
(null,"img/shopping_banner/1.jpg","shopping.html?kw=aj","img/logo/nike.jpg,img/logo/aj.jpg"),
(null,"img/shopping_banner/1.jpg","shopping.html?kw=aj","img/logo/adidas.jpg");

CREATE TABLE shoe_equipment(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(128),
	subtitle VARCHAR(128),
	keyNum VARCHAR(32),
	star VARCHAR(16),
	price DECIMAL(10,2),
	publish_time VARCHAR(32),
	shoe_upper VARCHAR(16),  #鞋帮
	floor VARCHAR(16),  #场地
	material VARCHAR(32),
	view INT
);
INSERT INTO shoe_equipment VALUES
(null,"img/shoe_equipment/jordan/1.jpg","AIR JORDAN 1 RETRO '94","结合了94年推出的第10代的特征：最好玩的是鞋带不再是穿孔了","（暂无货号）","迈克尔·乔丹",789.00,"2013年01月",
"高帮 HIGH CUT","外场 OUT DOOR","皮革",10),
(null,"img/shoe_equipment/jordan/2.jpg","AIR JORDAN 10","没料到大神突然要回来比赛，所以10代AJ的最初设计还是以纪念AJ的文化鞋路线做的，虽然首次使用了phylon中底来降低重量，但实战性能非常一般","310805-024","迈克尔·乔丹",1299.00,"1995年01月",
"高帮 HIGH CUT","内场 IN DOOR","粒面皮革鞋面",8),
(null,"img/shoe_equipment/jordan/3.jpg","AIR JORDAN 13","大神在公牛队的绝唱战靴、也是当年AJ正代销售的最后疯狂，一个时代的结束","823902-015","迈克尔·乔丹",1399.00,"1998年01月",
"高帮 HIGH CUT","内场 IN DOOR","真皮",15),
(null,"img/shoe_equipment/jordan/4.jpg","JORDAN SC-2","仔细看各部分跟哪一代都不完全一样了，外底的10个圆点向21代的IPS致敬是最大亮点，也有奸商称它为jordan flight TR 98","454050-035","迈克尔·乔丹",890.00,"2011年01月",
"高帮 HIGH CUT","内场 IN DOOR","皮革鞋面结合人造覆面",15),
(null,"img/shoe_equipment/jordan/5.jpg","AIR JORDAN 16","出过三个版本：漆皮头的AIR JORDAN XVI，不是漆皮头的AIR JORDAN XVI+，以及不是漆皮头、磁铁鞋套可以翻转使用的AIRJORDAN+ QM，说实话从鞋底看这个鞋套太像内裤了。。。"," 322723-061","迈克尔·乔丹",1480.00,"2011年01月",
"高帮 HIGH CUT","内场 IN DOOR","磁铁代扣鞋套",15),
(null,"img/shoe_equipment/jordan/6.jpg","AIR JORDAN 14","“拉塞尔最讨厌的一款鞋”，大神穿着它晃倒拉塞尔投中第六个总冠军的最后一球，鞋体设计灵感来自法拉利550"," 487471-102","迈克尔·乔丹",1369.00,"1999年01月",
"高帮 HIGH CUT","内场 IN DOOR","全粒面皮革",20),
(null,"img/shoe_equipment/jordan/7.jpg","AIR JORDAN 12","第一款在中国大陆地区零售的AJ 正代球鞋，这才是最早的校园高帅富象征物件！","848692-033","迈克尔·乔丹",869.00,"1999年01月",
"高帮 HIGH CUT","内场 IN DOOR","真皮",20),
(null,"img/shoe_equipment/jordan/8.jpg","AIR JORDAN X AUTO CLAVE","尝到中低价休闲市场的硫化鞋销售甜头的钩子公司继续大举侵占匡威的市场，不过AJ10的硫化鞋确实漂亮","487225-010","迈克尔·乔丹",869.00,"2012年01月",
"高帮 HIGH CUT","外场 OUT DOOR","粒面皮革鞋面",20),
(null,"img/shoe_equipment/jordan/9.jpg","AIR JORDAN 8","大神连续七年得分王、NBA三连霸后突然宣布退役，消费者以为他不再回来了，导致AJ 8在当年成了最高销量的一代","832821-030","迈克尔·乔丹",1100.00,"1993年01月",
"高帮 HIGH CUT","外场 OUT DOOR","人造皮革+抗反向式叠领形皮革",40),
(null,"img/shoe_equipment/jordan/10.jpg","AIR JORDAN 8 LOW","2003年为麦克毕比这个低帮狂人推出的低帮版，之后有过几次复刻","306157-061","迈克尔·乔丹",900.00,"2003年01月",
"低帮 LOW CUT","外场 OUT DOOR","人造皮革+抗反向式叠领形皮革",40),
(null,"img/shoe_equipment/jordan/11.jpg","AIR JORDAN 4","与AIR FLIGHT 89是同胞兄弟，有着相同的大底，也是nike首次尝试使用网格织物来降低球鞋重量，甚至在AJ 4的鞋舌上都有FLIGHT字样","836015-192","迈克尔·乔丹",1189.00,"1989年01月",
"低帮 LOW CUT","外场 OUT DOOR","人造皮革",30),
(null,"img/shoe_equipment/jordan/12.jpg","AIR JORDAN 2.0","2011年的毁三观复刻版，竟然使用了外露的全掌气垫","（暂无货号）","迈克尔·乔丹",1189.00,"2011年01月",
"高帮 HIGH CUT","外场 OUT DOOR","皮革",30),
(null,"img/shoe_equipment/jordan/13.jpg","AIR JORDAN 17","竟然是用金属手提箱市售的。。。虽然豪华指数爆棚但实战效果普通，2年后又出过用料和细节更华丽的AIR JORDAN XVII+","302720-161","迈克尔·乔丹",1680.00,"2002年01月",
"高帮 HIGH CUT","内场 IN DOOR","真皮",25),
(null,"img/shoe_equipment/jordan/14.jpg","AIR JORDAN 11","最后一代使用sole air的AJ正代鞋，也是大神个人最喜欢的一款、穿着它拿下了第一次复出后的首个总冠军；"," 378037-002","迈克尔·乔丹",1429.00,"2002年01月",
"高帮 HIGH CUT","内场 IN DOOR","漆皮",29),
(null,"img/shoe_equipment/jordan/15.jpg","AIR JORDAN 11 LOW","其实元年的时候，真正市售的低帮版AJ 11是没有漆皮且浑身网格小窗口的（有对它的复刻AIR JORDAN 11 LOW IE 货号306008），解决了漆皮的透气问题，但貌似对消费者的吸引力不如漆皮，因此近几年的复刻以漆皮为主了"," 528895-007","迈克尔·乔丹",1299.00,"2002年01月",
"高帮 HIGH CUT","内场 IN DOOR","漆皮",56),
(null,"img/shoe_equipment/jordan/16.jpg","AIR JORDAN 9","大神第一次退役打棒球期间的一代；数年后复刻时，科比和艾迪琼斯的紫黄色PE让他重现神采","302370-106","迈克尔·乔丹",1299.00,"2002年01月",
"高帮 HIGH CUT","内场 IN DOOR","真皮",56),
(null,"img/shoe_equipment/jordan/17.jpg","AIR JORDAN 7","1992年巴塞罗娜奥运会梦之一队（鞋后跟有9号的数字）和乔丹第二个NBA总冠军的双料战靴，首次使用了huarache设计（鞋内是个低帮的内靴，鞋帮处只是薄薄的一个外层），外底橡胶是浓浓非洲激情的撞色拼接图案","304775-107","迈克尔·乔丹",1599.00,"1992年01月",
"高帮 HIGH CUT","内场 IN DOOR","真皮",36),
(null,"img/shoe_equipment/jordan/18.jpg","AIR JORDAN 3","1988年的第三代AJ是大神第二次获得全明星赛扣篮王的重要战靴，并且是第一次开始使用飞人标志（但只在鞋舌上、后跟和鞋底还是NIKE标志），之后的复刻版本除了88元年复刻版，其他版本已经见不到NIKE字样了","398614-406","迈克尔·乔丹",1480.00,"1988年01月",
"高帮 HIGH CUT","内场 IN DOOR","真皮",36),
(null,"img/shoe_equipment/jordan/19.jpg","AIR JORDAN 1 RETRO 95 TXT","结合了95年推出的第11代的特征：织物鞋面+漆皮鞋头","616369-195","迈克尔·乔丹",999.00,"1992年01月",
"高帮 HIGH CUT","内场 IN DOOR","漆皮鞋头和网面材质",36),
(null,"img/shoe_equipment/jordan/20.jpg","AIR JORDAN 1 RETRO MID","89年复刻AJ 1的时候，是第一次大规模的8孔版retro，后来这种更易休闲穿着的版本被称为AIR JORDAN 1 RETRO MID","554724-005","迈克尔·乔丹",969.00,"1989年01月",
"高帮 HIGH CUT","内场 IN DOOR","皮革",36),
(null,"img/shoe_equipment/jordan/21.jpg","AIR JORDAN 19","虽然外形没有超越18代的经典，但AIR JORDAN XIX接着大神退役不久的尚存高人气依然大卖","307546-002","迈克尔·乔丹",969.00,"2004年01月",
"高帮 HIGH CUT","内场 IN DOOR","漆皮, Tech Flex",36),
(null,"img/shoe_equipment/jordan/22.jpg","AIR JORDAN 6","
这是属于大神（首个NBA总冠军）和樱木花道共同的巅峰战靴，饱满的经典外形人气十足","384664-160","迈克尔·乔丹",1499.00,"1991年01月",
"高帮 HIGH CUT","内场 IN DOOR","皮革",36),
(null,"img/shoe_equipment/jordan/23.jpg","AIR JORDAN 1 KO","
	Air Jordan 1 HI的鞋型，不同的是鞋身材质改为帆布了，也有直接叫AJKO的。","638471-007","迈克尔·乔丹",1199.00,"1991年01月",
"高帮 HIGH CUT","内场 IN DOOR","帆布",36),
(null,"img/shoe_equipment/jordan/24.jpg","AIR JORDAN 1 HI","
	彩色配色篮球鞋的鼻祖，1985年诞生后，除了1994年和2001做过两次元年复刻之外，（元年配色复刻的鞋款名称有OG两个字，ORIGINAL的缩写），后跟无Logo，01年之后均带有飞人LOGO，（13年2个版本都推出）其他9个鞋带孔的各种其他配色的复刻也大量推出","555088-123","迈克尔·乔丹",1189.00,"1985年01月",
"高帮 HIGH CUT","内场 IN DOOR","皮革",36),
(null,"img/shoe_equipment/jordan/25.jpg","AIR JORDAN 1 STRAP LOW","
	比普通的LOW多个魔术贴条","574420-116","迈克尔·乔丹",960.00,"1985年01月",
"高帮 HIGH CUT","内场 IN DOOR","皮革",36),
(null,"img/shoe_equipment/wade/1.jpg","JORDAN EVOLUTION 85","
	2011年JORDAN品牌下复古风格的热门实战鞋；最大亮点是前掌的魔术粘、加强了力量训练时的保护、让鞋子的使用范围更广；","429493-102","德怀恩·韦德",1099.00,"2011年01月",
"高帮 HIGH CUT","内场 IN DOOR","PU/人造革；漆皮材料",58),
(null,"img/shoe_equipment/wade/2.jpg","AIR JORDAN 2010","
	那一刻韦德几乎就要成为AJ正代的唯一接班人了。。。","387358-061","德怀恩·韦德",1299.00,"2011年01月",
"中帮 MID CUT","内场 IN DOOR","皮革",80),
(null,"img/shoe_equipment/wade/3.jpg","AIR JORDAN ALPHA 1 OUTDOOR","
	OUTDOOR版本只是多了魔术粘","407489-002","德怀恩·韦德",1280.00,"2011年01月",
"中帮 MID CUT","内场 IN DOOR","打孔皮革",44),
(null,"img/shoe_equipment/wade/4.jpg","TEAM WADE OLYMPICS","","（暂无货号）","德怀恩·韦德",1250.00,"2008年01月","中帮 MID CUT","内场 IN DOOR","皮革",44),
(null,"img/shoe_equipment/wade/5.jpg","JORDAN D REIGN","
	FLY WADE 2的低端衍生款，定位室外场地，配置上也从lunarlon退回到SOLE AIR，试想如果韦德当年没去李宁，现在也是AJ正代、衍生款一大堆了。。。","529454-101","德怀恩·韦德",859.00,"2011年01月",
"中帮 MID CUT","内场 IN DOOR","PU/人造织物",44),
(null,"img/shoe_equipment/wade/6.jpg","韦德之道","
	从花尽心思为每个配色取名字、就能看出韦德之道系列从一开始就不是比拼科技和性能的，而是让型男韦德尽情设计和风骚的潮鞋路线，所以外形也有着浓郁的类似AIR JORDAN前10代的复古线条。但这个冒险的尝试却让韦德之道大获成功、韦德的时尚品位得到了极大释放、甚至配色成功到可以经常做限量销售，这在李宁过去的历史中极为罕见","ABAH027-2","德怀恩·韦德",859.00,"2012年01月",
"中帮 MID CUT","内场 IN DOOR","鞋带孔TPU材质支撑, 真皮",56),
(null,"img/shoe_equipment/wade/7.jpg","AIR JORDAN 2010 OUTDOOR","
	从双层ZOOM恢复到前ZOOM后MAX的普通配置，增加鞋面十字交叉绑带","407744-101","德怀恩·韦德",859.00,"2012年01月",
"中帮 MID CUT","内场 IN DOOR","皮革",51),
(null,"img/shoe_equipment/wade/8.jpg","CONVERSE WADE 4.0","","（暂无货号）","德怀恩·韦德",859.00,"2009年01月",
"中帮 MID CUT","内场 IN DOOR","皮革",48),
(null,"img/shoe_equipment/wade/9.jpg","CONVERSE WADE SLASH","","（暂无货号）","德怀恩·韦德",859.00,"2009年01月",
"中帮 MID CUT","内场 IN DOOR","皮革",56),
(null,"img/shoe_equipment/wade/10.jpg","CONVERSE ICON WARRIOR","","（暂无货号）","德怀恩·韦德",765.00,"2005年01月",
"中帮 MID CUT","内场 IN DOOR","皮革",34),
(null,"img/shoe_equipment/wade/11.jpg","JORDAN FLY WADE","
	虽然是韦德的第一款独立签名球鞋且重量超轻，但是AIR JORDAN 2011的痕迹太重了。。。","429486-301","德怀恩·韦德",990.00,"2011年01月",
"中帮 MID CUT","内场 IN DOOR","FUSE热烫塑料",51),
(null,"img/shoe_equipment/wade/12.jpg","韦德之道2","
	第二代韦德之道虽然配置上与上一代几乎没有变化，但设计灵感却非常牛逼，当潮鞋们都在追随军装迷彩元素时，韦德开始玩一战时期用在舰艇上的“眩惑”迷彩涂装，从外底到鞋面都布满了这种类似斑马纹的无规则平型线条，惊艳异常。","ABAH017-12","德怀恩·韦德",840.00,"2013年01月",
"中帮 MID CUT","内场 IN DOOR","后跟处碳纤维支撑, 鞋带孔和中底位置TPU材质支撑, 真皮",48),
(null,"img/shoe_equipment/wade/13.jpg","韦德之道低帮","
	不知道是李宁的力气都用在了韦德之道上还是怕设计会冒风险，低帮的韦德之道跟正代几乎没有区别，仅仅是降低了本来就不高的鞋帮，缩减了鞋舌的长度，价格也没有降低很明显，所以人气远不如韦德之道。","ABAH039-1","德怀恩·韦德",799.00,"2013年01月",
"中帮 MID CUT","内场 IN DOOR","鞋带孔和中底位置TPU材质支撑, 真皮",48),
(null,"img/shoe_equipment/wade/14.jpg","韦德裂变2","
	保持了该系列统一的高帮外形，不同的是此次中底换用了全掌Bounse+缓震科技","ABFK011-5","德怀恩·韦德",599.00,"2015年04月",
"中帮 MID CUT","内场 IN DOOR","合成革",20),
(null,"img/shoe_equipment/wade/15.jpg","JORDAN ELEMENTS","
	2009年AJ TEAM的户外篮球鞋，更像是前一年JORDAN ESTERNO的延续；依旧强调耐磨耐用的球场硬汉形象、还有些11代的漆皮风韵；","364693-101","德怀恩·韦德",930.00,"2015年04月",
"中帮 MID CUT","内场 IN DOOR","皮革",24),
(null,"img/shoe_equipment/wade/16.jpg","韦德之钻","
	搭配全掌Bounse+缓震科技的韦德休闲文化鞋，简直是压马路神器呀！","ABCJ029-3","德怀恩·韦德",499.00,"2014年09月",
"中帮 MID CUT","内场 IN DOOR","合成革",24),
(null,"img/shoe_equipment/wade/17.jpg","AIR JORDAN ALPHA 1","
	2010年Jordan Brand成立25周年，为了纪念这个特殊日子，设计师将AJ1升级，加入了一些新的科技元素：将普通的PU中底升级为全掌phylon中底；由原先的后掌Air Sole气垫 改为全掌Zoom气垫；并在鞋楦，鞋型，内衬材料和外底纹路方面进行了些许的修改，使之能够满足现代篮球比赛的需求。","392813-001","德怀恩·韦德",1280.00,"2010年09月",
"中帮 MID CUT","内场 IN DOOR","打孔皮革",24),
(null,"img/shoe_equipment/wade/18.jpg","AIR JORDAN ALPHA 1 LOW","
	低帮后就变成只有后掌ZOOM了","453839-102","德怀恩·韦德",799.00,"2010年09月",
"中帮 MID CUT","内场 IN DOOR","打孔皮革",24),
(null,"img/shoe_equipment/wade/19.jpg","CONVERSE WADE 1","","（暂无货号）","德怀恩·韦德",880.00,"2010年09月",
"中帮 MID CUT","内场 IN DOOR","皮革",10),
(null,"img/shoe_equipment/wade/20.jpg","韦德轻酷3","
	继承了韦德轻酷的血统，低帮造型，鞋身设计看到了韦德之道3的影子，一款压马路的鞋子","ABCK015-2","德怀恩·韦德",399.00,"2015年07月",
"中帮 MID CUT","内场 IN DOOR","织物",24),
(null,"img/shoe_equipment/wade/21.jpg","韦德之道5","
	韦德之道系列五年来集大成之作，由设计师埃里克-米勒操刀，灵感源于自然界中的风，寓意德维恩-韦德重返家乡“风城”，开启职业生涯全新篇章。作为最变化多端的自然现象，风时而平静，时而猛烈，正如韦德的赛场之道，既可无声潜行，又可咆哮而过，令对手难以防范！","ABAL047-13","德怀恩·韦德",1199.00,"2015年07月",
"中帮 MID CUT","内场 IN DOOR","复合网布材质，带来轻质透气特点",45),
(null,"img/shoe_equipment/wade/22.jpg","韦德队尚MID","
	借助韦德名气，大推旗下篮球，继韦德队尚Low版本之后再度推出MID版本，相同配置，不过MID版跟适宜在接下去的秋冬季节穿着。","ABAJ019-4","德怀恩·韦德",589.00,"2014年10月",
"中帮 MID CUT","内场 IN DOOR","TPU眼扣设计, 合成",45),
(null,"img/shoe_equipment/kobe/1.jpg","NIKE KOBE IX ELITE","
	可能是怕消费者不能接受低帮了那么多代的超高帮KOBE鞋，一出来就直接使用ELITE顶级配置。。。","678301-904","科比·布莱恩特",1699.00,"2014年01月",
"高帮 HIGH CUT","内场 IN DOOR","鞋身两侧碳纤维支撑, 动态飞线；, FLYNIT鞋面",135),
(null,"img/shoe_equipment/kobe/2.jpg","NIKE KOBE IX LIFESTYLE","
	出休闲版是因为KOBE 9的鞋帮太高没法穿牛仔裤吧？KOBE 9 LIFESTYLE的出现再次证明那个战靴会淹没小腿","630774-100","科比·布莱恩特",889.00,"2014年01月",
"高帮 HIGH CUT","内场 IN DOOR","漆皮",135),
(null,"img/shoe_equipment/kobe/3.jpg","NIKE KOBE VIII SYSTEM","
	虽然还叫system，但是够买的时候只能选一种中底，而且基本中国买到的都是lunarlon中底（更像是个鞋垫）","555035-502","科比·布莱恩特",1399.00,"2014年01月",
"低帮 LOW CUT","内场 IN DOOR","ENGINEERED MESH",135),
(null,"img/shoe_equipment/kobe/4.jpg","NIKE ZOOM KOBE VENOMENON 4","
	与毒液3几乎一样的外底，难道今后毒液自成体系，不走KOBE 简版路线了？真心跟KOBE 9不像啊。。。","630916-003","科比·布莱恩特",849.00,"2014年01月",
"低帮 LOW CUT","内场 IN DOOR","NIKE FLYWIRE, NIKE HYPERFUSE, 织物",135),
(null,"img/shoe_equipment/kobe/5.jpg","NIKE KOBE VIII SYSTEM ELITE","
	比普通版8代前掌两侧各增加了8根飞线，并改回前后掌ZOOM","586590-300","科比·布莱恩特",849.00,"2013年01月",
"低帮 LOW CUT","内场 IN DOOR","动态飞线, KEVLAR®凯夫拉纤维鞋带, ENGINEERED MESH",125),
(null,"img/shoe_equipment/kobe/6.jpg","NIKE ZOOM KOBE IV","
	科比的第一款没奥尼尔帮忙的总冠军鞋、也是第一款走低帮风格的科比鞋，重量非常轻","639693-500","科比·布莱恩特",1198.00,"2013年01月",
"低帮 LOW CUT","内场 IN DOOR","皮革, NIKE FLYWIRE",215),
(null,"img/shoe_equipment/kobe/7.jpg","NIKE ZOOM KOBE VI","
	用聚氨酯在网布上做了一层“鳞片”","640220-001","科比·布莱恩特",1299.00,"2010年01月",
"低帮 LOW CUT","内场 IN DOOR","NIKE FLYWIRE",215),
(null,"img/shoe_equipment/kobe/8.jpg","NIKE ZOOM KOBE I","
	04年科比性丑闻后的第一款命名鞋、配置极高","640221-001","科比·布莱恩特",1290.00,"2005年12月",
"低帮 LOW CUT","内场 IN DOOR","皮革",215),
(null,"img/shoe_equipment/kobe/9.jpg","NIKE ZOOM KOBE VII SYSTEM ELITE","
	在普通7代基础上又开始做聚氨酯鳞片","511371-100","科比·布莱恩特",1999.00,"2012年12月",
"低帮 LOW CUT","内场 IN DOOR","聚氨酯鳞片, NIKE FLYWIRE",115),
(null,"img/shoe_equipment/kobe/10.jpg","NIKE KOBE IX EM","
	EM是Engineered Mesh工程网面的意思，虽然也是织物，但它却不是KOBE IX ELITE的FLYKNIT那种电脑程序直接织出来的鞋子，支撑性和透气性要略差一些，不过低得多的售价也让它有自己的优势.","646701-474","科比·布莱恩特",1399.00,"2014年01月",
"低帮 LOW CUT","内场 IN DOOR","后跟处TPU支撑, Engineered Mesh尼龙材质的织物鞋面",115),
(null,"img/shoe_equipment/kobe/11.jpg","NIKE KOBE IX ELITE LOW","
	HTM是纪念日本潮流教父藤原浩（Hiroshi Fujiwara），Nike传奇设计师Tinker Hatfield和Nike CEO Mark Parker的顶级限量系列，看来9代的低帮版的销量以后注定是以EM面料为主了。","639045-515","科比·布莱恩特",1599.00,"2014年01月",
"低帮 LOW CUT","内场 IN DOOR","鞋身两侧碳纤维支撑, 动态飞线；, FLYNIT鞋面；",115),
(null,"img/shoe_equipment/kobe/12.jpg","EQT Top Ten 2000","
	科比的第一双代言鞋，也是第一双天足鞋，96年这个高中生篮球天才加上天足的小人头LOGO风靡了全世界；","G79100","科比·布莱恩特",980.00,"1996年06月",
"低帮 LOW CUT","内场 IN DOOR","皮革",35),
(null,"img/shoe_equipment/lbj/1.jpg","NIKE LeBron Soldier 8","
	魔术粘貌有类似动态飞线的技术","653641-610","勒布朗·詹姆斯",1099.00,"2014年06月",
"中帮 MID CUT","内场 IN DOOR","动态飞线, NIKE HYPERFUSE",99),
(null,"img/shoe_equipment/lbj/2.jpg","NIKE LEBRON XI","
	NIKE技术的大杂烩：几乎全出现在了这款鞋上","650884-400","勒布朗·詹姆斯",1599.00,"2013年01月",
"高帮 HIGH CUT","内场 IN DOOR","FYLWIRE动态飞线, NIKE HYPERFUSE, NIKE HYPERPOSITE技术",99),
(null,"img/shoe_equipment/lbj/3.jpg","NIKE LEBRON ST LOW","
	跟07年的“ZOOM LEBRON LOW ST”完全没有血缘关系，更像是AIR LEBRON E.E.的下一代","534846-002","勒布朗·詹姆斯",849.00,"2012年01月",
"高帮 HIGH CUT","内场 IN DOOR","FUSE热烫塑料",42),
(null,"img/shoe_equipment/lbj/4.jpg","NIKE Zoom Soldier 7","
	除了魔术粘，其他跟六代变化不大","609679-01","勒布朗·詹姆斯",849.00,"2012年01月",
"高帮 HIGH CUT","内场 IN DOOR","NIKE HYPERFUSE",88),
(null,"img/shoe_equipment/lbj/5.jpg","NIKE LEBRON X ELITE","
	中底没换，NIKE对ZOOM MAX十足的信心","579834-100","勒布朗·詹姆斯",1899.00,"2013年01月","高帮 HIGH CUT","内场 IN DOOR","后跟处碳纤维支撑, 全fuse鞋面, KEVLAR®凯夫拉纤维鞋带",94),
(null,"img/shoe_equipment/lbj/6.jpg","NIKE AIR ZOOM LEBRON VI LOW","
	长得太像是低帮AIR FORCE 1了。。。","354696-171","勒布朗·詹姆斯",990.00,"2008年01月","高帮 HIGH CUT","内场 IN DOOR","合成革, PU",42),
(null,"img/shoe_equipment/lbj/7.jpg","NIKE AIR MAX LEBRON IX LOW","
	外形太像AIRMAX360系列的跑步鞋","510811-101","勒布朗·詹姆斯",1299.00,"2012年01月","高帮 HIGH CUT","内场 IN DOOR","NIKE HYPERFUSE",86),
(null,"img/shoe_equipment/lbj/8.jpg","NIKE LEBRON XII","
	简称LeBron 12，LBJ12或勒布朗12，以包裹彩色hexagonal Zoom Air缓震单元的透明冰蓝色大底结合最新的MegaFuse面料为主打，极具视觉冲击力。","742549-190","勒布朗·詹姆斯",1599.00,"2014年01月","高帮 HIGH CUT","内场 IN DOOR","动态飞线, NIKE HYPERPOSITE技术, MegaFuse",75),
(null,"img/shoe_equipment/lbj/9.jpg","NIKE AMBASSADOR VI","
	比士兵率先使用了动态飞线技术","615821-301","勒布朗·詹姆斯",999.00,"2014年01月","中帮 MID CUT","内场 IN DOOR","弹性橡胶条支撑, hyperfuse热烫塑料, flywire动态飞线",75),
(null,"img/shoe_equipment/lbj/10.jpg","NIKE AIR MAX LEBRON VII P.S","
	到了重要比赛还得是ZOOM啊","407639-002","勒布朗·詹姆斯",1188.00,"2010年01月","中帮 MID CUT","内场 IN DOOR","弹性橡胶条支撑, hyperfuse热烫塑料, flywire动态飞线",97),
(null,"img/shoe_equipment/lbj/11.jpg","Nike Soldier X","
	Nike LeBron Soldier系列的全新一代，鞋面采用多片魔术贴设计，替代了传统的鞋带，设计十分前卫。高帮的设计帮助固定及保护脚踝，保护性能出众。","844379-416","勒布朗·詹姆斯",1199.00,"2016年01月","中帮 MID CUT","内场 IN DOOR","",284);




#扫货页导航标签
-- CREATE TABLE shopping_nav_family(
-- 	nid INT PRIMARY KEY AUTO_INCREMENT,
-- 	title VARCHAR(64),
-- 	img VARCHAR(128),
-- 	fid INT
-- );
-- INSERT INTO shopping_nav_family VALUES
-- (null,"热门标签","img/shopping_nav_icon/1.png",1),
-- (null,"热门品牌","img/shopping_nav_icon/2.png",2),
-- (null,"篮球专区","img/shopping_nav_icon/3.png",3),
-- (null,"跑步健身","img/shopping_nav_icon/4.png",4),
-- (null,"潮流休闲","img/shopping_nav_icon/5.png",5),
-- (null,"足球专区","img/shopping_nav_icon/6.png",6);


-- CREATE TABLE shopping_nav(
-- 	sid INT PRIMARY KEY AUTO_INCREMENT,
-- 	title VARCHAR(64),
-- 	img VARCHAR(64),
-- 	family_id INT,
-- 	FOREIGH KEY family_id REFERENCES shopping_nav_family(fid)
-- );
-- INSERT INTO shopping_nav VALUES
-- (null,"顶级装备","img/shopping_nva_icon/dingji.jpg",1),
-- (null,"NMD","img/shopping_nva_icon/nmd.jpg",1),
-- (null,"女神专区","img/shopping_nva_icon/nvshen.jpg",1),
-- (null,"顶级百搭","img/shopping_nva_icon/baida.jpg",1),
-- (null,"Adidas","img/shopping_nva_icon/cropped_adidas.jpg",2),
-- (null,"Nike","img/shopping_nva_icon/cropped_nike.jpg",2),
-- (null,"Air Jordan","img/shopping_nva_icon/cropped_aj.jpg",2),
-- (null,"NB","img/shopping_nva_icon/newbalance.jpg",2),
-- (null,"Under Armour","img/shopping_nva_icon/andema.jpg",2),


#扫货商品
-- CREATE TABLE shopping_products_family(
-- 	sid INT PRIMARY KEY AUTO_INCREMENT,
-- 	fname VARCHAR(32)
-- );
-- INSERT INTO shopping_products_family VALUES
-- (null,"顶级装备"),
-- (null,"NMD"),
-- (null,"女神专区"),
-- (null,"百搭利器"),
-- (null,"Adidas"),
-- (null,"Nike"),
-- (null,"Under Armour"),
-- (null,"Air Jordan"),
-- (null,"篮球鞋"),
-- (null,"实战利器"),
-- (null,"经典复刻"),
-- (null,"跑步鞋"),
-- (null,"板鞋"),
-- (null,"卫衣"),
-- (null,"休闲鞋");














