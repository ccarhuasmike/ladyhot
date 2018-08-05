using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntity
{
    public class tbl_parameter_cab
    {
        public int id { get; set; }
        public string skey_cab { get; set; }
        public string tx_descripcion { get; set; }
        public int id_estado_reg { get; set; }
        public DateTime dt_fe_crea { get; set; }
        public string txt_comentario { get; set; }
       
    }
}
