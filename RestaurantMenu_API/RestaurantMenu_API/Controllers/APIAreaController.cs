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

namespace RestaurantMenu_API.Models
{
    public class APIAreaController : ApiController
    {
        private RestaurantContext db = new RestaurantContext();

        // GET: api/APIArea
        public IQueryable<Area> GetArea()
        {
            return db.Area;
        }

        // GET: api/APIArea/5
        [ResponseType(typeof(Area))]
        public IHttpActionResult GetArea(int id)
        {
            Area area = db.Area.Find(id);
            if (area == null)
            {
                return NotFound();
            }

            return Ok(area);
        }

        // PUT: api/APIArea/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutArea(int id, Area area)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != area.Id_Area)
            {
                return BadRequest();
            }

            db.Entry(area).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AreaExists(id))
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

        // POST: api/APIArea
        [ResponseType(typeof(Area))]
        public IHttpActionResult PostArea(Area area)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Area.Add(area);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = area.Id_Area }, area);
        }

        // DELETE: api/APIArea/5
        [ResponseType(typeof(Area))]
        public IHttpActionResult DeleteArea(int id)
        {
            Area area = db.Area.Find(id);
            if (area == null)
            {
                return NotFound();
            }

            db.Area.Remove(area);
            db.SaveChanges();

            return Ok(area);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AreaExists(int id)
        {
            return db.Area.Count(e => e.Id_Area == id) > 0;
        }
    }
}