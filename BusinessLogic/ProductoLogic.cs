using AccessData;
using BusinessEntity;
using Communities;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace BusinessLogic
{
    public class ProductoLogic
    {
        private ProductoData _ProductoData;

        public ProductoLogic()
        {
            _ProductoData = new ProductoData();
        }

        public ClientResponse ListarProductoPorTipoProducto(int tipoProducto)
        {
            return _ProductoData.ListarProductoPorTipoProducto(tipoProducto);
        }

        public ClientResponse ObtenerHorariosSubida()
        {
            ClientResponse clientResponse = new ClientResponse();
            Tbl_parameter_det entidad_mensaje_confirm_pago = new Tbl_parameter_det() { paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_HORA_SUBIDA" } };
            IEnumerable<Tbl_parameter_detDto> respons_mensaje_confirm_pago = new ParameterLogic().GetParameter_skey(entidad_mensaje_confirm_pago);
            clientResponse.DataJson = JsonConvert.SerializeObject(respons_mensaje_confirm_pago).ToString();
            clientResponse.Status = "OK";
            return clientResponse;
        }
    }
}
