//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RestaurantMenu_API.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class MealIngredient
    {
        public int Id_MealIngredient { get; set; }
        public string Quantity { get; set; }
        public int id_Meal { get; set; }
        public int id_Ingredient { get; set; }
    
        public virtual Ingredient Ingredient { get; set; }
        public virtual Meal Meal { get; set; }
    }
}
