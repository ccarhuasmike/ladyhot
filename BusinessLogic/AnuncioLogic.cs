using AccessData.PersonaDao;
using BusinessEntity;
using Communities;
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
        public IEnumerable<Tbl_anuncio> getAnucionXId(int id)
        {
            return _AnuncioData.getAnucionXId(id);
        }
        public Tbl_anuncio getAnucion_x_tokens(string token_anuncio)
        {
            return _AnuncioData.getAnucion_x_tokens(token_anuncio);
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
        public ClientResponse ListarAnuncio_top_10()
        {
            return _AnuncioData.ListarAnuncio_top_10();
        }
        public ClientResponse darBajarAnuncio(string token_anuncio)
        {
            return _AnuncioData.darBajarAnuncio(token_anuncio);
        }
    }
}
