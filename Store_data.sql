

-- CREATE DATABASE  NEO;

CREATE TABLE BRAND (
	BRAND_ID INT NOT NULL AUTO_INCREMENT, 
	BRAND_CATEGORY VARCHAR(255) ,
	BRAND_NAME VARCHAR(255) NOT NULL,
	BRAND_COMPANY VARCHAR(255) ,
	BRAND_DESCRIPTION TEXT,
	PRIMARY KEY (BRAND_ID)
);

CREATE TABLE PRODUCT_LIST (
	PRODUCT_ID	INT NOT NULL AUTO_INCREMENT,
	PRODUCT_NAME VARCHAR(255) NOT NULL,
	COLOUR VARCHAR(255) NOT NULL, 
	BARCODE	VARCHAR(25),
	PRIME_COST	NUMERIC(18,2) NOT NULL,
	SALE_PRICE	NUMERIC(18,2) NOT NULL,
	BRAND_ID INT,
	PRODUCT_SIZE VARCHAR(10) NOT NULL,
	PRODUCT_CATEGORY VARCHAR(255) NOT NULL,
	PRODUCT_STYLE VARCHAR(10) NOT NULL, 
	TOTAL_AMOUNT INT NOT NULL DEFAULT 0, 
	PRIMARY KEY (PRODUCT_ID),
	FOREIGN KEY (BRAND_ID) REFERENCES BRAND(BRAND_ID)
);

CREATE TABLE EMPLOYEE (
	EMP_NUM	INT NOT NULL AUTO_INCREMENT, 
	EMP_FNAME VARCHAR(10) NOT NULL, 
	EMP_LNAME VARCHAR(10) NOT NULL,
	EMP_SIN_NUM	VARCHAR(255) NOT NULL,
	EMP_ID_NUM	VARCHAR(255) NOT NULL,
	EMP_PHONE VARCHAR(25) NOT NULL, 
	EMP_EMAIL VARCHAR(255), 
	EMP_ADDRESS	VARCHAR(255) NOT NULL,
	EMP_PAY_GRADE VARCHAR(255) NOT NULL,
	START_DATE DATE,
	END_DATE DATE,
	EMP_STATUS VARCHAR(255) NOT NULL,
	PRIMARY KEY (EMP_NUM)
);


CREATE TABLE DEAL (
	DEAL_ID	INT NOT NULL AUTO_INCREMENT,
	DEAL_DETAIL VARCHAR(255) NOT NULL, 
	ISSUE_DATE DATE NOT NULL,
	TERMINATION_DATE DATE NOT NULL,
	PRIMARY KEY (DEAL_ID)
);

CREATE TABLE CUSTOMER (
	CUSTOMER_ID	INT NOT NULL AUTO_INCREMENT,
	CUSTOMER_NAME VARCHAR(255) NOT NULL,
	CUSTOMER_PHONE VARCHAR(25),
	CUSTOMER_EMAIL VARCHAR(30), 
	CUSTOMER_MEMBERSHIP VARCHAR(255) NOT NULL,
	PRIMARY KEY (CUSTOMER_ID)
);

CREATE TABLE STORE_INVENTORY (
	PRODUCT_ID INT NOT NULL UNIQUE,
	STOR_AMOUNT INT NOT NULL DEFAULT 0,
	STOR_SHELF VARCHAR(255) NOT NULL,
	STOR_LOCATION VARCHAR(255),
	PRIMARY KEY (PRODUCT_ID),
	FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT_LIST(PRODUCT_ID) 
);


CREATE TABLE WAREHOUSE_INVENTORY (
	PRODUCT_ID INT NOT NULL UNIQUE,
	WARE_AMOUNT INT NOT NULL DEFAULT 0,
	WARE_SHELF VARCHAR(255) NOT NULL,
	WARE_LOCATION VARCHAR(255),
	PRIMARY KEY (PRODUCT_ID),
	FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT_LIST(PRODUCT_ID)
);

