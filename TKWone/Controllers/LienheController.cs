using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TKWone.Controllers
{
    public class LienheController : Controller
    {
        // GET: Contect
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SendContact(string name, string email, string comments)
        {
            ViewBag.SuccessMessage = "Cảm ơn bạn đã liên hệ! Chúng tôi sẽ phản hồi sớm nhất.";
            return View("Index");
        }
    }
}