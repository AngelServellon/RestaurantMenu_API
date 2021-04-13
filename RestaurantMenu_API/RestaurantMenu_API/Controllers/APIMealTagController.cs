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
    public class APIMealTagController : ApiController
    {
        private RestaurantContext db = new RestaurantContext();

        // GET: api/APIMealTag
        public IQueryable<MealTag> GetMealTag()
        {
            return db.MealTag;
        }

        // GET: api/APIMealTag/5
        [ResponseType(typeof(MealTag))]
        public IHttpActionResult GetMealTag(int id)
        {
            MealTag mealTag = db.MealTag.Find(id);
            if (mealTag == null)
            {
                return NotFound();
            }

            return Ok(mealTag);
        }

        // PUT: api/APIMealTag/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutMealTag(int id, MealTag mealTag)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != mealTag.Id_MealTag)
            {
                return BadRequest();
            }

            db.Entry(mealTag).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MealTagExists(id))
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

        // POST: api/APIMealTag
        [ResponseType(typeof(MealTag))]
        public IHttpActionResult PostMealTag(MealTag mealTag)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.MealTag.Add(mealTag);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = mealTag.Id_MealTag }, mealTag);
        }

        // DELETE: api/APIMealTag/5
        [ResponseType(typeof(MealTag))]
        public IHttpActionResult DeleteMealTag(int id)
        {
            MealTag mealTag = db.MealTag.Find(id);
            if (mealTag == null)
            {
                return NotFound();
            }

            db.MealTag.Remove(mealTag);
            db.SaveChanges();

            return Ok(mealTag);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool MealTagExists(int id)
        {
            return db.MealTag.Count(e => e.Id_MealTag == id) > 0;
        }
    }
}