-- create order_info as supertype

CREATE TABLE ORDER_INFO (
	ORDER_ID INT NOT NULL AUTO_INCREMENT,
	ORDER_ISSUE_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	EMP_NUM INTEGER NOT NULL,
	ORDER_TYPE VARCHAR(255) NOT NULL,
	CHECK (ORDER_TYPE IN ('SALE','PURCHASE','OUTBOUND')),
	PRIMARY KEY (ORDER_ID),
	FOREIGN KEY (EMP_NUM) REFERENCES EMPLOYEE(EMP_NUM)
);


CREATE TABLE SALES_ORDER(
	 ORDER_ID INT NOT NULL,
	 DEAL_ID	INT,
	 CUSTOMER_ID	INT,
	 PRIMARY KEY (ORDER_ID),
     FOREIGN KEY (ORDER_ID) REFERENCES ORDER_INFO(ORDER_ID),
	 FOREIGN KEY (DEAL_ID) REFERENCES DEAL(DEAL_ID),
     FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)

);



CREATE TABLE PURCHASE_ORDER(
	ORDER_ID INT NOT NULL,
	SUPPLIER VARCHAR(50) NOT NULL,
	PRIMARY KEY (ORDER_ID),
	FOREIGN KEY (ORDER_ID) REFERENCES ORDER_INFO(ORDER_ID)
);

CREATE TABLE OUTBOUND_ORDER(
	ORDER_ID INT NOT NULL,
	SUPPLIER VARCHAR(255) NOT NULL,
	PRIMARY KEY (ORDER_ID),
	FOREIGN KEY (ORDER_ID) REFERENCES ORDER_INFO(ORDER_ID)
);

CREATE TABLE ORDER_PRODUCT(
	ORDER_ID INT NOT NULL,
	PRODUCT_ID INT NOT NULL,
	AMOUNT INT NOT NULL,
	PRIMARY KEY (ORDER_ID,PRODUCT_ID),
	FOREIGN KEY (ORDER_ID) REFERENCES ORDER_INFO(ORDER_ID),
	FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT_LIST(PRODUCT_ID)
);



CREATE TABLE FEEDBACK(
FEEDBACK_ID INT NOT NULL AUTO_INCREMENT,
CUSTOMER_ID	INT NOT NULL,
CONTENT TEXT NOT NULL,
ISSUE_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (FEEDBACK_ID),
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);

-- now start to insert data

INSERT INTO BRAND(BRAND_CATEGORY,BRAND_NAME,BRAND_COMPANY,BRAND_DESCRIPTION)
VALUES
("Bags","Goldlion","Goldlion (China) Co., Ltd.","Supplier based in Hong Kong"),
("Bags","Septwolves","Fujian Septwolves industry Limited","Supplier based in Fujian"),
("Shoes","Jinluda","Zhejiang jinluda Leather Co. Ltd.","Supplier based in Zhejiang"),
("Shoes","Jinho","Golden Monkey Group Co. Ltd.","Supplier based in Weihai"),
("Shoes","Satchi","Guangzhou Satchi Leather Co. Ltd.","Supplier based in Guangzhou"),
("Bags","Tucano","Dongguan Qihao Garment Co. Ltd.","Supplier based in Dongguan"),
("Bags","Dissona","Shenzhen Sanna leather products Co. Ltd.","Supplier based in Shenzhen"),
("Bags","Wanlima","Guangdong Wanlima industrial Limited","Supplier based in Guangdong"),
("Bags","GuiRenNiao","GuiRenNiao (China) Co., Ltd.","Supplier based in Hong Kong"),
("Bags","SiTaFu","Fujian SiTaFu industry Limited","Supplier based in Fujian"),
("Shoes","Jinxu","Zhejiang Jinxu Leather Co. Ltd.","Supplier based in Zhejiang"),
("Shoes","Jinhua","Golden Jinhua Group Co. Ltd.","Supplier based in Weihai"),
("Shoes","SatWeekend","Guangzhou SatWeekend Leather Co. Ltd.","Supplier based in Guangzhou"),
("Bags","Tuling","Dongguan Tuling Garment Co. Ltd.","Supplier based in Dongguan"),
("Bags","Daissy","Shenzhen Daissy leather products Co., Ltd.","Supplier based in Shenzhen"),
("Bags","YiErKang","Guangdong YiErKang industrial Limited","Supplier based in Guangdong"),
("Shoes","Pinoko","Guangzhou Pinoko Leather Co. Ltd.","Supplier based in Guangzhou"),
("Bags","Tsubomi","Dongguan Tsubomi Co. Ltd.","Supplier based in Dongguan"),
("Bags","NaKo","Shenzhen NaKo products Co., Ltd.","Supplier based in Shenzhen"),
("Bags","Monoi","Guangdong Monoi industrial Limited","Supplier based in Guangdong");

