using RestaurantMenu_API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;

namespace RestaurantMenu_API.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(Category c)
        {
            HttpPostedFileBase FileBase = Request.Files[0];
            //HttpFileCollectionBase collectionBase = Request.Files;

            WebImage image = new WebImage(FileBase.InputStream);

            c.Image = image.GetBytes();

            if (ModelState.IsValid)
            {
                using (var db = new RestaurantContext())
                {
                    db.Category.Add(c);
                    db.SaveChanges();
                    return RedirectToAction("Index", "Home");
                }
            }
            else
            {
                return View();
            }
        }
    }
}