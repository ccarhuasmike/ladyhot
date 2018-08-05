using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntity
{
    public class tbl_parameter_det
    {
        public int id { get; set; }
        public string skey_det { get; set; }
        public int val_valor { get; set; }
        public string tx_valor { get; set; }
        public string tx_descripcion { get; set; }
        public string tx_comentario { get; set; }
        public int id_estado_reg { get; set; }
        public DateTime dt_fe_crea { get; set; }
        public tbl_parameter_cab paramter_cab;
        public tbl_parameter_det()
        {
            paramter_cab = new tbl_parameter_cab();
        }
    }
}