INSERT INTO PRODUCT_LIST(PRODUCT_NAME,COLOUR,BARCODE,PRIME_COST,SALE_PRICE,BRAND_ID,PRODUCT_SIZE,PRODUCT_CATEGORY,PRODUCT_STYLE,TOTAL_AMOUNT)
VALUES
("Leopard Velvet Travel Bag","Brown","B00HSPXR0A",49.99,59.99,1,"L","Bag","Formal",79),
("Large Faux Leather Shoulder Tassel Bag","Black","B01KKPZ1NK",150.99,180.99,2,"M","Bag","Casual",200),
("Top Handle Satchel Handbag","Red","B075GVZTDZ",100.99,115.99,3,"S","Bag","Casual",125),
("Black Army Leather Shoes","Brown","B07CPFHSVB",50.99,60.99,4,"6-11","Shoes","Casual",76),
("Elegant Tassels Office Slip-on Shoes","Black","B07CYGM132",70.99,75.99,5,"7-13","Shoes","Casual",95),
("Lock Chain Shoulder Messenger Bag","Olive","B07ZZGDVZH",170.99,200.99,6,"M","Bag","Casual",235),
("Zipper Fancy Style Shoes","Black","B07R5RJHHF",100.99,125.99,7,"7-13","Shoes","Formal",120),
("Clutch Evening Bag","Brown","B07F2RW6PJ",180.99,200.99,8,"L","Bag","Formal",219),
("Vintage Stone Embossed Sling Bag","Black","B073FD3MLF",60.99,80.99,9,"M","Bag","Formal",85),
("Casual Business Dress Shoes","Olive","B07NYB3HMC",59.99,69.99,10,"6-11","Shoes","Casual",79),
("Leopard Velvet Travel Bag","Black","B00HSPXR0B",49.99,59.99,11,"L","Bag","Formal",79),
("Large Faux Leather Shoulder Tassel Bag","Red","B01KKPZ1NF",150.99,180.99,12,"M","Bag","Casual",200),
("Top Handle Satchel Handbag","Brown","B075GVZTDA",100.99,115.99,13,"S","Bag","Casual",125),
("Black Army Leather Shoes","Black","B07CPFHSVC",50.99,60.99,14,"6-11","Shoes","Casual",76),
("Elegant Tassels Office Slip-on Shoes","Olive","B07CYGM133",70.99,75.99,15,"7-13","Shoes","Casual",95),
("Lock Chain Shoulder Messenger Bag","Black","B07ZZGDVZL",170.99,200.99,16,"M","Bag","Casual",235),
("Zipper Fancy Style Shoes","Brown","B07R5RJHHG",100.99,125.99,17,"7-13","Shoes","Formal",120),
("Clutch Evening Bag","Black","B07F2RW6PK",180.99,200.99,18,"L","Bag","Formal",219),
("Vintage Stone Embossed Sling Bag","Olive","B073FD3MLE",60.99,80.99,19,"M","Bag","Formal",85),
("Casual Business Dress Shoes","Red","B07NYB3HMD",59.99,69.99,20,"6-11","Shoes","Casual",79);

