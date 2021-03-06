USE [master]
GO
/****** Object:  Database [RestaurantMenu]    Script Date: 4/7/2021 19:37:03 ******/
CREATE DATABASE [RestaurantMenu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RestaurantMenu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\RestaurantMenu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RestaurantMenu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\RestaurantMenu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RestaurantMenu] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RestaurantMenu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RestaurantMenu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RestaurantMenu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RestaurantMenu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RestaurantMenu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RestaurantMenu] SET ARITHABORT OFF 
GO
ALTER DATABASE [RestaurantMenu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RestaurantMenu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RestaurantMenu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RestaurantMenu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RestaurantMenu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RestaurantMenu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RestaurantMenu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RestaurantMenu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RestaurantMenu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RestaurantMenu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RestaurantMenu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RestaurantMenu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RestaurantMenu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RestaurantMenu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RestaurantMenu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RestaurantMenu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RestaurantMenu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RestaurantMenu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RestaurantMenu] SET  MULTI_USER 
GO
ALTER DATABASE [RestaurantMenu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RestaurantMenu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RestaurantMenu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RestaurantMenu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RestaurantMenu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RestaurantMenu] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RestaurantMenu] SET QUERY_STORE = OFF
GO
USE [RestaurantMenu]
GO
/****** Object:  User [restuarantmenu]    Script Date: 4/7/2021 19:37:03 ******/
CREATE USER [restuarantmenu] FOR LOGIN [restaurantmenu] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [restuarantmenu]
GO
ALTER ROLE [db_datareader] ADD MEMBER [restuarantmenu]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [restuarantmenu]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 4/7/2021 19:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[Id_Area] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[Id_Area] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/7/2021 19:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id_Category] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Image] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id_Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 4/7/2021 19:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredient](
	[Id_Ingredient] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Image] [varchar](max) NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Ingredient] PRIMARY KEY CLUSTERED 
(
	[Id_Ingredient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meal]    Script Date: 4/7/2021 19:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meal](
	[Id_Meal] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Image] [varchar](max) NOT NULL,
	[Preparation] [text] NOT NULL,
	[id_Area] [int] NOT NULL,
	[id_Category] [int] NOT NULL,
 CONSTRAINT [PK_Meal] PRIMARY KEY CLUSTERED 
