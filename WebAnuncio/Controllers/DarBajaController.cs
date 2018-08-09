using BusinessEntity;
using BusinessLogic;
using Communities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace WebAnuncio.Controllers
{
    public class DarBajaController : Controller
    {
        // GET: DarBaja
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetAnuncio_x_tokens(string token_anuncio)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                IEnumerable<tbl_anuncio> list = new AnuncioLogic().getAnucion_x_tokens(token_anuncio);
                clientResponse.DataJson = JsonConvert.SerializeObject(list).ToString();
                clientResponse.Status = "OK";
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

        public JsonResult upd_dar_baja(string anuncio_token)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                clientResponse = new AnuncioLogic().darBajarAnuncio(anuncio_token);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }
    }
}