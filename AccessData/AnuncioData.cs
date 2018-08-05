using System;
using System.Collections.Generic;
using System.Data;
using BusinessEntity;
using Communities;
using AccessData.Conexion;
using System.Data.SqlClient;
using Newtonsoft.Json;

namespace AccessData.PersonaDao
{
    public class AnuncioData
    {

        #region Variables
        private static IEnumerable<tbl_anuncio> lstAnuncio;
        private static tbl_anuncio entidad;
        private static SqlConnection conexion;
        private static SqlCommand comando;
        private static SqlDataReader reader;
        private static ClientResponse clientResponse;
        #endregion

        #region Constructor
        public AnuncioData()
        {           
            entidad = null;
            conexion = null;
            comando = null;
            reader = null;
            clientResponse = new ClientResponse();
            clientResponse.Status = "OK";
        }
        #endregion

        #region Metodo

        public ClientResponse MisAnuncio(string usuario_token)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_tbl_anuncio_x_usuario", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@token_usuario", SqlDbType.VarChar,255).Value = usuario_token;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            lstAnuncio = reader.ReadRows<tbl_anuncio>();
                        }
                        clientResponse.DataJson = JsonConvert.SerializeObject(lstAnuncio).ToString();
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

        public ClientResponse darBajarAnuncio(string token_anuncio)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_upd_dar_baja_tbl_anuncio", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@cod_anuncio_encryptado", SqlDbType.VarChar, 500).Value = token_anuncio;
                        conexion.Open();
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

        public ClientResponse InsertPrimerpaso(tbl_anuncio objeto)
        {
            int id = 0;
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_ins_anuncio_primerpaso", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@txt_nombre_ficha", SqlDbType.VarChar, 60).Value = objeto.txt_nombre_ficha;
                        comando.Parameters.Add("@txt_telefono_1", SqlDbType.VarChar, 50).Value = objeto.txt_telefono_1;
                        comando.Parameters.Add("@txt_telefono_2", SqlDbType.VarChar, 50).Value = objeto.txt_telefono_2;
                        comando.Parameters.Add("@txt_email", SqlDbType.VarChar, 40).Value = objeto.txt_email;
                        comando.Parameters.Add("@txt_web", SqlDbType.VarChar, 500).Value = objeto.txt_web;
                        comando.Parameters.Add("@int_edad", SqlDbType.Int).Value = objeto.int_edad;
                        comando.Parameters.Add("@int_pais_origen", SqlDbType.Int).Value = objeto.int_pais_origen;
                        comando.Parameters.Add("@int_estudios", SqlDbType.Int).Value = objeto.int_estudios;
                        comando.Parameters.Add("@txt_presentacion", SqlDbType.Text).Value = objeto.txt_presentacion;
                        comando.Parameters.Add("@id_usuario", SqlDbType.Int).Value = objeto.id_usuario;
                        comando.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        if (comando.Parameters["@id"] != null)
                        {
                            id = Convert.ToInt32(comando.Parameters["@id"].Value);
                            IEnumerable<tbl_anuncio> lst = getAnucionXId(id);
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

        public ClientResponse UpdateTodopaso(tbl_anuncio objeto)
        {          
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_upd_anuncio_todos_paso", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@txt_nombre_ficha", SqlDbType.VarChar, 60).Value = objeto.txt_nombre_ficha;
                        comando.Parameters.Add("@txt_telefono_1", SqlDbType.VarChar, 50).Value = objeto.txt_telefono_1;
                        comando.Parameters.Add("@txt_telefono_2", SqlDbType.VarChar, 50).Value = objeto.txt_telefono_2;
                        comando.Parameters.Add("@txt_email", SqlDbType.VarChar, 40).Value = objeto.txt_email;
                        comando.Parameters.Add("@txt_web", SqlDbType.VarChar, 500).Value = objeto.txt_web;
                        comando.Parameters.Add("@int_edad", SqlDbType.Int).Value = objeto.int_edad;
                        comando.Parameters.Add("@int_pais_origen", SqlDbType.Int).Value = objeto.int_pais_origen;
                        comando.Parameters.Add("@int_estudios", SqlDbType.Int).Value = objeto.int_estudios;
                        comando.Parameters.Add("@txt_presentacion", SqlDbType.Text).Value = objeto.txt_presentacion;
                        
                        comando.Parameters.Add("@int_color_cabello", SqlDbType.Int).Value = objeto.int_color_cabello;
                        comando.Parameters.Add("@int_color_ojos", SqlDbType.Int).Value = objeto.int_color_ojos;
                        comando.Parameters.Add("@int_estatura", SqlDbType.Int).Value = objeto.int_estatura;
                        comando.Parameters.Add("@int_peso", SqlDbType.Int).Value = objeto.int_peso;
                        comando.Parameters.Add("@txt_medidas_busto_cintura_cadera", SqlDbType.VarChar, 45).Value = objeto.txt_medidas_busto_cintura_cadera;
                        comando.Parameters.Add("@txt_descripcion_extra_apariencia", SqlDbType.VarChar, 200).Value = objeto.txt_descripcion_extra_apariencia;
                        
                        comando.Parameters.Add("@dbl_costo_x_tiempo_30min", SqlDbType.Decimal).Value = objeto.dbl_costo_x_tiempo_30min;
                        comando.Parameters.Add("@dbl_costo_x_tiempo_45min", SqlDbType.Decimal).Value = objeto.dbl_costo_x_tiempo_45min;
                        comando.Parameters.Add("@dbl_costo_x_tiempo_1hora", SqlDbType.Decimal).Value = objeto.dbl_costo_x_tiempo_1hora;
                        comando.Parameters.Add("@dbl_costo_x_tiempo_1hora_media", SqlDbType.Decimal).Value = objeto.dbl_costo_x_tiempo_1hora_media;
                        comando.Parameters.Add("@dbl_costo_x_tiempo_2hora", SqlDbType.Decimal).Value = objeto.dbl_costo_x_tiempo_2hora;
                        comando.Parameters.Add("@dbl_costo_x_tiempo_3hora", SqlDbType.Decimal).Value = objeto.dbl_costo_x_tiempo_3hora;
                        comando.Parameters.Add("@dbl_costo_x_tiempo_salidas", SqlDbType.Decimal).Value = objeto.dbl_costo_x_tiempo_salidas;
                        comando.Parameters.Add("@dbl_costo_x_tiempo_toda_noche", SqlDbType.Decimal).Value = objeto.dbl_costo_x_tiempo_toda_noche;
                        comando.Parameters.Add("@dbl_costo_x_viaje", SqlDbType.Decimal).Value = objeto.dbl_costo_x_viaje;
                        comando.Parameters.Add("@txt_forma_pago", SqlDbType.VarChar, 400).Value = objeto.txt_forma_pago;
                        comando.Parameters.Add("@txt_descripcion_extra_tarifa", SqlDbType.VarChar, 255).Value = objeto.txt_descripcion_extra_tarifa;
                        comando.Parameters.Add("@txt_lugar_servicio_distrito", SqlDbType.VarChar, 255).Value = objeto.txt_lugar_servicio_distrito;
                        comando.Parameters.Add("@fl_atencion_24horas", SqlDbType.Int).Value = objeto.fl_atencion_24horas;
                        comando.Parameters.Add("@tx_descripcion_extra_horario", SqlDbType.VarChar, 200).Value = objeto.tx_descripcion_extra_horario;
                        comando.Parameters.Add("@tx_lugar_atencion", SqlDbType.VarChar, 255).Value = objeto.tx_lugar_atencion;
                        comando.Parameters.Add("@tx_servicios_ofrece", SqlDbType.VarChar, 400).Value = objeto.tx_servicios_ofrece;
                        comando.Parameters.Add("@tx_descripcion_extra_servicio", SqlDbType.VarChar, 255).Value = objeto.tx_descripcion_extra_servicio;

                        comando.Parameters.Add("@id", SqlDbType.Int).Value = objeto.id;

                        conexion.Open();
                        comando.ExecuteNonQuery();
                        IEnumerable<tbl_anuncio> lst = getAnucionXId(objeto.id);
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

        public ClientResponse UpdateSegundopaso(tbl_anuncio objeto)
        {          
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_upd_anuncio_segundopaso", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@int_color_cabello", SqlDbType.Int).Value = objeto.int_color_cabello;
                        comando.Parameters.Add("@int_color_ojos", SqlDbType.Int).Value = objeto.int_color_ojos;
                        comando.Parameters.Add("@int_estatura", SqlDbType.Int).Value = objeto.int_estatura;
                        comando.Parameters.Add("@int_peso", SqlDbType.Int).Value = objeto.int_peso;
                        comando.Parameters.Add("@txt_medidas_busto_cintura_cadera", SqlDbType.VarChar, 45).Value = objeto.txt_medidas_busto_cintura_cadera;
                        comando.Parameters.Add("@txt_descripcion_extra_apariencia", SqlDbType.VarChar, 200).Value = objeto.txt_descripcion_extra_apariencia;
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = objeto.id;                       
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        IEnumerable<tbl_anuncio> lst = getAnucionXId(objeto.id);
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

        public ClientResponse UpdateTercerpaso(tbl_anuncio objeto)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_upd_anuncio_tercerpaso", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@dbl_costo_x_tiempo_30min", SqlDbType.Decimal).Value = objeto.dbl_costo_x_tiempo_30min;
                        comando.Parameters.Add("@dbl_costo_x_tiempo_45min", SqlDbType.Decimal).Value = objeto.dbl_costo_x_tiempo_45min;
                        comando.Parameters.Add("@dbl_costo_x_tiempo_1hora", SqlDbType.Decimal).Value = objeto.dbl_costo_x_tiempo_1hora;
                        comando.Parameters.Add("@dbl_costo_x_tiempo_1hora_media", SqlDbType.Decimal).Value = objeto.dbl_costo_x_tiempo_1hora_media;
                        comando.Parameters.Add("@dbl_costo_x_tiempo_2hora", SqlDbType.Decimal).Value = objeto.dbl_costo_x_tiempo_2hora;
                        comando.Parameters.Add("@dbl_costo_x_tiempo_3hora", SqlDbType.Decimal).Value = objeto.dbl_costo_x_tiempo_3hora;
                        comando.Parameters.Add("@dbl_costo_x_tiempo_salidas", SqlDbType.Decimal).Value = objeto.dbl_costo_x_tiempo_salidas;
                        comando.Parameters.Add("@dbl_costo_x_tiempo_toda_noche", SqlDbType.Decimal).Value = objeto.dbl_costo_x_tiempo_toda_noche;
                        comando.Parameters.Add("@dbl_costo_x_viaje", SqlDbType.Decimal).Value = objeto.dbl_costo_x_viaje;
                        comando.Parameters.Add("@txt_forma_pago", SqlDbType.VarChar, 400).Value = objeto.txt_forma_pago;
                        comando.Parameters.Add("@txt_descripcion_extra_tarifa", SqlDbType.VarChar, 255).Value = objeto.txt_descripcion_extra_tarifa;
                        comando.Parameters.Add("@txt_lugar_servicio_distrito", SqlDbType.VarChar, 255).Value = objeto.txt_lugar_servicio_distrito;
                        comando.Parameters.Add("@fl_atencion_24horas", SqlDbType.Int).Value = objeto.fl_atencion_24horas;
                        comando.Parameters.Add("@tx_descripcion_extra_horario", SqlDbType.VarChar, 200).Value = objeto.tx_descripcion_extra_horario;
                        comando.Parameters.Add("@tx_lugar_atencion", SqlDbType.VarChar, 255).Value = objeto.tx_lugar_atencion;
                        comando.Parameters.Add("@tx_servicios_ofrece", SqlDbType.VarChar, 400).Value = objeto.tx_servicios_ofrece;
                        comando.Parameters.Add("@tx_descripcion_extra_servicio", SqlDbType.VarChar, 255).Value = objeto.tx_descripcion_extra_servicio;
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = objeto.id;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        IEnumerable<tbl_anuncio> lst = getAnucionXId(objeto.id);
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

        public IEnumerable<tbl_anuncio> getAnucionXId(int id_anucion)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_tbl_anuncio_x_id", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = id_anucion;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            lstAnuncio = reader.ReadRows<tbl_anuncio>();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //clientResponse.Mensaje = ex.Message;
                //clientResponse.Status = "ERROR";
            }
            finally
            {
                conexion.Close();
                conexion.Dispose();
                comando.Dispose();
                reader.Dispose();
            }
            return lstAnuncio;
        }


        public IEnumerable<tbl_anuncio> getAnucion_x_tokens(string token_anuncio)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_tbl_anuncio_x_tokens", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@cod_anuncio_encryptado", SqlDbType.VarChar, 500).Value = token_anuncio;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            lstAnuncio = reader.ReadRows<tbl_anuncio>();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //clientResponse.Mensaje = ex.Message;
                //clientResponse.Status = "ERROR";
            }
            finally
            {
                conexion.Close();
                conexion.Dispose();
                comando.Dispose();
                reader.Dispose();
            }
            return lstAnuncio;
        }
        #endregion



    }
}
