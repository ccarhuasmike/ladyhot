using AccessData;
using BusinessEntity;
using Communities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class GaleriaLogic
    {
        private GaleriaData _GaleriaData;

        public GaleriaLogic()
        {
            _GaleriaData = new GaleriaData();
        }


        public ClientResponse Insert_Galeria(List<tbl_galeria_anuncio> list, int id_anuncio)
        {
            return _GaleriaData.Insert_Galeria(list, id_anuncio);
        }
     
        public ClientResponse get_galeria_x_id(tbl_galeria_anuncio objeto)
        {
            return _GaleriaData.get_galeria_x_id(objeto);
        }
        public ClientResponse eliminar_galeria_x_id(tbl_galeria_anuncio objeto)
        {
            return _GaleriaData.eliminar_galeria_x_id(objeto);
        }
        public IEnumerable<tbl_galeria_anuncio> get_galeria_x_id_anuncio(tbl_galeria_anuncio objeto)
        {
            return _GaleriaData.get_galeria_x_id_anuncio(objeto);
        }
    }
}
