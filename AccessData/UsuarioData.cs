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
    public class UsuarioData
    {
        #region Variables
        private static IEnumerable<tbl_usuario> lstContacto;
        private static tbl_usuario entidad;
        private static SqlConnection conexion;
        private static SqlCommand comando;
        private static SqlDataReader reader;
        private static ClientResponse clientResponse;
        #endregion

        #region Constructor
        public UsuarioData()
        {
            //lstContacto = new IEnumerable<tbl_anuncio>();
            entidad = null;
            conexion = null;
            comando = null;
            reader = null;
            clientResponse = new ClientResponse();
            clientResponse.Status = "OK";
        }
        #endregion

        #region Metodo
        public ClientResponse listar_usuario()
        {
            try
            {

                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_tbl_usuario", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        // comando.Parameters.Add("@id", SqlDbType.Int).Value = id;
                        // comando.Parameters.Add("@id_sede", SqlDbType.Int).Value = idSede;
                        // comando.Parameters.Add("@numero_documento", SqlDbType.VarChar, 15).Value = numeroDocumento;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            lstContacto = reader.ReadRows<tbl_usuario>();
                            //while (reader.Read())
                            //{

                            //}
                        }
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

            clientResponse.DataJson = JsonConvert.SerializeObject(lstContacto).ToString();
            return clientResponse;
        }

    }
    #endregion
}

