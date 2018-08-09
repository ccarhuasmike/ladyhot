using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntity
{
   public class tbl_anuncio
    {
        public int id { get; set; }  = 0;
        public string txt_nombre_ficha { get; set; } = "";
        public string txt_telefono_1 { get; set; } = "";
        public string txt_telefono_2 { get; set; } = "";
        public string txt_email { get; set; } = "";
        public string txt_web { get; set; } = "";
        public int int_edad { get; set; } = 0;
        public int int_pais_origen { get; set; } = 0;
        public int int_estudios { get; set; } = 0;
        public string txt_presentacion { get; set; } = "";
        public int int_color_cabello { get; set; } = 0;
        public int int_color_ojos { get; set; } = 0;
        public int int_estatura { get; set; } = 0;
        public int int_peso { get; set; } = 0;
        public string txt_medidas_busto_cintura_cadera { get; set; } = "";
        public string txt_descripcion_extra_apariencia { get; set; } = "";
        public decimal dbl_costo_x_tiempo_30min { get; set; } = 0;
        public decimal dbl_costo_x_tiempo_45min { get; set; } = 0;
        public decimal dbl_costo_x_tiempo_1hora { get; set; } = 0;
        public decimal dbl_costo_x_tiempo_1hora_media { get; set; } = 0;
        public decimal dbl_costo_x_tiempo_2hora { get; set; } = 0;
        public decimal dbl_costo_x_tiempo_3hora { get; set; } = 0;
        public decimal dbl_costo_x_tiempo_salidas { get; set; } = 0;
        public decimal dbl_costo_x_tiempo_toda_noche { get; set; } = 0;
        public decimal dbl_costo_x_viaje { get; set; } = 0;        
        public string txt_forma_pago { get; set; } = "";
        public string txt_descripcion_extra_tarifa { get; set; } = "";
        public string txt_lugar_servicio_distrito { get; set; } = "";
        public int fl_atencion_24horas { get; set; } = 0;
        public string tx_descripcion_extra_horario { get; set; } = "";
        public string tx_lugar_atencion { get; set; } = "";
        public string tx_servicios_ofrece { get; set; } = "";
        public string tx_descripcion_extra_servicio { get; set; } = "";
        public string tx_foto_presentacion { get; set; } = "";
        public DateTime dt_fe_ini_vig { get; set; }
        public DateTime dt_fe_fin_vig { get; set; }
        public DateTime dt_fe_crea { get; set; }
        public int id_estado_reg { get; set; } = 0;
        public int fl_portada { get; set; } = 0;
        public string filenametop { get; set; }
        public int id_categoria { get; set; } = 0;
        public int id_tipo_anuncio { get; set; } = 0;
        public int id_tarifa_anuncio { get; set; } = 0;
        public int id_pago_anuncio { get; set; } = 0;
        public decimal dbl_pago_total_tarifa_calculado { get; set; } = 0;
        public decimal dbl_pago_total_depositado { get; set; } = 0;
        public int fl_cerrado { get; set; } = 0;
        public string cod_anuncio_encryptado { get; set; } = "";
        public int id_usuario { get; set; } = 0;
        //Propiedades Extras
        public string txt_imagen_prensetancion { get; set; } = "";
    }
}
