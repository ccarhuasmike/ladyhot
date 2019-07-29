using BusinessEntity;
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

        [Route("ListarMisAnuncioPorUsuario"), HttpPost]
        public ClientResponse listarMisAnuncios(Tbl_anuncio anuncio)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                clientResponse = new AnuncioLogic().ListarMisAnuncioPorUsuario(anuncio);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return clientResponse;
        }
    }
}
