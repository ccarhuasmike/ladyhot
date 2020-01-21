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
        [Route("ListarProductosSubirAutomatico"), HttpPost]
        public ClientResponse sel_cliente()
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                int TIPO_PRODUCTO_SUBIR_AUTOMATICO = 1;
                clientResponse = new ProductoLogic().ListarProductoPorTipoProducto(TIPO_PRODUCTO_SUBIR_AUTOMATICO);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return clientResponse;
        }
    }
}
