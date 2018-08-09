using BusinessLogic;
using Communities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebAnuncio.Controllers
{
    public class ParameterController : Controller
    {
        // GET: Parameter
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult getCargarControles_Add()
        {                   
            ClientResponse clientResponse;
            try
            {
                clientResponse =  new ParameterLogic().GetCargarControles_Add_Anuncio();  
            }
            catch
            {
                throw;
            }
           
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

    }
}