INSERT INTO EMPLOYEE(EMP_FNAME,EMP_LNAME,EMP_SIN_NUM,EMP_ID_NUM,EMP_PHONE,EMP_EMAIL,EMP_ADDRESS,EMP_PAY_GRADE,START_DATE,END_DATE,EMP_STATUS)
VALUES
("Yahui","Tao","583 338 520","NLB1","028-84141458","916604824871@qq.com","Jin Xiu Hua Yuan Bi Xi 11-3","A",'2015-07-01','2016-03-27',"Left company"),
("Xiuying","Wang","674 742 879","NLB2","028-83191863","145567130341@163.com","Ren Min Nan Lu Si Duan 63hao","B",'2015-01-09','2018-01-26',"Left company"),
("Wei","Wang","789 565 702","NLB3","1470383-4233","827293430748@163.com","Sheng Yi Bin Shi Yi Bin Xian Tian Fu Hua Yuan","A",'2015-07-23','2017-12-14',"Left company"),
("Na","Li","938 323 789","NLB4","028-86884106","295514194212@qq.com","Xing Hui Xi Lu 11hao Wan Fu Hua Yuan 303shi","B",'2015-12-23','2017-11-23',"Left company"),
("Jun","Wang","522 945 302","NLB5","028-85069181","704818605133@163.com","San Dong 2dan Yuan 913","B",'2016-02-06','2018-09-21',"Left company"),
("Jie","Zhang","606 223 139","NLB6","028-87007140","663120129053@qq.com","He Da Tian Ran Ji 1qi 2dong 2dan Yuan Fu 6hao","A",'2016-04-05',NULL,"Currently" "Employed"),
("Ming","Li","262 419 153","NLB7","1898180-6768","458872629941@qq.com","Tian Fu Ruan Jian Yuan D3","A",'2016-01-15','2017-09-11',"Left company"),
("Qi","Chen","649 605 631","NLB8","1848204-6080","674970639226@163.com","Gao Sheng Qiao Lu 9hao Luo Fu Guang Chang 15lou","B",'2017-03-04',NULL,"Currently Employed"),
("Hai","Dong","389 504 150","NLB9","1789815-4199","886137270839@163.com","Xin Shi Jie 2dong 2dan Yuan 1702","B",'2017-08-09',NULL,"Currently Employed"),
("Fang","Liu","389 504 150","NLB10","028-88839479","736910264449@qq.com","Kang Ding Lu 1268long 1hao 801","B",'2018-09-21',NULL,"Currently Employed"),
("Yahu","Tao","583 338 521","NLB11","028-84141459","916604824471@qq.com","Jin Xiu Hua Yuan Bi Xi 11-9","A",'2015-07-01','2016-03-27',"Left company"),
("Xiuyin","Wang","674 742 878","NLB12","028-83191866","145567136341@163.com","Ren Min Nan Lu Si Duan No.69","B",'2015-01-09','2018-01-26',"Left company"),
("Wan","Wang","789 565 701","NLB13","1470383-4238","82729343048@163.com","Sheng Yi Bin Shi Yi Bin Xian Tian Fu Hua Yuan","A",'2015-07-23','2017-12-14',"Left company"),
("Nan","Li","938 323 788","NLB14","028-86884100","29554194212@qq.com","Xing Hui Xi Lu 11hao Wan Fu Hua Yuan Room 909","B",'2015-12-23','2017-11-23',"Left company"),
("Jue","Wang","522 945 301","NLB15","028-85069183","70481805133@163.com","San Dong 2dan Yuan Room 780","B",'2016-02-06','2018-09-21',"Left company"),
("Ji","Zhang","606 223 134","NLB16","028-87007145","66312012053@qq.com","He Da Tian Ran Ji Building 54","A",'2016-04-05',NULL,"Currently Employed"),
("Min","Li","262 419 156","NLB17","1898180-6766","45887629941@qq.com","Tian Fu Ruan Jian Yuan No.56","A",'2016-01-15','2017-09-11',"Left company"),
("Qiong","Chen","649 605 632","NLB18","1848204-6083","67497063926@163.com","Gao Sheng Qiao Lu 9hao Luo Fu Guang Chang Room 708","B",'2017-03-04',NULL,"Currently Employed"),
("Ha","Dong","389 504 151","NLB19","1789815-4192","88613727839@163.com","Xin Shi Jie 2dong 2dan Yuan 17","B",'2017-08-09',NULL,"Currently Employed"),
("Fa","Liu","389 504 159","NLB20","028-88839475","73691064449@qq.com","Kang Ding Lu 1268long 1hao 90","B",'2018-09-21',NULL,"Currently Employed");

