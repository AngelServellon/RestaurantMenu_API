/*Total de Platos por Categorias*/
select c.Name as Categoria, COUNT(m.Id_Meal) as "Cantidades de comidas" from Category as c 
inner join Meal as m 
on c.Id_Category= m.id_Category 
group by(c.Name);

/*Total de ingredientes que ocupan cada uno de los platos*/
select m.Name as Platillo, count(i.Id_Ingredient) as "Cantidad de ingredientes" from Meal as m 
inner join MealIngredient as mi 
on m.Id_Meal=mi.id_Meal 
inner join Ingredient as i 
on mi.id_Ingredient=i.Id_Ingredient
group by(m.Name);

/*Cuáles son los últimos platos ingresados y cuántos son los últimos platos modificados*/
select top 1 * from Meal as m order by m.Id_Meal desc;

/*Cuántos platos tienen X ingrediente*/
select i.Name as Ingrediente, count(m.Id_Meal) as "Cantidad de platillos" from Meal as m 
inner join MealIngredient as mi 
on m.Id_Meal=mi.id_Meal 
inner join Ingredient as i 
on mi.id_Ingredient=i.Id_Ingredient
group by(i.Name)

/*Poder obtener el detalle de un plato en particular*/
select * from Meal;

/*Poder obtener las descripciones de cada ingrediente. Tomar en cuenta que este valor
puede ser opcional.*/
select i.Name as Ingrediente, i.Description as Descripcion from Ingredient as i;

/*Ver los tags que tienen los platos*/
select m.Name as Platillo, t.Name as Tag from Meal as m 
inner join MealTag as mt 
on m.Id_Meal=mt.id_Meal 
inner join Tag as t 
on mt.Id_MealTag=t.Id_Tag;




