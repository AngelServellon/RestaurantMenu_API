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
    public class APIMealController : ApiController
    {
        private RestaurantContext db = new RestaurantContext();

        // GET: api/APIMeal
        public IQueryable<Meal> GetMeal()
        {
            return db.Meal;
        }

        // GET: api/APIMeal/5
        [ResponseType(typeof(Meal))]
        public IHttpActionResult GetMeal(int id)
        {
            Meal meal = db.Meal.Find(id);
            if (meal == null)
            {
                return NotFound();
            }

            return Ok(meal);
        }

        // PUT: api/APIMeal/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutMeal(int id, Meal meal)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != meal.Id_Meal)
            {
                return BadRequest();
            }

            db.Entry(meal).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MealExists(id))
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

        // POST: api/APIMeal
        [ResponseType(typeof(Meal))]
        public IHttpActionResult PostMeal(Meal meal)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Meal.Add(meal);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = meal.Id_Meal }, meal);
        }

        // DELETE: api/APIMeal/5
        [ResponseType(typeof(Meal))]
        public IHttpActionResult DeleteMeal(int id)
        {
            Meal meal = db.Meal.Find(id);
            if (meal == null)
            {
                return NotFound();
            }

            db.Meal.Remove(meal);
            db.SaveChanges();

            return Ok(meal);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool MealExists(int id)
        {
            return db.Meal.Count(e => e.Id_Meal == id) > 0;
        }
    }
}