INSERT INTO DEAL(DEAL_DETAIL,ISSUE_DATE,TERMINATION_DATE)
VALUES
("Daily deal",'2020-01-09','2020-01-10'),
("Weekly deal",'2020-01-10','2020-01-17'),
("Monthly deal",'2020-01-11','2020-02-11'),
("Flash sale",'2020-01-11','2020-01-19'),
("Free gifts",'2020-02-01','2020-02-09'),
("Redeemable vouchers",'2020-02-10','2020-02-11'),
("Buy one, get one free",'2020-02-14','2020-02-15'),
("Bundles",'2020-02-20','2020-02-27'),
("Daily deal",'2020-02-21','2020-02-22'),
("Weekly deal",'2020-02-24','2020-02-28'),
("Monthly deal",'2020-03-01','2020-03-30'),
("Flash sale",'2020-03-03','2020-03-04'),
("Free gifts",'2020-03-09','2020-03-10'),
("Redeemable vouchers",'2020-03-11','2020-03-12'),
("Buy one, get one free",'2020-03-13','2020-03-14'),
("Bundles",'2020-03-15','2020-03-16'),
("Free gifts",'2020-03-17','2020-03-19'),
("Redeemable vouchers",'2020-03-20','2020-03-26'),
("Buy one, get one free",'2020-03-27','2020-03-30'),
("Bundles",'2020-03-31','2020-04-30');

INSERT INTO CUSTOMER(CUSTOMER_NAME,CUSTOMER_PHONE,CUSTOMER_EMAIL,CUSTOMER_MEMBERSHIP)
VALUES
("Wang Shi","1568000-1639","536126660660@qq.com","Regular"),
("Xiong Cai","1339810-4729","656453766263@qq.com","premium"),
("Liu Hua","1890800-5085","329635664852@qq.com","premium"),
("Wen Chao","1851280-7185","860439205220@sina.com","premium"),
("Xiao Jingyi","0839-4982040","706309819481@qq.com","Regular"),
("Chang Hu","0826-3247468","862374656239@sina.com","Regular"),
("Chen Jinyang","0838-3250622","514046354001@qq.com","Regular"),
("Geng Yun","0833-4218507","223691898182@sina.com","Premium"),
("Cao Zexian","0831-3139311","909599133392@qq.com","Premium"),
("Luo Yang","0816-5545848","319099442662@qq.com","Premium"),
("Wang ShiShi","1568000-1639","536126660660@qq.com","Regular"),
("Xiong Caiming","1339810-4729","656453766263@qq.com","premium"),
("Liu Huan","1890800-5085","329635664852@qq.com","premium"),
("Wen Chai","1851280-7185","860439205220@sina.com","premium"),
("Xiao Jing","0839-4982040","706309819481@qq.com","Regular"),
("Chang Huo","0826-3247468","862374656239@sina.com","Regular"),
("Chen Jinyan","0838-3250622","514046354001@qq.com","Regular"),
("Geng Yu","0833-4218507","223691898182@sina.com","Premium"),
("Cao Zexia","0831-3139311","909599133392@qq.com","Premium"),
("Luo Yan","0816-5545848","319099442662@qq.com","Premium");

