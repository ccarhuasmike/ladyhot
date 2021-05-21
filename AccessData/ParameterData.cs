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
        private static IEnumerable<Tbl_parameter_detDto> lstParamaterDet;
        private static Tbl_parameter_det entidad;
        //private static SqlConnection conexion;
        //private static SqlCommand comando;
        //private static SqlDataReader reader;
        private static ClientResponse clientResponse;
        #endregion

        #region Constructor
        public ParameterData()
        {
            //lstContacto = new IEnumerable<tbl_anuncio>();
            entidad = null;
            //var conexion = null;
            //var comando = null;
            //var reader = null;
            clientResponse = new ClientResponse();
            clientResponse.Status = "OK";
        }
        #endregion

        #region Metodo

        public IEnumerable<Tbl_parameter_detDto> GetParameter_skey(Tbl_parameter_det det)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_sel_parameter_skey", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@skey_cab", SqlDbType.VarChar, 45).Value = det.paramter_cab.skey_cab;
                        conexion.Open();
                        using (var reader = comando.ExecuteReader())
                        {
                            lstParamaterDet = reader.ReadRows<Tbl_parameter_detDto>();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Utilidades.WriteLog(ex.Message);
                clientResponse.Mensaje = ex.Message;
                clientResponse.Status = "ERROR";
            }
            finally
            {
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }
            return lstParamaterDet;
        }

        public ClientResponse GetParameter_skey_x_det_Id(Tbl_parameter_det det)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_sel_parameter_skey_x_det_id", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@skey_cab", SqlDbType.VarChar, 45).Value = det.paramter_cab.skey_cab;
                        comando.Parameters.Add("@skey_det", SqlDbType.VarChar, 45).Value = det.skey_det;
                        conexion.Open();
                        using (var reader = comando.ExecuteReader())
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }

            //clientResponse.DataJson = JsonConvert.SerializeObject(lstContacto).ToString();
            return clientResponse;
            //return lstParamaterDet;
        }

        #endregion
    }
}
