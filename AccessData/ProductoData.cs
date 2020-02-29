using AccessData.Conexion;
using BusinessEntity;
using Communities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessData
{
    public class ProductoData
    {
        #region Variables
        private static IEnumerable<Tbl_productos> lstProducto;
        private static SqlConnection conexion;
        private static SqlCommand comando;
        private static SqlDataReader reader;
        private static ClientResponse clientResponse;
        private static Tbl_productos entidad;
        #endregion

        #region Constructor
        public ProductoData()
        {
            conexion = null;
            comando = null;
            entidad = null;
            reader = null;
            clientResponse = new ClientResponse();
            clientResponse.Status = "OK";
        }
        #endregion

        #region Metodo
        public ClientResponse ListarProductoPorTipoProducto(int tipoProducto)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_tbl_productos_por_tipo_producto", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@id_tipo_producto", SqlDbType.Int).Value = tipoProducto;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            lstProducto = reader.ReadRows<Tbl_productos>();
                        }
                        clientResponse.DataJson = JsonConvert.SerializeObject(lstProducto).ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                clientResponse.Mensaje = ex.Message;
                clientResponse.Status = "ERROR";
            }
            finally
            {
                conexion.Close();
                conexion.Dispose();
                comando.Dispose();
                reader.Dispose();
            }
            return clientResponse;
        }

        public ClientResponse GetMontoProductoPorId(int id_producto)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_monto_producto_por_id", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@id_producto", SqlDbType.Int).Value = id_producto;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                entidad = reader.ReadFields<Tbl_productos>();
                            }
                        }
                    }
                    clientResponse.DataJson = JsonConvert.SerializeObject(entidad).ToString();
                }
            }
            catch (Exception ex)
            {
                clientResponse.Mensaje = ex.Message;
                clientResponse.Status = "ERROR";
            }
            finally
            {
                conexion.Close();
                conexion.Dispose();
                comando.Dispose();
                reader.Dispose();
            }
            return clientResponse;
        }
        #endregion
    }
}
