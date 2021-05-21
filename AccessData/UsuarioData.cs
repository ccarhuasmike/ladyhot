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
        private static Tbl_usuario entidad;
        //private static SqlConnection conexion;
        //private static SqlCommand comando;
        //private static SqlDataReader reader;
        private static ClientResponse clientResponse;
        #endregion

        #region Constructor
        public UsuarioData()
        {
            //lstContacto = new IEnumerable<tbl_anuncio>();
            //entidad = null;
            //var conexion = null;
            //var comando = null;
            //var reader = null;
            clientResponse = new ClientResponse();
            clientResponse.Status = "OK";
        }
        #endregion

        #region Metodo
        public Tbl_usuario getUsuarioPorCorreo(Tbl_usuario usuario)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_sel_usuario_por_correo", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@tx_email", SqlDbType.VarChar, 60).Value = usuario.tx_email;
                        conexion.Open();
                        using (var reader = comando.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                entidad = new Tbl_usuario();
                                entidad = reader.ReadFields<Tbl_usuario>();
                            }
                        }                       
                    }
                }
            }
            catch (Exception ex)
            {
               
            }
            finally
            {
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }
            return entidad;
        }
        public ClientResponse InsertUsuario(Tbl_usuario objeto)
        {
            int id = 0;
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_ins_usuario", conexion))
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }
            return clientResponse;
        }

        public IEnumerable<Tbl_usuario> GetUsuario_X_Id(int id)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_sel_usuario_x_id", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = id;                       
                        conexion.Open();
                        using (var reader = comando.ExecuteReader())
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }
            return lstUsuario;
        }
        public ClientResponse getUsuarioPorToken(Tbl_usuario entidad)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_sel_usuario_por_token", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@tx_token", SqlDbType.VarChar, 255).Value = entidad.tx_token;                       
                        conexion.Open();
                        using (var reader = comando.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                entidad = reader.ReadFields<Tbl_usuario>();
                                clientResponse.Data = entidad;
                            }
                            else
                            {
                                clientResponse.Data = null;
                            }
                        }
                        clientResponse.Status = "OK";                      
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
            return clientResponse;
        }

        public ClientResponse UpdatePasswordPorUsuario(Tbl_usuario entidad)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_up_password_por_usuario", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@tx_pass", SqlDbType.VarChar,500).Value = entidad.tx_pass;                        
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = entidad.id;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        clientResponse.Status = "OK";

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
            }
            return clientResponse;
        }

        public ClientResponse GetUsuario_X_password(Tbl_usuario entidad)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_sel_usuario_login", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@tx_email", SqlDbType.VarChar,45).Value = entidad.tx_email;
                        comando.Parameters.Add("@tx_pass", SqlDbType.VarChar,500).Value = entidad.tx_pass;
                        conexion.Open();
                        using (var reader = comando.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                entidad = reader.ReadFields<Tbl_usuario>();
                                clientResponse.Data = entidad;
                            }
                            else {
                                clientResponse.Data = null;
                            }
                        }
                       
                        clientResponse.Status = "OK";
                        //using (var reader = comando.ExecuteReader())
                        //{
                        //    lstUsuario = reader.ReadRows<Tbl_usuario>();
                        //}
                        //clientResponse.DataJson = JsonConvert.SerializeObject(lstUsuario).ToString();
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
            return clientResponse;
        }

        public ClientResponse Listar_usuario()
        {
            try
            {

                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_sel_tbl_usuario", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        // comando.Parameters.Add("@id", SqlDbType.Int).Value = id;
                        // comando.Parameters.Add("@id_sede", SqlDbType.Int).Value = idSede;
                        // comando.Parameters.Add("@numero_documento", SqlDbType.VarChar, 15).Value = numeroDocumento;
                        conexion.Open();
                        using (var reader = comando.ExecuteReader())
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }

            clientResponse.DataJson = JsonConvert.SerializeObject(lstUsuario).ToString();
            return clientResponse;
        }

    }
    #endregion
}

