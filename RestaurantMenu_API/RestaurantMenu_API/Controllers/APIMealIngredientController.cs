using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using RestaurantMenu_API.Models;

namespace RestaurantMenu_API.Controllers
{
    public class APIMealIngredientController : ApiController
    {
        private RestaurantContext db = new RestaurantContext();

        // GET: api/APIMealIngredient
        public IQueryable<MealIngredient> GetMealIngredient()
        {
            return db.MealIngredient;
        }

        // GET: api/APIMealIngredient/5
        [ResponseType(typeof(MealIngredient))]
        public IHttpActionResult GetMealIngredient(int id)
        {
            MealIngredient mealIngredient = db.MealIngredient.Find(id);
            if (mealIngredient == null)
            {
                return NotFound();
            }

            return Ok(mealIngredient);
        }

        // PUT: api/APIMealIngredient/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutMealIngredient(int id, MealIngredient mealIngredient)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != mealIngredient.Id_MealIngredient)
            {
                return BadRequest();
            }

            db.Entry(mealIngredient).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MealIngredientExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/APIMealIngredient
        [ResponseType(typeof(MealIngredient))]
        public IHttpActionResult PostMealIngredient(MealIngredient mealIngredient)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.MealIngredient.Add(mealIngredient);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = mealIngredient.Id_MealIngredient }, mealIngredient);
        }

        // DELETE: api/APIMealIngredient/5
        [ResponseType(typeof(MealIngredient))]
        public IHttpActionResult DeleteMealIngredient(int id)
        {
            MealIngredient mealIngredient = db.MealIngredient.Find(id);
            if (mealIngredient == null)
            {
                return NotFound();
            }

            db.MealIngredient.Remove(mealIngredient);
            db.SaveChanges();

            return Ok(mealIngredient);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool MealIngredientExists(int id)
        {
            return db.MealIngredient.Count(e => e.Id_MealIngredient == id) > 0;
        }
    }
}