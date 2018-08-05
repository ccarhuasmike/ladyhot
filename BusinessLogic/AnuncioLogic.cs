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
        public IEnumerable<tbl_anuncio> getAnucionXId(int id_anucion)
        {
            return _AnuncioData.getAnucionXId(id_anucion);
        }       

        public ClientResponse InsertPrimerpaso(tbl_anuncio objeto)
        {
            return _AnuncioData.InsertPrimerpaso(objeto);
        }
        public ClientResponse UpdateSegundopaso(tbl_anuncio objeto)
        {
            return _AnuncioData.UpdateSegundopaso(objeto);
        }
        public ClientResponse UpdateTercerpaso(tbl_anuncio objeto)
        {
            return _AnuncioData.UpdateTercerpaso(objeto);
        }
        public ClientResponse UpdateTodopaso(tbl_anuncio objeto)
        {
            return _AnuncioData.UpdateTodopaso(objeto);
        }

        public ClientResponse MisAnuncio(string token_usuario)
        {
            return _AnuncioData.MisAnuncio(token_usuario);
        }
        public ClientResponse darBajarAnuncio(string token_anuncio)
        {
            return _AnuncioData.darBajarAnuncio(token_anuncio);
        }
    }
}
