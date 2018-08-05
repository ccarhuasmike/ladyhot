using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntity
{
    public class tbl_usuario
    {
        public int id { get; set; }
        public string tx_pass { get; set; }
        public string tx_email { get; set; }
        public DateTime dt_fe_crea { get; set; }
        public int id_estado_reg { get; set; }
        public string tx_token { get; set; }
        public string tx_nombre { get; set; }
        public string tx_apellido { get; set; }
        public string tx_celular { get; set; }
        public string tx_telefono { get; set; }
        public int id_tipo_cliente { get; set; }        
    }
}