(
	[Id_Meal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealIngredient]    Script Date: 4/7/2021 19:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealIngredient](
	[Id_MealIngredient] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [varchar](150) NOT NULL,
	[id_Meal] [int] NOT NULL,
	[id_Ingredient] [int] NOT NULL,
 CONSTRAINT [PK_MealIngredient] PRIMARY KEY CLUSTERED 
(
	[Id_MealIngredient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealTag]    Script Date: 4/7/2021 19:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealTag](
	[Id_MealTag] [int] IDENTITY(1,1) NOT NULL,
	[id_Meal] [int] NOT NULL,
	[id_Tag] [int] NOT NULL,
 CONSTRAINT [PK_MealTag] PRIMARY KEY CLUSTERED 
(
	[Id_MealTag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 4/7/2021 19:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Id_Tag] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[Id_Tag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([Id_Area], [Name]) VALUES (1, N'British')
INSERT [dbo].[Area] ([Id_Area], [Name]) VALUES (2, N'Canadian')
INSERT [dbo].[Area] ([Id_Area], [Name]) VALUES (1006, N'Malaysian')
INSERT [dbo].[Area] ([Id_Area], [Name]) VALUES (1007, N'Chinese')
INSERT [dbo].[Area] ([Id_Area], [Name]) VALUES (1008, N'Indian')
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id_Category], [Name], [Image]) VALUES (1, N'Beef', N'https://www.themealdb.com/images/category/Beef.png')
INSERT [dbo].[Category] ([Id_Category], [Name], [Image]) VALUES (2, N'Dessert', N'https://www.themealdb.com/images/category/Dessert.png')
INSERT [dbo].[Category] ([Id_Category], [Name], [Image]) VALUES (1004, N'Chicken', N'https://www.themealdb.com/images/category/Chicken.png')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingredient] ON 

INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (1, N'Mushrooms', N'https://www.themealdb.com/images/ingredients/mushrooms.png', N'Los hongos deben ser frescos y especificamente de los mostrados en la imagen')
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2, N'English Mustard', N'https://www.themealdb.com/images/ingredients/English%20Mustard.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (3, N'Olive Oil', N'https://www.themealdb.com/images/ingredients/Olive%20Oil.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (4, N'Beef Fillet', N'https://www.themealdb.com/images/ingredients/Beef%20Fillet.png
', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (5, N'Parma Ham', N'https://www.themealdb.com/images/ingredients/Parma%20ham.png
', N'El jamon debe estar fresco')
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (6, N'Puff Pastry', N'https://www.themealdb.com/images/ingredients/Puff%20Pastry.png
', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (7, N'Flour', N'https://www.themealdb.com/images/ingredients/Flour.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (8, N'Egg Yolks', N'https://www.themealdb.com/images/ingredients/Egg%20Yolks.png
', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (9, N'Shortcrust Pastry', N'https://www.themealdb.com/images/ingredients/Shortcrust%20Pastry.png
', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (10, N'Eggs ', N'https://www.themealdb.com/images/ingredients/Eggs.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (11, N'Muscovado Sugar', N'https://www.themealdb.com/images/ingredients/Muscovado%20Sugar.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (12, N'Raisins', N'https://www.themealdb.com/images/ingredients/Raisins.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (13, N'Vanilla Extract', N'https://www.themealdb.com/images/ingredients/Vanilla%20Extract.png
', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (14, N'Butter', N'https://www.themealdb.com/images/ingredients/Butter.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (15, N'Single Cream', N'https://www.themealdb.com/images/ingredients/Single%20Cream.png
', N'Debe estar fresca')
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (16, N'Walnuts', N'https://www.themealdb.com/images/ingredients/Walnuts.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2018, N'Broccoli', N'https://www.themealdb.com/images/ingredients/Broccoli.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2019, N'Potatoes', N'https://www.themealdb.com/images/ingredients/Potatoes.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2020, N'Carrots', N'https://www.themealdb.com/images/ingredients/Carrots.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2021, N'Plain Flour', N'https://www.themealdb.com/images/ingredients/Plain%20Flour.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2022, N'Milk', N'https://www.themealdb.com/images/ingredients/Milk.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2023, N'Sunflower Oil', N'https://www.themealdb.com/images/ingredients/Sunflower%20Oil.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2024, N'Beef', N'https://www.themealdb.com/images/ingredients/Beef.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2025, N'Oil', N'https://www.themealdb.com/images/ingredients/Oil.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2026, N'Baking Powder', N'https://www.themealdb.com/images/ingredients/Baking%20Powder.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2027, N'Salt', N'https://www.themealdb.com/images/ingredients/Salt.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2028, N'Unsalted Butter', N'https://www.themealdb.com/images/ingredients/Unsalted%20Butter.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2029, N'Sugar', N'https://www.themealdb.com/images/ingredients/Sugar.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2030, N'Peanut Butter', N'https://www.themealdb.com/images/ingredients/Peanut%20Butter.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2031, N'Chicken', N'https://www.themealdb.com/images/ingredients/Chicken.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2032, N'Pepper', N'https://www.themealdb.com/images/ingredients/Pepper.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2033, N'Ginger Cordial', N'https://www.themealdb.com/images/ingredients/Ginger%20Cordial.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2034, N'Ginger', N'https://www.themealdb.com/images/ingredients/Ginger.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2035, N'Spring Onions', N'https://www.themealdb.com/images/ingredients/Spring%20Onions.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2036, N'Rice', N'https://www.themealdb.com/images/ingredients/Rice.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2037, N'Water', N'https://www.themealdb.com/images/ingredients/Water.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2038, N'Coriander', N'https://www.themealdb.com/images/ingredients/Coriander.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2039, N'Red Chilli', N'https://www.themealdb.com/images/ingredients/Red%20Chilli.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2040, N'Garlic', N'https://www.themealdb.com/images/ingredients/Garlic.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2041, N'Chicken Breast', N'https://www.themealdb.com/images/ingredients/Chicken%20Breasts.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2042, N'Chicken Stock', N'https://www.themealdb.com/images/ingredients/Chicken%20Stock.png', NULL)
INSERT [dbo].[Ingredient] ([Id_Ingredient], [Name], [Image], [Description]) VALUES (2043, N'Greek Yogurt', N'https://www.themealdb.com/images/ingredients/Greek%20Yogurt.png', NULL)
SET IDENTITY_INSERT [dbo].[Ingredient] OFF
GO
SET IDENTITY_INSERT [dbo].[Meal] ON 

INSERT [dbo].[Meal] ([Id_Meal], [Name], [Image], [Preparation], [id_Area], [id_Category]) VALUES (2, N'Beef Wellington', N'https://www.themealdb.com/images/media/meals/vvpprx1487325699.jpg', N'Put the mushrooms into a food processor with some seasoning and pulse to a rough paste. Scrape the paste into a pan and cook over a high heat for about 10 mins, tossing frequently, to cook out the moisture from the mushrooms. Spread out on a plate to cool. Heat in a frying pan and add a little olive oil. Season the beef and sear in the hot pan for 30 secs only on each side. (You don''t want to cook it at this stage, just colour it). Remove the beef from the pan and leave to cool, then brush all over with the mustard. Lay a sheet of cling film on a work surface and arrange the Parma ham slices on it, in slightly overlapping rows. With a palette knife, spread the mushroom paste over the ham, then place the seared beef fillet in the middle. Keeping a tight hold of the cling film from the edge, neatly roll the Parma ham and mushrooms around the beef to form a tight barrel shape. Twist the ends of the cling film to secure. Chill for 15-20 mins to allow the beef to set and keep its shape. Roll out the puff pastry on a floured surface to a large rectangle, the thickness of a £1 coin. Remove the cling film from the beef, then lay in the centre. Brush the surrounding pastry with egg yolk. Fold the ends over, the wrap the pastry around the beef, cutting off any excess. Turn over, so the seam is underneath, and place on a baking sheet. Brush over all the pastry with egg and chill for about 15 mins to let the pastry rest. Heat the oven to 200C, 400F, gas 6. Lightly score the pastry at 1cm intervals and glaze again with beaten egg yolk. Bake for 20 minutes, then lower the oven setting to 180C, 350F, gas 4 and cook for another 15 mins. Allow to rest for 10-15 mins before slicing and serving with the side dishes of your choice. The beef should still be pink in the centre when you serve it.', 1, 1)
INSERT [dbo].[Meal] ([Id_Meal], [Name], [Image], [Preparation], [id_Area], [id_Category]) VALUES (3, N'Canadian Butter Tarts', N'https://www.themealdb.com/images/media/meals/wpputp1511812960.jpg', N'Preheat the oven to fan 170C/ conventional 190C/gas 5. Roll out the pastry on a lightly floured surface so it’s slightly thinner than straight from the pack. Then cut out 18-20 rounds with a 7.5cm fluted cutter, re-rolling the trimmings. Use the rounds to line two deep 12-hole tart tins (not muffin tins). If you only have a regular-sized, 12-hole tart tin you will be able to make a few more slightly shallower tarts. Beat the eggs in a large bowl and combine with the rest of the ingredients except the walnuts. Tip this mixture into a pan and stir continuously for 3-4 minutes until the butter melts, and the mixture bubbles and starts to thicken. It should be thick enough to coat the back of a wooden spoon. Don’t overcook, and be sure to stir all the time as the mixture can easily burn. Remove from the heat and stir in the nuts. Spoon the filling into the unbaked tart shells so it’s level with the pastry. Bake for 15-18 minutes until set and pale golden. Leave in the tin to cool for a few minutes before lifting out on to a wire rack. Serve warm or cold.', 2, 2)
INSERT [dbo].[Meal] ([Id_Meal], [Name], [Image], [Preparation], [id_Area], [id_Category]) VALUES (2008, N'Beef Sunday Roast', N'https://www.themealdb.com/images/media/meals/ssrrrs1503664277.jpg', N'Cook the Broccoli and Carrots in a pan of boiling water until tender.
Roast the Beef and Potatoes in the oven for 45mins, the potatoes may need to be checked regularly to not overcook.
To make the Yorkshire puddings: Heat oven to 230C/fan 210C/gas 8.
Drizzle a little sunflower oil evenly into 2 x 4-hole Yorkshire pudding tins or a 12-hole non-stick muffin tin and place in the oven to heat through To make the batter, tip 140g plain flour into a bowl and beat in four eggs until smooth.
Gradually add 200ml milk and carry on beating until the mix is completely lump-free.
Season with salt and pepper.
Pour the batter into a jug, then remove the hot tins from the oven.
Carefully and evenly pour the batter into the holes.
Place the tins back in the oven and leave undisturbed for 20-25 mins until the puddings have puffed up and browned.
Serve immediately.
Plate up and add the Gravy as desired.', 1, 1)
INSERT [dbo].[Meal] ([Id_Meal], [Name], [Image], [Preparation], [id_Area], [id_Category]) VALUES (2009, N'Apam balik', N'https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg', N'Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly. Spread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear. Add butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned. Cut into wedges and best eaten when it is warm.', 1006, 2)
INSERT [dbo].[Meal] ([Id_Meal], [Name], [Image], [Preparation], [id_Area], [id_Category]) VALUES (2012, N'Chicken Congee', N'https://www.themealdb.com/images/media/meals/1529446352.jpg', N'STEP 1 - MARINATING THE CHICKEN In a bowl, add chicken, salt, white pepper, ginger juice and then mix it together well. Set the chicken aside. STEP 2 - RINSE THE WHITE RICE Rinse the rice in a metal bowl or pot a couple times and then drain the water. STEP 2 - BOILING THE WHITE RICE Next add 8 cups of water and then set the stove on high heat until it is boiling. Once rice porridge starts to boil, set the stove on low heat and then stir it once every 8-10 minutes for around 20-25 minutes. After 25 minutes, this is optional but you can add a little bit more water to make rice porridge to make it less thick or to your preference. Next add the marinated chicken to the rice porridge and leave the stove on low heat for another 10 minutes. After an additional 10 minutes add the green onions, sliced ginger, 1 pinch of salt, 1 pinch of white pepper and stir for 10 seconds. Serve the rice porridge in a bowl Optional: add Coriander on top of the rice porridge.', 1007, 1004)
INSERT [dbo].[Meal] ([Id_Meal], [Name], [Image], [Preparation], [id_Area], [id_Category]) VALUES (2014, N'Nutty Chicken Curry', N'https://www.themealdb.com/images/media/meals/yxsurp1511304301.jpg', N'Finely slice a quarter of the chilli, then put the rest in a food processor with the ginger, garlic, coriander stalks and one-third of the leaves. Whizz to a rough paste with a splash of water if needed. Heat the oil in a frying pan, then quickly brown the chicken chunks for 1 min. Stir in the paste for another min, then add the peanut butter, stock and yogurt. When the sauce is gently bubbling, cook for 10 mins until the chicken is just cooked through and sauce thickened. Stir in most of the remaining coriander, then scatter the rest on top with the chilli, if using. Eat with rice or mashed sweet potato.', 1008, 1004)
SET IDENTITY_INSERT [dbo].[Meal] OFF
GO
SET IDENTITY_INSERT [dbo].[MealIngredient] ON 

INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1, N'400g', 2, 1)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (2, N'1-2tbsp', 2, 2)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (3, N'Dash', 2, 3)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (4, N'750g piece', 2, 4)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (5, N'6-8 slices', 2, 5)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (6, N'500g', 2, 6)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (7, N'Dusting', 2, 7)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (8, N'2 Beaten', 2, 8)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (9, N'375g', 3, 9)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (10, N'2 large', 3, 10)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (11, N'175g', 3, 11)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (12, N'100g', 3, 12)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (13, N'1tps', 3, 13)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (14, N'50g', 3, 14)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (15, N'4 tps', 3, 15)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (16, N'50g', 3, 16)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1018, N'8 slices', 2008, 2024)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1019, N'12 florets', 2008, 2018)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1020, N'1 Packet', 2008, 2019)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1021, N'1 Packet', 2008, 2020)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1022, N'140g', 2008, 2021)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1023, N'4', 2008, 10)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1024, N'200ml', 2008, 2022)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1025, N'drizzle(for cooking)', 2008, 2023)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1026, N'200ml', 2009, 2022)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1027, N'60ml', 2009, 2025)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1028, N'2', 2009, 10)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1029, N'1600g', 2009, 7)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1030, N'3tps', 2009, 2026)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1031, N'1/2tps', 2009, 2027)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1032, N'25g', 2009, 2028)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1033, N'45g', 2009, 2029)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1034, N'3tbs', 2009, 2030)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1035, N'8 oz', 2012, 2031)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1036, N'pinch', 2012, 2027)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1037, N'pinch', 2012, 2032)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1039, N'1 tps', 2012, 2033)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1040, N'1 tps', 2012, 2034)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1041, N'1 tps', 2012, 2035)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1042, N'1/2 cup ', 2012, 2036)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1043, N'8 cups', 2012, 2037)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1044, N'2 oz', 2012, 2038)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1046, N'1 large', 2014, 2039)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1047, N'0.5', 2014, 2034)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1048, N'1 large ', 2014, 2040)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1049, N'Bunch', 2014, 2038)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1050, N'1 tbsp', 2014, 2023)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1051, N'4', 2014, 2041)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1052, N'5 tblsp', 2014, 2030)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1053, N'150ml', 2014, 2042)
INSERT [dbo].[MealIngredient] ([Id_MealIngredient], [Quantity], [id_Meal], [id_Ingredient]) VALUES (1054, N'200g', 2014, 2043)
SET IDENTITY_INSERT [dbo].[MealIngredient] OFF
GO
SET IDENTITY_INSERT [dbo].[MealTag] ON 

