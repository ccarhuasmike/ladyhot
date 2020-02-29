using AccessData;
using Communities;

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
    }
}
