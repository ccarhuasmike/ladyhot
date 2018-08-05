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
    public class UpdAnuncioController : Controller
    {
        // GET: UpdAnuncio
        public ActionResult Index()
        {
            return View();
        }

        public async Task<JsonResult> getAnuncio_x_Id(int id)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                IEnumerable<tbl_anuncio> list = new AnuncioLogic().getAnucionXId(id);
                clientResponse.DataJson = JsonConvert.SerializeObject(list).ToString();
                clientResponse.Status = "OK";
            }
            catch (Exception ex)
            {                
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
                clientResponse.Status = "ERROR";
            }
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

        public async Task<JsonResult> getAnuncio_x_tokens(string token_anuncio)
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
                clientResponse.Status = "ERROR";
            }
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

        public async Task<JsonResult> todospasos(tbl_anuncio oregistro)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                clientResponse = new AnuncioLogic().UpdateTodopaso(oregistro);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

    }
}