using AccessData;
using AccessData.PersonaDao;
using BusinessEntity;
using Communities;
using Newtonsoft.Json;
using Stripe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BusinessLogic
{
    public class AnuncioLogic
    {
        private AnuncioData _AnuncioData;

        public AnuncioLogic()
        {
            _AnuncioData = new AnuncioData();
        }
        public Tbl_anuncio GetAnucionXId(int id)
        {
            return _AnuncioData.GetAnucionXId(id);
        }
        public Tbl_anuncio GetAnucion_x_tokens(string token_anuncio)
        {
            return _AnuncioData.GetAnucion_x_tokens(token_anuncio);
        }
        public ClientResponse InsertPrimerpaso(Tbl_anuncio objeto)
        {
            return _AnuncioData.InsertPrimerpaso(objeto);
        }
        public ClientResponse GetAnucion_Details_anucion_x_tokens(string token_anuncio)
        {
            return _AnuncioData.GetAnucion_Details_anucion_x_tokens(token_anuncio);
        }
        public ClientResponse ActualizarPrimerpaso(Tbl_anuncio objeto)
        {
            return _AnuncioData.ActualizarPrimerpaso(objeto);
        }
        public ClientResponse UpdateSegundopaso(Tbl_anuncio objeto)
        {
            return _AnuncioData.UpdateSegundopaso(objeto);
        }
        public ClientResponse UpdateTercerpaso(Tbl_anuncio objeto)
        {
            return _AnuncioData.UpdateTercerpaso(objeto);
        }
        public ClientResponse UpdateCuartopaso(Tbl_anuncio objeto)
        {
            return _AnuncioData.UpdateCuartopaso(objeto);
        }

        public ClientResponse UpdateQuintopaso(Tbl_anuncio objeto)
        {
            return _AnuncioData.UpdateQuintopaso(objeto);
        }



        public ClientResponse UpdateTodopaso(Tbl_anuncio objeto)
        {
            return _AnuncioData.UpdateTodopaso(objeto);
        }
        public ClientResponse MisAnuncio(string usuario_token)
        {
            return _AnuncioData.MisAnuncio(usuario_token);
        }
        public ClientResponse ListarAnuncio()
        {
            return _AnuncioData.ListarAnuncio();
        }
        public ClientResponse ListarMisAnuncioPorUsuario(Tbl_anuncio anuncio)
        {
            return _AnuncioData.ListarMisAnuncioPorUsuario(anuncio);
        }
        public ClientResponse ListarAnuncio_top_10()
        {
            return _AnuncioData.ListarAnuncio_top_10();
        }
        public ClientResponse DarBajarAnuncio(Tbl_anuncio entidad)
        {
            return _AnuncioData.DarBajarAnuncio(entidad);
        }
        public ClientResponse ListarAnuncioPaginate(Tbl_anuncio tblAnuncio)
        {
            return _AnuncioData.ListarAnuncioPaginate(tblAnuncio);
        }
        public ClientResponse listarPaginado(Pagination paginacion)
        {
            return _AnuncioData.listarPaginado(paginacion);
        }
        public ClientResponse crearCargos(BeanCharge beanCharge)
        {
            ClientResponse clientResponse = new ClientResponse();

            clientResponse = new ProductoData().GetMontoProductoPorId(beanCharge.idProducto);
            Tbl_productos productoBean = JsonConvert.DeserializeObject<Tbl_productos>(clientResponse.DataJson);
            clientResponse = null;
            clientResponse = new ClientResponse();

            //Llave secreta de produccion para realizar el cargo
            StripeConfiguration.ApiKey = obtenerLlaveSecretaStripe("SKEY_LLAVE_SECRETA_STRIPE");//"sk_test_E4gwJSpR18sVDTtVmsH9HpuB00ps4xFKQU";//Llave secreta de prueba - Cambiar llave secreta por el de producccion
            //Crear Cliente a quien se le adjuntara el cargo
            var customerOptions = new CustomerCreateOptions
            {
                Name = beanCharge.nombreCompleto,
                Source = beanCharge.stripeToken,
                Description = "Cargo para " + beanCharge.correo,
                Email = beanCharge.correo,
                Metadata = new Dictionary<String, String>()
                {
                    { "Numero Telefono", beanCharge.telefonoCelular}
                }
            };
            //beanCharge.descripcionCargo = customerOptions.Description;
            var customerService = new CustomerService();
            Customer customer = customerService.Create(customerOptions);
            //string mo = productoBean.mt_monto.ToString("#.00#");
            //decimal monto = 0;
            //Creando un cargo con el token(beanCharge.stripeToken) creado con en el front-end con los datos de la tarjeta del cliente
            var options = new ChargeCreateOptions
            {
                Amount = Convert.ToInt64(productoBean.mt_monto)*100, //beanCharge.montoPagar, 
                Currency = "pen",
                Description = beanCharge.descripcionCargo,
                //Source = beanCharge.stripeToken, // obtenido con Stripe.js
                CustomerId = customer.Id,
                //ReceiptEmail = beanCharge.correo,
            };
            beanCharge.moneda = options.Currency;

            var service = new ChargeService();
            Charge charge = service.Create(options);
            Card tarjeta = ((Stripe.Card)charge.Source);
            beanCharge.numeroTarjeta = tarjeta.Last4;
            beanCharge.tipoTarjeta = tarjeta.Funding;
            beanCharge.nombreTarjeta = tarjeta.Brand;

            BeanChargeViewModel chViewModel = new BeanChargeViewModel();
            //chViewModel.ChargeId = charge.Id;
            chViewModel.CustomerId = charge.CustomerId;
            chViewModel.status = charge.Status;

            Tbl_parameter_det entidad_mensaje_confirm_pago = new Tbl_parameter_det() { paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_MENSAJE_CONFIRMACION" } };
            IEnumerable<Tbl_parameter_det> respons_mensaje_confirm_pago = new ParameterLogic().GetParameter_skey(entidad_mensaje_confirm_pago);
            Tbl_parameter_det llave_mensaje_confirm_pago = respons_mensaje_confirm_pago.ToList().Where(x => x.skey_det.Equals("SKEY_MENSAJE_CONFIRMACION_PAGO")).FirstOrDefault();
            //session[key] = llave_publicable_stripe.tx_valor;
            chViewModel.mensajePago = llave_mensaje_confirm_pago.tx_valor;

            //chViewModel.clientSecret = charge.PaymentIntent.ClientSecret;
            clientResponse.Data = JsonConvert.SerializeObject(chViewModel).ToString();
            return clientResponse;
        }
        public ClientResponse RegistrarPago(BeanCharge objeto)
        {
            return _AnuncioData.RegistrarPago(objeto);
        }

        public String obtenerLlaveSecretaStripe(String key)
        {
            String llaveSecreta = "";
            try
            {
                //var session = HttpContext.Current.Session;
                //if (session != null)
                //{
                //if (session[key] == null)
                //{
                Tbl_parameter_det entidad_llave_secreta_stripe = new Tbl_parameter_det() { paramter_cab = new Tbl_parameter_cab() { skey_cab = key } };
                IEnumerable<Tbl_parameter_det> respons_llave_secreta_stripe = new ParameterLogic().GetParameter_skey(entidad_llave_secreta_stripe);
                Tbl_parameter_det llave_publicable_stripe = respons_llave_secreta_stripe.ToList().Where(x => x.skey_det.Equals(key)).FirstOrDefault();
                //session[key] = llave_publicable_stripe.tx_valor;
                llaveSecreta = llave_publicable_stripe.tx_valor;
                // }
                // else
                //{
                //llaveSecreta = session[key].ToString();
                //  }
                //}
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return llaveSecreta;
        }
    }
}