INSERT [dbo].[MealTag] ([Id_MealTag], [id_Meal], [id_Tag]) VALUES (2, 2, 1)
INSERT [dbo].[MealTag] ([Id_MealTag], [id_Meal], [id_Tag]) VALUES (3, 2, 2)
INSERT [dbo].[MealTag] ([Id_MealTag], [id_Meal], [id_Tag]) VALUES (4, 3, 3)
INSERT [dbo].[MealTag] ([Id_MealTag], [id_Meal], [id_Tag]) VALUES (5, 3, 4)
INSERT [dbo].[MealTag] ([Id_MealTag], [id_Meal], [id_Tag]) VALUES (6, 3, 5)
INSERT [dbo].[MealTag] ([Id_MealTag], [id_Meal], [id_Tag]) VALUES (7, 3, 6)
INSERT [dbo].[MealTag] ([Id_MealTag], [id_Meal], [id_Tag]) VALUES (8, 2008, 1008)
SET IDENTITY_INSERT [dbo].[MealTag] OFF
GO
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([Id_Tag], [Name]) VALUES (1, N'Meat')
INSERT [dbo].[Tag] ([Id_Tag], [Name]) VALUES (2, N'Stew')
INSERT [dbo].[Tag] ([Id_Tag], [Name]) VALUES (3, N'Speciality')
INSERT [dbo].[Tag] ([Id_Tag], [Name]) VALUES (4, N'Snack')
INSERT [dbo].[Tag] ([Id_Tag], [Name]) VALUES (5, N'Dessert')
INSERT [dbo].[Tag] ([Id_Tag], [Name]) VALUES (6, N'Pudding')
INSERT [dbo].[Tag] ([Id_Tag], [Name]) VALUES (1008, N'Main Meal')
SET IDENTITY_INSERT [dbo].[Tag] OFF
GO
ALTER TABLE [dbo].[Meal]  WITH CHECK ADD  CONSTRAINT [FK_Meal_Area] FOREIGN KEY([id_Area])
REFERENCES [dbo].[Area] ([Id_Area])
GO
ALTER TABLE [dbo].[Meal] CHECK CONSTRAINT [FK_Meal_Area]
GO
ALTER TABLE [dbo].[Meal]  WITH CHECK ADD  CONSTRAINT [FK_Meal_Category] FOREIGN KEY([id_Category])
REFERENCES [dbo].[Category] ([Id_Category])
GO
ALTER TABLE [dbo].[Meal] CHECK CONSTRAINT [FK_Meal_Category]
GO
ALTER TABLE [dbo].[MealIngredient]  WITH CHECK ADD  CONSTRAINT [FK_MealIngredient_Ingredient] FOREIGN KEY([id_Ingredient])
REFERENCES [dbo].[Ingredient] ([Id_Ingredient])
GO
ALTER TABLE [dbo].[MealIngredient] CHECK CONSTRAINT [FK_MealIngredient_Ingredient]
GO
ALTER TABLE [dbo].[MealIngredient]  WITH CHECK ADD  CONSTRAINT [FK_MealIngredient_Meal] FOREIGN KEY([id_Meal])
REFERENCES [dbo].[Meal] ([Id_Meal])
GO
ALTER TABLE [dbo].[MealIngredient] CHECK CONSTRAINT [FK_MealIngredient_Meal]
GO
ALTER TABLE [dbo].[MealTag]  WITH CHECK ADD  CONSTRAINT [FK_MealTag_Meal] FOREIGN KEY([id_Meal])
REFERENCES [dbo].[Meal] ([Id_Meal])
GO
ALTER TABLE [dbo].[MealTag] CHECK CONSTRAINT [FK_MealTag_Meal]
GO
ALTER TABLE [dbo].[MealTag]  WITH CHECK ADD  CONSTRAINT [FK_MealTag_Tag] FOREIGN KEY([id_Tag])
REFERENCES [dbo].[Tag] ([Id_Tag])
GO
ALTER TABLE [dbo].[MealTag] CHECK CONSTRAINT [FK_MealTag_Tag]
GO
USE [master]
GO
ALTER DATABASE [RestaurantMenu] SET  READ_WRITE 
GO
