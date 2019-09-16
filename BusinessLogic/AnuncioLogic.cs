using AccessData.PersonaDao;
using BusinessEntity;
using Communities;
using Stripe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
        public BeanChargeViewModel crearCargos(BeanCharge beanCharge)
        {
            //Llave secreta de produccion para realizar el cargo
            StripeConfiguration.ApiKey = "sk_test_E4gwJSpR18sVDTtVmsH9HpuB00ps4xFKQU";//Llave secreta de prueba - Cambiar llave secreta por el de producccion
            //Crear Cliente a quien se le adjuntara el cargo
            var customerOptions = new CustomerCreateOptions
            {
                Name = beanCharge.nombreCompleto,
                Source = beanCharge.StripeToken,
                Description = "Cargo para " + beanCharge.correo,
                Email = beanCharge.correo,
                Metadata = new Dictionary<String, String>()
                {
                    { "Numero Telefono", beanCharge.telefonoCelular}
                }
            };

            var customerService = new CustomerService();
            Customer customer = customerService.Create(customerOptions);

            var options = new ChargeCreateOptions
            {
                Amount = beanCharge.montoPagar,
                Currency = "pen",
                Description = beanCharge.descripcionCargo,
                //Source = beanCharge.StripeToken, // obtenido con Stripe.js
                CustomerId = customer.Id
            };
            var service = new ChargeService();
            Charge charge = service.Create(options);

            BeanChargeViewModel chViewModel = new BeanChargeViewModel();
            chViewModel.ChargeId = charge.Id;
            chViewModel.CustomerId = charge.CustomerId;
            return chViewModel;
        }
    }
}
