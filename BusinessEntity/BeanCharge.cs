using System;

namespace BusinessEntity
{
    public class BeanCharge
    {
        public string nombreCompleto { get; set; }
        public string correo { get; set; }
        public string telefonoCelular { get; set; }
        public string stripeToken { get; set; }
        public long montoPagar { get; set; }
        public string descripcionCargo { get; set; }
        public int idAnuncio { get; set; }
        public string numeroTarjeta { get; set; }
        public string tipoTarjeta { get; set; }
        public string nombreTarjeta { get; set; }
        public string moneda { get; set; }
        public int idProducto { get; set; }
        public DateTime primerDiaSubida { get; set; }
        public DateTime ultimoDiaSubida { get; set; }
        public string primerHoraSubida { get; set; }
        public string ultimoHoraSubida { get; set; }
        //public Tbl_productos datosProducto { get; set; }
    }
}