INSERT INTO FEEDBACK(CUSTOMER_ID,CONTENT) 
VALUES 
(1,'More brands please'),
(2,'It would be nice if there were more deals'),
(2,'I think the store should diversify its offerings'),
(3,'I want more variety in terms of brands'),
(3,'Deals should last longer'),
(4,'Very Good'),
(5,'Pretty bags'),
(6,'Wow'),
(8,'I love the shoes'),
(2,'5 stars'),
(4,'Happy shopping'),
(7,'Haha, I got the boots'),
(9,'My wife loves the bag'),
(12,'My husband loves the shoes'),
(2,'Good'),
(5,'I will come again'),
(6,'Feeling good'),
(7,'Ahhh'),
(7,'love this store'),
(9,'Will recommend to my friends'),
(11,'Yeah'),
(16,'Hahahaha'),
(17,'Yeah yeah yeah');


INSERT INTO ORDER_INFO(EMP_NUM,ORDER_TYPE)
VALUES 
(2,'SALE'),
(2,'SALE'),
(2,'SALE'),
(2,'SALE'),
(3,'SALE'),
(3,'SALE'),
(4,'SALE'),
(4,'SALE'),
(5,'SALE'),
(5,'SALE'),
(1,'PURCHASE'),
(1,'PURCHASE'),
(1,'PURCHASE'),
(1,'PURCHASE'),
(1,'PURCHASE'),
(1,'PURCHASE'),
(1,'PURCHASE'),
(1,'PURCHASE'),
(1,'PURCHASE'),
(1,'PURCHASE'),
(1,'OUTBOUND'),
(1,'OUTBOUND'),
(1,'OUTBOUND'),
(1,'OUTBOUND'),
(1,'OUTBOUND'),
(1,'OUTBOUND'),
(1,'OUTBOUND'),
(1,'OUTBOUND'),
(1,'OUTBOUND'),
(1,'OUTBOUND');


INSERT INTO PURCHASE_ORDER VALUES (11, 'GuiRenNiao (China) Co., Ltd.');	
INSERT INTO PURCHASE_ORDER VALUES (12, 'Fujian SiTaFu industry Limited');
INSERT INTO PURCHASE_ORDER VALUES (13, 'Zhejiang Jinxu Leather Co. Ltd.');	
INSERT INTO PURCHASE_ORDER VALUES (14, 'Golden Jinhua Group Co. Ltd.');
INSERT INTO PURCHASE_ORDER VALUES (15, 'Guangzhou SatWeekend Leather Co. Ltd.');
INSERT INTO PURCHASE_ORDER VALUES (16, 'GuiRenNiao (China) Co., Ltd.');
INSERT INTO PURCHASE_ORDER VALUES (17, 'Fujian SiTaFu industry Limited');	
INSERT INTO PURCHASE_ORDER VALUES (18, 'Zhejiang Jinxu Leather Co. Ltd.');	
INSERT INTO PURCHASE_ORDER VALUES (19, 'Golden Jinhua Group Co. Ltd.');
INSERT INTO PURCHASE_ORDER VALUES (20, 'Guangzhou SatWeekend Leather Co. Ltd.');

INSERT INTO OUTBOUND_ORDER VALUES (21, 'WS2');
INSERT INTO OUTBOUND_ORDER VALUES (22, 'WS1');
INSERT INTO OUTBOUND_ORDER VALUES (23, 'WS2');
INSERT INTO OUTBOUND_ORDER VALUES (24, 'WS1');
INSERT INTO OUTBOUND_ORDER VALUES (25, 'WS1');
INSERT INTO OUTBOUND_ORDER VALUES (26, 'WS2');
INSERT INTO OUTBOUND_ORDER VALUES (27, 'WS1');
INSERT INTO OUTBOUND_ORDER VALUES (28, 'WS2');
INSERT INTO OUTBOUND_ORDER VALUES (29, 'WS1');
INSERT INTO OUTBOUND_ORDER VALUES (30, 'WS1');

