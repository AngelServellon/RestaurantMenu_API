USE [master]
GO
/****** Object:  Database [RestaurantMenu]    Script Date: 12/4/2021 22:37:20 ******/
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
/****** Object:  User [restuarantmenu]    Script Date: 12/4/2021 22:37:21 ******/
CREATE USER [restuarantmenu] FOR LOGIN [restaurantmenu] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [restuarantmenu]
GO
ALTER ROLE [db_datareader] ADD MEMBER [restuarantmenu]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [restuarantmenu]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 12/4/2021 22:37:21 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 12/4/2021 22:37:21 ******/
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
/****** Object:  Table [dbo].[Ingredient]    Script Date: 12/4/2021 22:37:21 ******/
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
/****** Object:  Table [dbo].[Meal]    Script Date: 12/4/2021 22:37:21 ******/
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
/****** Object:  Table [dbo].[MealIngredient]    Script Date: 12/4/2021 22:37:21 ******/
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
/****** Object:  Table [dbo].[MealTag]    Script Date: 12/4/2021 22:37:21 ******/
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
/****** Object:  Table [dbo].[Tag]    Script Date: 12/4/2021 22:37:21 ******/
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
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id_Category], [Name], [Image]) VALUES (1, N'Beef', N'https://www.themealdb.com/images/category/Beef.png')
INSERT [dbo].[Category] ([Id_Category], [Name], [Image]) VALUES (2, N'Dessert', N'https://www.themealdb.com/images/category/Dessert.png')
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
SET IDENTITY_INSERT [dbo].[Ingredient] OFF
GO
SET IDENTITY_INSERT [dbo].[Meal] ON 

INSERT [dbo].[Meal] ([Id_Meal], [Name], [Image], [Preparation], [id_Area], [id_Category]) VALUES (2, N'Beef Wellington', N'https://www.themealdb.com/images/media/meals/vvpprx1487325699.jpg', N'Put the mushrooms into a food processor with some seasoning and pulse to a rough paste. Scrape the paste into a pan and cook over a high heat for about 10 mins, tossing frequently, to cook out the moisture from the mushrooms. Spread out on a plate to cool. Heat in a frying pan and add a little olive oil. Season the beef and sear in the hot pan for 30 secs only on each side. (You don''t want to cook it at this stage, just colour it). Remove the beef from the pan and leave to cool, then brush all over with the mustard. Lay a sheet of cling film on a work surface and arrange the Parma ham slices on it, in slightly overlapping rows. With a palette knife, spread the mushroom paste over the ham, then place the seared beef fillet in the middle. Keeping a tight hold of the cling film from the edge, neatly roll the Parma ham and mushrooms around the beef to form a tight barrel shape. Twist the ends of the cling film to secure. Chill for 15-20 mins to allow the beef to set and keep its shape. Roll out the puff pastry on a floured surface to a large rectangle, the thickness of a £1 coin. Remove the cling film from the beef, then lay in the centre. Brush the surrounding pastry with egg yolk. Fold the ends over, the wrap the pastry around the beef, cutting off any excess. Turn over, so the seam is underneath, and place on a baking sheet. Brush over all the pastry with egg and chill for about 15 mins to let the pastry rest. Heat the oven to 200C, 400F, gas 6. Lightly score the pastry at 1cm intervals and glaze again with beaten egg yolk. Bake for 20 minutes, then lower the oven setting to 180C, 350F, gas 4 and cook for another 15 mins. Allow to rest for 10-15 mins before slicing and serving with the side dishes of your choice. The beef should still be pink in the centre when you serve it.', 1, 1)
INSERT [dbo].[Meal] ([Id_Meal], [Name], [Image], [Preparation], [id_Area], [id_Category]) VALUES (3, N'Canadian Butter Tarts', N'https://www.themealdb.com/images/media/meals/wpputp1511812960.jpg', N'Preheat the oven to fan 170C/ conventional 190C/gas 5. Roll out the pastry on a lightly floured surface so it’s slightly thinner than straight from the pack. Then cut out 18-20 rounds with a 7.5cm fluted cutter, re-rolling the trimmings. Use the rounds to line two deep 12-hole tart tins (not muffin tins). If you only have a regular-sized, 12-hole tart tin you will be able to make a few more slightly shallower tarts. Beat the eggs in a large bowl and combine with the rest of the ingredients except the walnuts. Tip this mixture into a pan and stir continuously for 3-4 minutes until the butter melts, and the mixture bubbles and starts to thicken. It should be thick enough to coat the back of a wooden spoon. Don’t overcook, and be sure to stir all the time as the mixture can easily burn. Remove from the heat and stir in the nuts. Spoon the filling into the unbaked tart shells so it’s level with the pastry. Bake for 15-18 minutes until set and pale golden. Leave in the tin to cool for a few minutes before lifting out on to a wire rack. Serve warm or cold.', 2, 2)
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
SET IDENTITY_INSERT [dbo].[MealIngredient] OFF
GO
SET IDENTITY_INSERT [dbo].[MealTag] ON 

INSERT [dbo].[MealTag] ([Id_MealTag], [id_Meal], [id_Tag]) VALUES (2, 2, 1)
INSERT [dbo].[MealTag] ([Id_MealTag], [id_Meal], [id_Tag]) VALUES (3, 2, 2)
INSERT [dbo].[MealTag] ([Id_MealTag], [id_Meal], [id_Tag]) VALUES (4, 3, 3)
INSERT [dbo].[MealTag] ([Id_MealTag], [id_Meal], [id_Tag]) VALUES (5, 3, 4)
INSERT [dbo].[MealTag] ([Id_MealTag], [id_Meal], [id_Tag]) VALUES (6, 3, 5)
INSERT [dbo].[MealTag] ([Id_MealTag], [id_Meal], [id_Tag]) VALUES (7, 3, 6)
SET IDENTITY_INSERT [dbo].[MealTag] OFF
GO
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([Id_Tag], [Name]) VALUES (1, N'Meat')
INSERT [dbo].[Tag] ([Id_Tag], [Name]) VALUES (2, N'Stew')
INSERT [dbo].[Tag] ([Id_Tag], [Name]) VALUES (3, N'Speciality')
INSERT [dbo].[Tag] ([Id_Tag], [Name]) VALUES (4, N'Snack')
INSERT [dbo].[Tag] ([Id_Tag], [Name]) VALUES (5, N'Dessert')
INSERT [dbo].[Tag] ([Id_Tag], [Name]) VALUES (6, N'Pudding')
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
