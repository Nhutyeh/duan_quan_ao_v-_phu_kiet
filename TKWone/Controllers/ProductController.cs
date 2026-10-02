using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TKWone.Models;

namespace TKWone.Controllers
{
    public class ProductController : Controller
    {
        public ActionResult Index(int categoryID = 1)
        {
            ProductDBContext dbContext = new ProductDBContext();
            List<Product> listProducts = dbContext.Products
                .Include(p => p.Category)
                .Where(p => p.CatId == categoryID)
                .ToList();

            return View(listProducts);
        }
        public ActionResult Details(int id)
        {
            ProductDBContext dbContext = new ProductDBContext();
            Product product = dbContext.Products.Include(cat => cat.Category).FirstOrDefault(p => p.ProId == id);

            return View(product);
        }


    }
}