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
using System.Xml.Linq;

namespace AccessData
{
    public class GaleriaData
    {
        #region Variables
        private static IEnumerable<Tbl_galeria_anuncio> lstGaleria;
        private static Tbl_galeria_anuncio entidad;
        private static SqlConnection conexion;
        private static SqlCommand comando;
        private static SqlDataReader reader;
        private static ClientResponse clientResponse;
        #endregion

        #region Constructor
        public GaleriaData()
        {
            lstGaleria = new List<Tbl_galeria_anuncio>();
            entidad = null;
            conexion = null;
            comando = null;
            reader = null;
            clientResponse = new ClientResponse();
            clientResponse.Status = "OK";
        }

        public ClientResponse Insert_GaleriaObject(Tbl_galeria_anuncio objeto)
        {
            try
            { 
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("usp_ins_galeria_object", conexion))
                    {   
                        comando.Parameters.AddWithValue("@id_anuncio", objeto.id_anuncio);
                        comando.Parameters.AddWithValue("@tx_filename", objeto.tx_filename);
                        comando.Parameters.AddWithValue("@tx_ruta_file", objeto.tx_ruta_file);
                        comando.Parameters.AddWithValue("@tx_ruta_file_cort", objeto.tx_ruta_file_cort);
                        comando.Parameters.AddWithValue("@txt_ruta_virtuales", objeto.txt_ruta_virtuales);
                        comando.Parameters.AddWithValue("@txt_ruta_virtuales_cortada", objeto.txt_ruta_virtuales_cortada);
                        comando.Parameters.AddWithValue("@id_tipo_archivo", objeto.id_tipo_archivo);
                        comando.Parameters.AddWithValue("@size_file", objeto.size_file);
                        comando.Parameters.AddWithValue("@IdTipoPresentacion", objeto.IdTipoPresentacion);                        
                        comando.Parameters.Add("@Ind", SqlDbType.Int).Direction = ParameterDirection.Output;
                        comando.Parameters.Add("@Mensaje", SqlDbType.VarChar, 200).Direction = ParameterDirection.Output;
                        comando.CommandType = CommandType.StoredProcedure;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        int ind = Convert.ToInt32(comando.Parameters["@Ind"].Value);
                        string mensaje = Convert.ToString(comando.Parameters["@Mensaje"].Value);
                        if (ind > 0)
                        {
                            Tbl_galeria_anuncio entidad = new Tbl_galeria_anuncio() { id_anuncio = objeto.id_anuncio };                            
                            IEnumerable<Tbl_galeria_anuncio> lst = Get_galeria_x_id_anuncio(entidad);
                            clientResponse.DataJson = JsonConvert.SerializeObject(lst).ToString();
                            clientResponse.Mensaje = mensaje;
                            clientResponse.Status = "OK";
                        }
                        else
                        {
                            clientResponse.Mensaje = mensaje;
                            clientResponse.Status = "ERROR";
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
            }
            return clientResponse;
        }

        public ClientResponse Insert_Galeria(List<Tbl_galeria_anuncio> list, int id_anuncio)
        {
            try
            {
                XElement root = new XElement("ROOT");
                foreach (Tbl_galeria_anuncio detalle in list)
                {
                    XElement address = new XElement("Detalle",
                    new XElement("tx_filename", detalle.tx_filename),
                    new XElement("tx_ruta_file", detalle.tx_ruta_file),
                    new XElement("tx_ruta_file_cort", detalle.tx_ruta_file_cort),
                    new XElement("size_file", detalle.size_file),
                    new XElement("id_tipo_archivo", detalle.id_tipo_archivo),
                    new XElement("txt_ruta_virtuales", detalle.txt_ruta_virtuales),
                    new XElement("txt_ruta_virtuales_cortada", detalle.txt_ruta_virtuales_cortada)
                    );
                    root.Add(address);
                }
                string xml = root.ToString();
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("usp_ins_galeria", conexion))
                    {
                        comando.Parameters.AddWithValue("@xml", xml);
                        comando.Parameters.AddWithValue("@id_anuncio", id_anuncio);
                        comando.Parameters.Add("@Ind", SqlDbType.Int).Direction = ParameterDirection.Output;
                        comando.Parameters.Add("@Mensaje", SqlDbType.VarChar, 200).Direction = ParameterDirection.Output;
                        comando.CommandType = CommandType.StoredProcedure;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        int ind = Convert.ToInt32(comando.Parameters["@Ind"].Value);
                        string mensaje = Convert.ToString(comando.Parameters["@Mensaje"].Value);

                        if (ind > 0)
                        {
                            Tbl_galeria_anuncio entidad = new Tbl_galeria_anuncio() { id_anuncio = id_anuncio };
                            IEnumerable<Tbl_galeria_anuncio> lst = Get_galeria_x_id_anuncio(entidad);
                            clientResponse.DataJson = JsonConvert.SerializeObject(lst).ToString();
                            clientResponse.Mensaje = mensaje;
                            clientResponse.Status = "Ok";
                        }
                        else
                        {
                            clientResponse.Mensaje = mensaje;
                            clientResponse.Status = "ERROR";
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
            }
            return clientResponse;
        }

        public ClientResponse Insert_Videos(List<Tbl_galeria_anuncio> list, int id_anuncio)
        {
            try
            {
                XElement root = new XElement("ROOT");
                foreach (Tbl_galeria_anuncio detalle in list)
                {
                    XElement address = new XElement("Detalle",
                    new XElement("tx_filename", detalle.tx_filename),
                    new XElement("tx_ruta_file", detalle.tx_ruta_file),
                    new XElement("tx_ruta_file_cort", detalle.tx_ruta_file_cort),
                    new XElement("size_file", detalle.size_file),
                    new XElement("id_tipo_archivo", detalle.id_tipo_archivo),
                    new XElement("txt_ruta_virtuales", detalle.txt_ruta_virtuales)
                    );
                    root.Add(address);
                }
                string xml = root.ToString();
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("usp_ins_videos", conexion))
                    {
                        comando.Parameters.AddWithValue("@xml", xml);
                        comando.Parameters.AddWithValue("@id_anuncio", id_anuncio);
                        comando.Parameters.Add("@Ind", SqlDbType.Int).Direction = ParameterDirection.Output;
                        comando.Parameters.Add("@Mensaje", SqlDbType.VarChar, 200).Direction = ParameterDirection.Output;
                        comando.CommandType = CommandType.StoredProcedure;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        int ind = Convert.ToInt32(comando.Parameters["@Ind"].Value);
                        string mensaje = Convert.ToString(comando.Parameters["@Mensaje"].Value);

                        if (ind > 0)
                        {
                            Tbl_galeria_anuncio entidad = new Tbl_galeria_anuncio() { id_anuncio = id_anuncio };
                            IEnumerable<Tbl_galeria_anuncio> lst = Get_video_x_id_anuncio(entidad);
                            clientResponse.DataJson = JsonConvert.SerializeObject(lst).ToString();
                            clientResponse.Mensaje = mensaje;
                            clientResponse.Status = "Ok";
                        }
                        else
                        {
                            clientResponse.Mensaje = mensaje;
                            clientResponse.Status = "ERROR";
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
            }
            return clientResponse;
        }

        public ClientResponse Get_galeria_x_id(Tbl_galeria_anuncio objeto)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_galeria_x_id", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = objeto.id;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                entidad = reader.ReadFields<Tbl_galeria_anuncio>();
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
            return clientResponse;
        }

        public IEnumerable<Tbl_galeria_anuncio> Get_galeria_x_id_anuncio(Tbl_galeria_anuncio objeto)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_galeria_x_id_anuncion", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@id_anuncio", SqlDbType.Int).Value = objeto.id_anuncio;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            lstGaleria = reader.ReadRows<Tbl_galeria_anuncio>();
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
            return lstGaleria;
        }

        public IEnumerable<Tbl_galeria_anuncio> Get_video_x_id_anuncio(Tbl_galeria_anuncio objeto)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_videos_x_id_anuncion", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@id_anuncio", SqlDbType.Int).Value = objeto.id_anuncio;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            lstGaleria = reader.ReadRows<Tbl_galeria_anuncio>();
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
            return lstGaleria;
        }


        public ClientResponse Eliminar_galeria_x_id(Tbl_galeria_anuncio objeto)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_del_galeria_x_id", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = objeto.id;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        //IEnumerable<Tbl_galeria_anuncio> lst = Get_galeria_x_id_anuncio(objeto);
                        //clientResponse.DataJson = JsonConvert.SerializeObject(lst).ToString();
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
                conexion.Close();
                conexion.Dispose();
                comando.Dispose();
               // reader.Dispose();
            }
            return clientResponse;
        }

        public ClientResponse Eliminar_video_x_id(Tbl_galeria_anuncio objeto)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_del_galeria_x_id", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = objeto.id;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        IEnumerable<Tbl_galeria_anuncio> lst = Get_video_x_id_anuncio(objeto);
                        clientResponse.DataJson = JsonConvert.SerializeObject(lst).ToString();
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
        #endregion
    }
}
