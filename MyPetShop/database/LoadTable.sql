USE [MyPetShop]

INSERT INTO [Category] VALUES ('Fish', 'Fish')
INSERT INTO [Category] VALUES ('Backyard','Backyard')
INSERT INTO [Category] VALUES ('Birds', 'Birds')
INSERT INTO [Category] VALUES ('Bugs', 'Bugs')
INSERT INTO [Category] VALUES ('Endangered', 'Endangered')

INSERT INTO [Supplier] VALUES ('XYZ Pets', '600 Avon Way', '', 'Los Angeles', 'CA', '94024', '212-947-0797')
INSERT INTO [Supplier] VALUES ('ABC Pets', '700 Abalone Way', '', 'San Francisco', 'CA', '94024', '415-947-0797')

INSERT INTO [Product] VALUES (1,12.1,11.4,1,'Meno','Meno','~/Prod_Images/Fish/meno.gif',100)
INSERT INTO [Product] VALUES (1,28.5,25.5,1,'Eucalyptus','Eucalyptus','~/Prod_Images/Fish/eucalyptus.gif',100)
INSERT INTO [Product] VALUES (2,23.4,11.4,1,'Ant','Ant','~/Prod_Images/Bugs/ant.gif',100)
INSERT INTO [Product] VALUES (2,24.7,22.2,1,'Butterfly','Butterfly','~/Prod_Images/Bugs/butterfly.gif',100)
INSERT INTO [Product] VALUES (3,38.5,37.2,1,'Cat','Cat','~/Prod_Images/Backyard/cat.gif',100)
INSERT INTO [Product] VALUES (3,40.4,38.7,1,'Zebra','Zebra','~/Prod_Images/Backyard/zebra.gif',100)
INSERT INTO [Product] VALUES (4,45.5,44.2,1,'Domestic','Domestic','~/Prod_Images/Birds/domestic.gif',100)
INSERT INTO [Product] VALUES (4,22.2,23.5,1,'Flowerloving','Flowerloving','~/Prod_Images/Birds/flowerloving.gif',100)
INSERT INTO [Product] VALUES (5,47.7,45.5,1,'Panda','Panda','~/Prod_Images/Endangered/panda.gif',100)
INSERT INTO [Product] VALUES (5,35.5,33.5,1,'Pointy','Pointy','~/Prod_Images/Endangered/pointy.gif',100)
