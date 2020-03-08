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
    [RoutePrefix("api/producto")]
    public class ApiProductoController : ApiController
    {
        [Route("ListarProductos/{tipoProducto}"), HttpGet]
        public ClientResponse sel_cliente([FromUri] int tipoProducto)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                clientResponse = new ProductoLogic().ListarProductoPorTipoProducto(tipoProducto);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return clientResponse;
        }

        [Route("ObtenerHorariosSubida"), HttpGet]
        public ClientResponse ObtenerHorariosSubida()
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                clientResponse = new ProductoLogic().ObtenerHorariosSubida();
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return clientResponse;
        }
    }
}
