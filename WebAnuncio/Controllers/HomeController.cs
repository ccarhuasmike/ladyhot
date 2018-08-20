using BusinessLogic;
using Communities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebAnuncio.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                clientResponse = new AnuncioLogic().ListarAnuncio();
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            ViewBag.Message = clientResponse;
            return View();
        }
        public JsonResult ListarAnuncio()
        {
            //ClientResponse clientResponse = new ClientResponse();
            //try
            //{
            //    clientResponse = new AnuncioLogic().ListarAnuncio();
            //}
            //catch (Exception ex)
            //{
            //    clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            //}
            //return Json(clientResponse, JsonRequestBehavior.AllowGet);
            return null;
        }
    }
}