INSERT INTO STORE_INVENTORY VALUES (1, 4, 'SS1', 'Top left');
INSERT INTO STORE_INVENTORY VALUES (2, 5, 'SS4', 'Bottom right');
INSERT INTO STORE_INVENTORY VALUES (3, 4, 'SS2', 'Top right');
INSERT INTO STORE_INVENTORY VALUES (4, 3, 'SS2', 'Top right');
INSERT INTO STORE_INVENTORY VALUES (5, 5, 'SS1', 'Top left');
INSERT INTO STORE_INVENTORY VALUES (7, 5, 'SS4', 'Bottom right');
INSERT INTO STORE_INVENTORY VALUES (8, 4, 'SS3', 'Bottom left');
INSERT INTO STORE_INVENTORY VALUES (9, 4, 'SS3', 'Botton left');
INSERT INTO STORE_INVENTORY VALUES (10, 5, 'SS1', 'Top left');
INSERT INTO STORE_INVENTORY VALUES (11,	4, 'SS1', 'Top left');
INSERT INTO STORE_INVENTORY VALUES (12,	5, 'SS4', 'Bottom right');
INSERT INTO STORE_INVENTORY VALUES (13,	4, 'SS2', 'Top right');
INSERT INTO STORE_INVENTORY VALUES (14,	3, 'SS2', 'Top right');
INSERT INTO STORE_INVENTORY VALUES (15,	5, 'SS1', 'Top left');
INSERT INTO STORE_INVENTORY VALUES (16,	4, 'SS2', 'Top right');
INSERT INTO STORE_INVENTORY VALUES (17,	5, 'SS4', 'Bottom right');
INSERT INTO STORE_INVENTORY VALUES (18,	4, 'SS3', 'Bottom left');
INSERT INTO STORE_INVENTORY VALUES (19,	4, 'SS3', 'Botton left');
INSERT INTO STORE_INVENTORY VALUES (20,	5, 'SS1', 'Top left');

INSERT INTO WAREHOUSE_INVENTORY VALUES (1, 20, 'WS1', 'Top left');
INSERT INTO WAREHOUSE_INVENTORY VALUES (2, 10, 'WS1', 'Top left');
INSERT INTO WAREHOUSE_INVENTORY VALUES (3, 15, 'WS1', 'Top left');
INSERT INTO WAREHOUSE_INVENTORY VALUES (4, 10, 'WS2', 'Top right');
INSERT INTO WAREHOUSE_INVENTORY VALUES (5, 25, 'WS2', 'Top right');
INSERT INTO WAREHOUSE_INVENTORY VALUES (6, 10, 'WS1', 'Top left');
INSERT INTO WAREHOUSE_INVENTORY VALUES (7, 15, 'WS2', 'Top right');
INSERT INTO WAREHOUSE_INVENTORY VALUES (8, 25, 'WS1', 'Top left');
INSERT INTO WAREHOUSE_INVENTORY VALUES (9, 10, 'WS1', 'Top left');
INSERT INTO WAREHOUSE_INVENTORY VALUES (10, 25, 'WS2', 'Top right');
INSERT INTO WAREHOUSE_INVENTORY VALUES (11, 20, 'WS1', 'Top left');
INSERT INTO WAREHOUSE_INVENTORY VALUES (12, 10, 'WS1', 'Top left');
INSERT INTO WAREHOUSE_INVENTORY VALUES (13, 15, 'WS1', 'Top left');
INSERT INTO WAREHOUSE_INVENTORY VALUES (14, 10, 'WS2', 'Top right');
INSERT INTO WAREHOUSE_INVENTORY VALUES (15, 25, 'WS2', 'Top right');
INSERT INTO WAREHOUSE_INVENTORY VALUES (16, 10, 'WS1', 'Top left');
INSERT INTO WAREHOUSE_INVENTORY VALUES (17, 15, 'WS2', 'Top right');
INSERT INTO WAREHOUSE_INVENTORY VALUES (18, 25, 'WS1', 'Top left');
INSERT INTO WAREHOUSE_INVENTORY VALUES (19, 10, 'WS1', 'Top left');
INSERT INTO WAREHOUSE_INVENTORY VALUES (20, 25, 'WS2', 'Top right');

