using AccessData.Conexion;
using BusinessEntity;
using Communities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Communities;


namespace AccessData
{
    public class ParameterData
    {

        #region Variables
        private static IEnumerable<Tbl_parameter_det> lstParamaterDet;
        private static Tbl_parameter_det entidad;
        private static SqlConnection conexion;
        private static SqlCommand comando;
        private static SqlDataReader reader;
        private static ClientResponse clientResponse;
        #endregion

        #region Constructor
        public ParameterData()
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
        public IEnumerable<Tbl_parameter_det> GetParameter_skey(Tbl_parameter_det det)
        {
            try
            {

                //using (StreamWriter w = File.AppendText("log.txt"))
                //{
                //    Utilidades.Log("Test1", w);
                //    Utilidades.Log("Test2", w);
                //}               
                Utilidades.WriteLog("inicio log");
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_parameter_skey", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@skey_cab", SqlDbType.VarChar,45).Value = det.paramter_cab.skey_cab;
                        // comando.Parameters.Add("@id_sede", SqlDbType.Int).Value = idSede;
                        // comando.Parameters.Add("@numero_documento", SqlDbType.VarChar, 15).Value = numeroDocumento;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            
                                lstParamaterDet = reader.ReadRows<Tbl_parameter_det>();                               
                            
                        }
                    }
                }
            }
            catch (Exception  ex)
            {
                Utilidades.WriteLog(ex.Message);
                //using (StreamReader r = File.OpenText("log.txt"))
                //{
                //    Utilidades.DumpLog(r);
                //}
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
            return lstParamaterDet;
        }

        public ClientResponse GetParameter_skey_x_det_Id(Tbl_parameter_det det)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_parameter_skey_x_det_id", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@skey_cab", SqlDbType.VarChar, 45).Value = det.paramter_cab.skey_cab;
                        comando.Parameters.Add("@skey_det", SqlDbType.VarChar, 45).Value = det.skey_det;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            //entidad = reader.ReadFields<tbl_parameter_det>();
                            if (reader.Read())
                            {
                                entidad = new Tbl_parameter_det();
                                entidad.val_valor = Convert.ToInt32(reader["val_valor"] == DBNull.Value ? 0 : reader["val_valor"]);
                                entidad.tx_descripcion = Convert.ToString(reader["tx_descripcion"] == DBNull.Value ? "" : reader["tx_descripcion"]);
                            }

                        }
                        clientResponse.DataJson = JsonConvert.SerializeObject(entidad).ToString();
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

            //clientResponse.DataJson = JsonConvert.SerializeObject(lstContacto).ToString();
            return clientResponse;
            //return lstParamaterDet;
        }

        #endregion
    }
}
