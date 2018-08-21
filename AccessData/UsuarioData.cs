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
        private static IEnumerable<Tbl_usuario> lstUsuario;
        //private static tbl_usuario entidad;
        private static SqlConnection conexion;
        private static SqlCommand comando;
        private static SqlDataReader reader;
        private static ClientResponse clientResponse;
        #endregion

        #region Constructor
        public UsuarioData()
        {
            //lstContacto = new IEnumerable<tbl_anuncio>();
            //entidad = null;
            conexion = null;
            comando = null;
            reader = null;
            clientResponse = new ClientResponse();
            clientResponse.Status = "OK";
        }
        #endregion

        #region Metodo

        public ClientResponse InsertUsuario(Tbl_usuario objeto)
        {
            int id = 0;
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_ins_usuario", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@tx_email", SqlDbType.VarChar, 60).Value = objeto.tx_email;
                        comando.Parameters.Add("@tx_pass", SqlDbType.VarChar, 50).Value = objeto.tx_pass;
                        comando.Parameters.Add("@tx_telefono", SqlDbType.VarChar, 50).Value = objeto.tx_telefono;                      
                        comando.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        if (comando.Parameters["@id"] != null)
                        {
                            id = Convert.ToInt32(comando.Parameters["@id"].Value);
                            IEnumerable<Tbl_usuario> lst = GetUsuario_X_Id(id);
                            clientResponse.DataJson = JsonConvert.SerializeObject(lst).ToString();
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
            return clientResponse;
        }

        public IEnumerable<Tbl_usuario> GetUsuario_X_Id(int id)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_usuario_x_id", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = id;                       
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            lstUsuario = reader.ReadRows<Tbl_usuario>();
                        }
                    }
                }
            }
            catch (Exception )
            {
                
            }
            finally
            {
                conexion.Close();
                conexion.Dispose();
                comando.Dispose();
                reader.Dispose();
            }
            return lstUsuario;
        }

        public ClientResponse GetUsuario_X_password(Tbl_usuario entidad)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_usuario_login", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@tx_email", SqlDbType.VarChar,45).Value = entidad.tx_email;
                        comando.Parameters.Add("@tx_pass", SqlDbType.VarChar,500).Value = entidad.tx_pass;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            lstUsuario = reader.ReadRows<Tbl_usuario>();
                        }
                        clientResponse.DataJson = JsonConvert.SerializeObject(lstUsuario).ToString();
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

        public ClientResponse Listar_usuario()
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
                            lstUsuario = reader.ReadRows<Tbl_usuario>();                           
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

            clientResponse.DataJson = JsonConvert.SerializeObject(lstUsuario).ToString();
            return clientResponse;
        }

    }
    #endregion
}

