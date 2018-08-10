using System;

namespace BusinessEntity
{
   public class tbl_galeria_anuncio
    {

        public int id { get; set; } = 0;
        public string tx_filename { get; set; } = "";
        public string tx_ruta_file { get; set; } = "";
        public string tx_ruta_file_cort { get; set; } = "";
        public int size_file { get; set; } = 0;
        public int id_tipo_archivo { get; set; } = 0;
        public DateTime dt_fe_crea { get; set; } 
        public int id_anuncio { get; set; } = 0;
        public string txt_ruta_virtuales { get; set; } = "";
        public string txt_ruta_virtuales_cortada { get; set; } = "";
    }
}
