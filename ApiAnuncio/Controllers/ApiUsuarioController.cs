using BusinessEntity;
using BusinessLogic;
using Communities;
using System;
using System.Web.Http;

namespace ApiAnuncio.Controllers
{
    [RoutePrefix("api/usuario")]
    public class ApiUsuarioController : ApiController
    {
        [Route("loguear"), HttpPost]
        public ClientResponse sel_cliente(Tbl_usuario tblUsuario)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                clientResponse = new UsuarioLogic().GetUsuario_X_password(tblUsuario);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return clientResponse;
        }
    }
}
