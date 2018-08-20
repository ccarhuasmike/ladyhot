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
    public class UsuarioController : Controller
    {
        // GET: Usuario
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult Login(Tbl_usuario oregistro)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                clientResponse = new UsuarioLogic().getUsuario_X_password(oregistro);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Registar(Tbl_usuario oregistro)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                clientResponse = new UsuarioLogic().InsertUsuario(oregistro);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }
    }
}