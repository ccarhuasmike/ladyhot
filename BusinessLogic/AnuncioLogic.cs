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
        public IEnumerable<tbl_anuncio> getAnucionXId(int id)
        {
            return _AnuncioData.getAnucionXId(id);
        }
        public IEnumerable<tbl_anuncio> getAnucion_x_tokens(string token_anuncio)
        {
            return _AnuncioData.getAnucion_x_tokens(token_anuncio);
        }
        public ClientResponse InsertPrimerpaso(tbl_anuncio objeto)
        {
            return _AnuncioData.InsertPrimerpaso(objeto);
        }
        public ClientResponse UpdateSegundopaso(tbl_anuncio objeto)
        {
            return _AnuncioData.UpdateSegundopaso(objeto);
        }

        public ClientResponse Insert_Galeria(List<tbl_galeria_anuncio> list, int id_anuncio)
        {
            return _AnuncioData.Insert_Galeria(list,id_anuncio);
        }

        public ClientResponse UpdateTercerpaso(tbl_anuncio objeto)
        {
            return _AnuncioData.UpdateTercerpaso(objeto);
        }
        public ClientResponse UpdateTodopaso(tbl_anuncio objeto)
        {
            return _AnuncioData.UpdateTodopaso(objeto);
        }

        public ClientResponse MisAnuncio(string usuario_token)
        {
            return _AnuncioData.MisAnuncio(usuario_token);
        }
        public ClientResponse darBajarAnuncio(string token_anuncio)
        {
            return _AnuncioData.darBajarAnuncio(token_anuncio);
        }
    }
}
