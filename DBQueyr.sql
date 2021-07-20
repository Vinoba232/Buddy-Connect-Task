create database Inventory
use Inventory

create table Product
(
ProductId int primary key identity,
Name varchar(50),
Description varchar(500),
Price money,
DiscountPercentage varchar(4)
)

create table Customer
(
CustomerId int Primary key identity(1000,1),
Name varchar (50),
Address  varchar(200),
ContactNo varchar(10)
)
create table PurchaseOrder
(
PurchaseOrderId int primary key identity(100,1),
CustomerId int foreign key references Customer(CustomerId),
Date date,
Amount money
)
create table PurchaseOrderDetail
(
PodId int primary key identity,
PurchaseOrderId int foreign key references PurchaseOrder(PurchaseOrderId),
ProductId int foreign key references Product(ProductId),
Price money,
Quantity int
)

insert into Product values('Lakme Eyeconic Kajal','Deep black, water proof,22 hrs smudge proof',190,'5%')
insert into Product values('Maybelline New york Baby lips','Color: Red, Shade: Pink, Ideal For: Women, Quantity: 31.2 g',150,'15%')
insert into Product values('Lakmé Insta Eye Liner','Non Organic, Waterproof, Liquid, Smudge Proof, Tip Type: Brush',110,'25%')
insert into Product values('Lakme Compact Powder','Rose Face Powder, Quantity: 40 g, Shade: 01 soft pink',127,'5%')
insert into Product values('DeBelle Nail Hardener','Quantity: 15 ml; Color: Transparent, Made in India',610,'5%')
insert into Product values('Spinz BB cream','Brightening & Beauty Fairness Cream 29g',105,'25%')
insert into Product values('Himalaya Purifying Neem Face Wash','Applied For: Anti-acne & Pimples, Deep Cleansing, Blackhead Remover, Spot Removal, Oil Control',109,'5%')
insert into Product values('Lakmé Nail Color Remover','Enriched with Vitamin E. Acetone Free',80,'10%')
insert into Product values('Lakme Forever Matte Liquid Lip Colour','Red Carpet, 5.6ml',450,'5%')
insert into Product values('Lakmé Absolute Plush Matte Lip Crayon','Pink Party, 2.8 g',760,'5%')
insert into Product values('Huda Beauty Lip crayon','Mate mini lipsticks',249,'5%')
insert into Product values('Rosedale Eyeshadow Palette ','Urban Decay Ultimate Pro Eyeshadow Palette',125,'20%')
insert into Product values('Eyetex Dazller Mascara','Lengthening Mascara, Shade: Black, Waterproof',98,'5%')
insert into Product values('Maybelline New York Hypercurl Mascara ','Waterproof, Non Organic,With Primer',258,'5%')
insert into Product values('Verymiss Premium Nail Polish','Finish Matte, Color: Nude, 6 ml',85,'5%')
insert into Product values('Maybelline New York Colossal Kajal','Pencil Form, 24 hrs Smudge Proof, Quantity: 0.35 g',168,'5%')
insert into Product values('Rose Gold Eyeshadow Palette','Water Proof, 15 Colors',120,'5%')
insert into Product values('Eyetex Dazler Kajal','Deep black, water proof',85,'5%')


insert into Customer values('Aruvi','No.3,Kamaraj Street,Adyar', '9840384712')
insert into Customer values('Draupadi','No.1,Othavadai Street, Mamallapuram', '9003155617')
insert into Customer values('Arjun','No.22,Arjunan Penance, Mahabhalipuram', '6383763236')
insert into Customer values('Subathirai','No.5,South Avenue, Thiruvanmiyur', '9761234586')
insert into Customer values('Gandhari','No.33/7,Kamaraj Street, Guindy', '9860374712')
insert into Customer values('Abhimanyu','No.2,South Avenue, Thiruvanmiyur', '9840384002')
insert into Customer values('Hermione','No.17,Anna nagar, Kalpakkam', '7840384712')
insert into Customer values('Ginny','No.15,Vannandurai, Adyar', '6740384654')
insert into Customer values('Luna','No.6,Mettu street, Guindy', '7840340987')
insert into Customer values('Harry','No.56,Avenue Street, Adyar', '6840384123')
insert into Customer values('Vinoba','No.4,Yadhava Street, Thiruvanmiyur', '7740384711')
insert into Customer values('Chandler','No.3,Nehru Street, Medavakkam', '6340384324')
insert into Customer values('Joey','No.2,Gandhi Street, Shollinganalur', '7334038471')
insert into Customer values('Ross','No.9,Nethaji Street, Neelangarai', '7240384222')
insert into Customer values('Monica','No.35,Raamar Street, Kovalam', '6840384617')
insert into Customer values('Phoebe','No.22,Abhimanyu Street, Kanathur', '6640384706')
insert into Customer values('Rachel','No.42,Madha Koyil Street, Besant Nagar', '6340384675')
insert into Customer values('Wanda','No.24,Vedhachalam Street, Tambaram', '6740384776')
insert into Customer values('Natasha','No.44,Gandhi Street, Kelambakkam', '6340384654')
insert into Customer values('Poonguzhali','No.1,Kamaraj Street, velacherry', '9940384943')


insert into PurchaseOrder values(1000,'2021/03/21',268)
insert into PurchaseOrder values(1001,'2021/03/12',1000)
insert into PurchaseOrder values(1007,'2021/02/24',540)
insert into PurchaseOrder values(1004,'2021/02/11',190)
insert into PurchaseOrder values(1005,'2021/04/02',1500)
insert into PurchaseOrder values(1006,'2021/12/6',85)
insert into PurchaseOrder values(1002,'2021/04/30',360)
insert into PurchaseOrder values(1010,'2021/12/15',90)
insert into PurchaseOrder values(1008,'2021/10/23',520)
insert into PurchaseOrder values(1012,'2021/10/10',110)
insert into PurchaseOrder values(1009,'2021/03/31',168)
insert into PurchaseOrder values(1014,'2021/02/20',440)
insert into PurchaseOrder values(1015,'2021/10/28',640)



insert into PurchaseOrderDetail values(100,1,190,1)
insert into PurchaseOrderDetail values(102,2,300,2)
insert into PurchaseOrderDetail values(102,8,240,3)
insert into PurchaseOrderDetail values(109,9,900,2)
insert into PurchaseOrderDetail values(110,3,220,2)
insert into PurchaseOrderDetail values(103,2,600,4)
insert into PurchaseOrderDetail values(100,4,127,1)
insert into PurchaseOrderDetail values(104,7,1000,5)
insert into PurchaseOrderDetail values(107,14,268,1)
insert into PurchaseOrderDetail values(106,15,85,1)
insert into PurchaseOrderDetail values(105,17,540,2)
insert into PurchaseOrderDetail values(111,16,168,1)
insert into PurchaseOrderDetail values(103,18,90,1)
