using BusinessEntity;
using BusinessLogic;
using Communities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace WebAnuncio.Controllers
{
    public class updGaleriaController : Controller
    {
        // GET: updGaleria
        public ActionResult Index()
        {
            return View();
        }

        //public async Task<JsonResult> primeropaso(int id_anuncio)
        //{
        //    ClientResponse clientResponse = new ClientResponse();
        //    try
        //    {
        //        tbl_galeria_anuncio entidad = new tbl_galeria_anuncio() { id=id_anuncio};
        //        clientResponse = new GaleriaLogic().get_galeria_x_id(oregistro);
        //    }
        //    catch (Exception ex)
        //    {
        //        clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
        //    }
        //    return Json(clientResponse, JsonRequestBehavior.AllowGet);
        //}
    }
}