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
        public ClientResponse Insert_GaleriaObject(Tbl_galeria_anuncio entidad)
        {
            return _GaleriaData.Insert_GaleriaObject(entidad);
        }

        public ClientResponse Insert_Galeria(List<Tbl_galeria_anuncio> list, int id_anuncio)
        {
            return _GaleriaData.Insert_Galeria(list,id_anuncio);
        }
        public ClientResponse Insert_Videos(List<Tbl_galeria_anuncio> list, int id_anuncio)
        {
            return _GaleriaData.Insert_Videos(list, id_anuncio);
        }
        public ClientResponse Get_galeria_x_id(Tbl_galeria_anuncio objeto)
        {
            return _GaleriaData.Get_galeria_x_id(objeto);
        }
        public ClientResponse Eliminar_galeria_x_id(Tbl_galeria_anuncio objeto)
        {
            return _GaleriaData.Eliminar_galeria_x_id(objeto);
        }
        public ClientResponse Eliminar_video_x_id(Tbl_galeria_anuncio objeto)
        {
            return _GaleriaData.Eliminar_video_x_id(objeto);
        }

        public IEnumerable<Tbl_galeria_anuncio> Get_galeria_x_id_anuncio(Tbl_galeria_anuncio objeto)
        {
            return _GaleriaData.Get_galeria_x_id_anuncio(objeto);
        }
        public IEnumerable<Tbl_galeria_anuncio> Get_Video_x_id_anuncio(Tbl_galeria_anuncio objeto)
        {
            return _GaleriaData.Get_video_x_id_anuncio(objeto);
        }
    }
}
