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
    [RoutePrefix("api/misanuncios")]
    public class ApiMisAnuncioController : ApiController
    {

        [Route("ListarMisAnuncioPorUsuario"), HttpGet]
        public ClientResponse listarMisAnuncios()
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                clientResponse = new AnuncioLogic().ListarMisAnuncioPorUsuario();
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return clientResponse;
        }

    }
}
