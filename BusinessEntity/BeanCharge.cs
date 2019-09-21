
namespace BusinessEntity
{
    public class BeanCharge
    {
        public string nombreCompleto { get; set; }
        public string correo { get; set; }
        public string telefonoCelular { get; set; }
        public string StripeToken { get; set; }
        public long montoPagar { get; set; }
        public string descripcionCargo { get; set; }
        public int idAnuncio { get; set; }
        public string numeroTarjeta { get; set; }
        public string tipoTarjeta { get; set; }
        public string nombreTarjeta { get; set; }
        public string moneda { get; set; }
    }
}
