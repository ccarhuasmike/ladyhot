
namespace BusinessEntity
{
    public class Tbl_productos
    {
        public int id { get; set; }
        public int id_tarifa { get; set; }
        public int numero_dias_activo { get; set; }
        public int numero_subida_top { get; set; }
        public int id_estado_reg { get; set; }
        public int posicion_plan_subida { get; set; }

        public int id_producto { get; set; }
        public decimal mt_monto { get; set; }
    }
}