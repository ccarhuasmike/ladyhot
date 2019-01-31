using BusinessLogic;
using Communities;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiAnuncio.Controllers
{
    [RoutePrefix("api/anuncio")]
    public class ApiAnuncioController : ApiController
    {
        [Route("ListarAnuncio"), HttpPost]
        public ClientResponse sel_cliente(JObject objData)
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
            return clientResponse;
        }
    }
}
