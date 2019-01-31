using BusinessLogic;
using Communities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiAnuncio.Controllers
{
    [RoutePrefix("api/parameter")]
    public class ApiParameterController : ApiController
    {
        [Route("sel_parameter"), HttpGet]
        public ClientResponse sel_parameter()
        {
            ClientResponse clientResponse;
            try
            {
                clientResponse = new ParameterLogic().GetCargarControles_Add_Anuncio();
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return clientResponse;
        }
    }
}