INSERT INTO ORDER_PRODUCT VALUES (1, 1, 3);
INSERT INTO ORDER_PRODUCT VALUES (1, 2, 3);
INSERT INTO ORDER_PRODUCT VALUES (2, 2, 6);
INSERT INTO ORDER_PRODUCT VALUES (2, 4, 6);
INSERT INTO ORDER_PRODUCT VALUES (3, 3, 2);
INSERT INTO ORDER_PRODUCT VALUES (3, 9, 2);
INSERT INTO ORDER_PRODUCT VALUES (4, 4, 2);
INSERT INTO ORDER_PRODUCT VALUES (5, 5, 3);
INSERT INTO ORDER_PRODUCT VALUES (6, 6, 2);
INSERT INTO ORDER_PRODUCT VALUES (7, 7, 2);
INSERT INTO ORDER_PRODUCT VALUES (8, 8, 4);
INSERT INTO ORDER_PRODUCT VALUES (9, 9, 1);
INSERT INTO ORDER_PRODUCT VALUES (10, 10, 2);
INSERT INTO ORDER_PRODUCT VALUES (11, 11, 7);
INSERT INTO ORDER_PRODUCT VALUES (12, 12, 6);
INSERT INTO ORDER_PRODUCT VALUES (13, 13, 2);
INSERT INTO ORDER_PRODUCT VALUES (14, 14, 2);
INSERT INTO ORDER_PRODUCT VALUES (15, 15, 4);
INSERT INTO ORDER_PRODUCT VALUES (16, 16, 3);
INSERT INTO ORDER_PRODUCT VALUES (17, 17, 6);
INSERT INTO ORDER_PRODUCT VALUES (18, 18, 2);
INSERT INTO ORDER_PRODUCT VALUES (19, 19, 2);
INSERT INTO ORDER_PRODUCT VALUES (20, 20, 3);
INSERT INTO ORDER_PRODUCT VALUES (21, 16, 2);
INSERT INTO ORDER_PRODUCT VALUES (22, 17, 2);
INSERT INTO ORDER_PRODUCT VALUES (23, 18, 4);
INSERT INTO ORDER_PRODUCT VALUES (24, 19, 1);
INSERT INTO ORDER_PRODUCT VALUES (25, 20, 2);
INSERT INTO ORDER_PRODUCT VALUES (26, 14, 7);
INSERT INTO ORDER_PRODUCT VALUES (27, 15, 6);
INSERT INTO ORDER_PRODUCT VALUES (28, 16, 2);
INSERT INTO ORDER_PRODUCT VALUES (29, 17, 2);
INSERT INTO ORDER_PRODUCT VALUES (30, 18, 4);

INSERT INTO SALES_ORDER VALUES (1, 2, 1);
INSERT INTO SALES_ORDER VALUES (2, 2, 2);
INSERT INTO SALES_ORDER VALUES (3, 3, 3);
INSERT INTO SALES_ORDER VALUES (4, 3, 4);
INSERT INTO SALES_ORDER VALUES (5, 4, 5);
INSERT INTO SALES_ORDER VALUES (6, 5, 6);
INSERT INTO SALES_ORDER VALUES (7, 5, 7);
INSERT INTO SALES_ORDER VALUES (8, 6, 8);
INSERT INTO SALES_ORDER VALUES (9, 6, 9);
INSERT INTO SALES_ORDER VALUES (10, 7, 10);
