using System;
using System.Collections.Generic;
using System.Data;
using BusinessEntity;
using Communities;
using AccessData.Conexion;
using System.Data.SqlClient;
using Newtonsoft.Json;
using System.Xml.Linq;

namespace AccessData.PersonaDao
{
    public class AnuncioData
    {

        #region Variables
        private static IEnumerable<Tbl_anuncio> lstAnuncio;
        private static Tbl_anuncio entidad;
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
        public ClientResponse ListarAnuncio_top_10()
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_fichas_anuncio_top_10", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            lstAnuncio = reader.ReadRows<Tbl_anuncio>();
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
        public ClientResponse ListarAnuncio()
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_fichas_anuncio", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            lstAnuncio = reader.ReadRows<Tbl_anuncio>();
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
        public ClientResponse MisAnuncio(string usuario_token)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_tbl_anuncio_x_usuario", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@token_usuario", SqlDbType.VarChar, 255).Value = usuario_token;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            lstAnuncio = reader.ReadRows<Tbl_anuncio>();
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
        public ClientResponse DarBajarAnuncio(Tbl_anuncio entidad)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_upd_dar_baja_tbl_anuncio", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@cod_anuncio_encryptado", SqlDbType.VarChar, 500).Value = entidad.cod_anuncio_encryptado;
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
                conexion.Close();
                conexion.Dispose();
                comando.Dispose();
            }
            return clientResponse;
        }
        public ClientResponse ActualizarPrimerpaso(Tbl_anuncio objeto)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_up_anuncio_primerpaso", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@txt_nombre_ficha", SqlDbType.VarChar, 60).Value = objeto.txt_nombre_ficha == null ? "" : objeto.txt_nombre_ficha;
                        comando.Parameters.Add("@txt_telefono_1", SqlDbType.VarChar, 50).Value = objeto.txt_telefono_1 == null ? "" : objeto.txt_telefono_1;
                        comando.Parameters.Add("@txt_telefono_2", SqlDbType.VarChar, 50).Value = objeto.txt_telefono_2 == null ? "" : objeto.txt_telefono_2;
                        comando.Parameters.Add("@txt_email", SqlDbType.VarChar, 40).Value = objeto.txt_email == null ? "" : objeto.txt_email;
                        comando.Parameters.Add("@txt_web", SqlDbType.VarChar, 500).Value = objeto.txt_web == null ? "" : objeto.txt_web;
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = objeto.id;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        Tbl_anuncio entidad = GetAnucionXId(objeto.id);
                        clientResponse.Data = JsonConvert.SerializeObject(entidad).ToString();
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
        public ClientResponse InsertPrimerpaso(Tbl_anuncio objeto)
        {
            int id = 0;
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_ins_anuncio_primerpaso", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@txt_nombre_ficha", SqlDbType.VarChar, 60).Value = objeto.txt_nombre_ficha == null ? "" : objeto.txt_nombre_ficha;
                        comando.Parameters.Add("@txt_telefono_1", SqlDbType.VarChar, 50).Value = objeto.txt_telefono_1 == null ? "" : objeto.txt_telefono_1;
                        comando.Parameters.Add("@txt_telefono_2", SqlDbType.VarChar, 50).Value = objeto.txt_telefono_2 == null ? "" : objeto.txt_telefono_2;
                        comando.Parameters.Add("@txt_email", SqlDbType.VarChar, 40).Value = objeto.txt_email == null ? "" : objeto.txt_email;
                        comando.Parameters.Add("@txt_web", SqlDbType.VarChar, 500).Value = objeto.txt_web == null ? "" : objeto.txt_web;
                        comando.Parameters.Add("@id_usuario", SqlDbType.Int).Value = objeto.id_usuario;
                        comando.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        if (comando.Parameters["@id"] != null)
                        {
                            //dante gay medio weon
                            //chiv
                            //mike
                            id = Convert.ToInt32(comando.Parameters["@id"].Value);
                            clientResponse.Id = id;
                            Tbl_anuncio entidad = GetAnucionXId(id);
                            clientResponse.Data = JsonConvert.SerializeObject(entidad).ToString();
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
        public ClientResponse UpdateSegundopaso(Tbl_anuncio objeto)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_upd_anuncio_segundopaso", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@int_edad", SqlDbType.Int).Value = objeto.int_edad;
                        comando.Parameters.Add("@int_pais_origen", SqlDbType.Int).Value = objeto.int_pais_origen;
                        comando.Parameters.Add("@int_estudios", SqlDbType.Int).Value = objeto.int_estudios;
                        comando.Parameters.Add("@txt_presentacion", SqlDbType.Text).Value = objeto.txt_presentacion;
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = objeto.id;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        Tbl_anuncio entidad = GetAnucionXId(objeto.id);
                        clientResponse.Data = JsonConvert.SerializeObject(entidad).ToString();
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
        public ClientResponse UpdateTercerpaso(Tbl_anuncio objeto)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_upd_anuncio_tercerpaso", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@int_color_cabello", SqlDbType.Int).Value = objeto.int_color_cabello;
                        comando.Parameters.Add("@int_color_ojos", SqlDbType.Int).Value = objeto.int_color_ojos;
                        comando.Parameters.Add("@int_estatura", SqlDbType.Int).Value = objeto.int_estatura;
                        comando.Parameters.Add("@int_peso", SqlDbType.Int).Value = objeto.int_peso;
                        comando.Parameters.Add("@txt_medidas_busto_cintura_cadera", SqlDbType.VarChar, 45).Value = objeto.txt_medidas_busto_cintura_cadera;
                        comando.Parameters.Add("@txt_descripcion_extra_apariencia", SqlDbType.VarChar, 200).Value = objeto.txt_descripcion_extra_apariencia == null ? "" : objeto.txt_descripcion_extra_apariencia;
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = objeto.id;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        Tbl_anuncio entidad = GetAnucionXId(objeto.id);
                        clientResponse.Data = JsonConvert.SerializeObject(entidad).ToString();
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
        public ClientResponse UpdateCuartopaso(Tbl_anuncio objeto)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_upd_anuncio_cuartopaso", conexion))
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
                        comando.Parameters.Add("@txt_descripcion_extra_tarifa", SqlDbType.VarChar, 255).Value = objeto.txt_descripcion_extra_tarifa == null ? "" : objeto.txt_descripcion_extra_tarifa;
                        //comando.Parameters.Add("@txt_lugar_servicio_distrito", SqlDbType.VarChar, 255).Value = objeto.txt_lugar_servicio_distrito;
                        //comando.Parameters.Add("@fl_atencion_24horas", SqlDbType.Int).Value = objeto.fl_atencion_24horas;
                        //comando.Parameters.Add("@tx_descripcion_extra_horario", SqlDbType.VarChar, 200).Value = objeto.tx_descripcion_extra_horario == null ? "" : objeto.tx_descripcion_extra_horario;
                        //comando.Parameters.Add("@tx_lugar_atencion", SqlDbType.VarChar, 255).Value = objeto.tx_lugar_atencion;
                        //comando.Parameters.Add("@tx_servicios_ofrece", SqlDbType.VarChar, 400).Value = objeto.tx_servicios_ofrece;
                        //comando.Parameters.Add("@tx_descripcion_extra_servicio", SqlDbType.VarChar, 255).Value = objeto.tx_descripcion_extra_servicio == null ? "" : objeto.tx_descripcion_extra_servicio;
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = objeto.id;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        Tbl_anuncio entidad = GetAnucionXId(objeto.id);
                        clientResponse.Data = JsonConvert.SerializeObject(entidad).ToString();
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

        public ClientResponse UpdateQuintopaso(Tbl_anuncio objeto)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_upd_anuncio_quintopaso", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@txt_lugar_servicio_distrito", SqlDbType.VarChar, 255).Value = objeto.txt_lugar_servicio_distrito;
                        comando.Parameters.Add("@fl_atencion_24horas", SqlDbType.Int).Value = objeto.fl_atencion_24horas;
                        comando.Parameters.Add("@tx_descripcion_extra_horario", SqlDbType.VarChar, 200).Value = objeto.tx_descripcion_extra_horario == null ? "" : objeto.tx_descripcion_extra_horario;
                        comando.Parameters.Add("@tx_lugar_atencion", SqlDbType.VarChar, 255).Value = objeto.tx_lugar_atencion;
                        comando.Parameters.Add("@tx_servicios_ofrece", SqlDbType.VarChar, 400).Value = objeto.tx_servicios_ofrece;
                        comando.Parameters.Add("@tx_descripcion_extra_servicio", SqlDbType.VarChar, 255).Value = objeto.tx_descripcion_extra_servicio == null ? "" : objeto.tx_descripcion_extra_servicio;
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = objeto.id;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        Tbl_anuncio entidad = GetAnucionXId(objeto.id);
                        clientResponse.Data = JsonConvert.SerializeObject(entidad).ToString();
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

        public ClientResponse UpdateTodopaso(Tbl_anuncio objeto)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_upd_anuncio_todos_paso", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@txt_nombre_ficha", SqlDbType.VarChar, 60).Value = objeto.txt_nombre_ficha == null ? "" : objeto.txt_nombre_ficha;
                        comando.Parameters.Add("@txt_telefono_1", SqlDbType.VarChar, 50).Value = objeto.txt_telefono_1 == null ? "" : objeto.txt_telefono_1;
                        comando.Parameters.Add("@txt_telefono_2", SqlDbType.VarChar, 50).Value = objeto.txt_telefono_2 == null ? "" : objeto.txt_telefono_2;
                        comando.Parameters.Add("@txt_email", SqlDbType.VarChar, 40).Value = objeto.txt_email == null ? "" : objeto.txt_email;
                        comando.Parameters.Add("@txt_web", SqlDbType.VarChar, 500).Value = objeto.txt_web == null ? "" : objeto.txt_web;
                        comando.Parameters.Add("@int_edad", SqlDbType.Int).Value = objeto.int_edad;
                        comando.Parameters.Add("@int_pais_origen", SqlDbType.Int).Value = objeto.int_pais_origen;
                        comando.Parameters.Add("@int_estudios", SqlDbType.Int).Value = objeto.int_estudios;
                        comando.Parameters.Add("@txt_presentacion", SqlDbType.Text).Value = objeto.txt_presentacion == null ? "" : objeto.txt_presentacion;
                        comando.Parameters.Add("@int_color_cabello", SqlDbType.Int).Value = objeto.int_color_cabello;
                        comando.Parameters.Add("@int_color_ojos", SqlDbType.Int).Value = objeto.int_color_ojos;
                        comando.Parameters.Add("@int_estatura", SqlDbType.Int).Value = objeto.int_estatura;
                        comando.Parameters.Add("@int_peso", SqlDbType.Int).Value = objeto.int_peso;
                        comando.Parameters.Add("@txt_medidas_busto_cintura_cadera", SqlDbType.VarChar, 45).Value = objeto.txt_medidas_busto_cintura_cadera;
                        comando.Parameters.Add("@txt_descripcion_extra_apariencia", SqlDbType.VarChar, 200).Value = objeto.txt_descripcion_extra_apariencia == null ? "" : objeto.txt_descripcion_extra_apariencia;
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
                        comando.Parameters.Add("@txt_descripcion_extra_tarifa", SqlDbType.VarChar, 255).Value = objeto.txt_descripcion_extra_tarifa == null ? "" : objeto.txt_descripcion_extra_tarifa;
                        comando.Parameters.Add("@txt_lugar_servicio_distrito", SqlDbType.VarChar, 255).Value = objeto.txt_lugar_servicio_distrito == null ? "" : objeto.txt_lugar_servicio_distrito;
                        comando.Parameters.Add("@fl_atencion_24horas", SqlDbType.Int).Value = objeto.fl_atencion_24horas;
                        comando.Parameters.Add("@tx_descripcion_extra_horario", SqlDbType.VarChar, 200).Value = objeto.tx_descripcion_extra_horario == null ? "" : objeto.tx_descripcion_extra_horario;
                        comando.Parameters.Add("@tx_lugar_atencion", SqlDbType.VarChar, 255).Value = objeto.tx_lugar_atencion;
                        comando.Parameters.Add("@tx_servicios_ofrece", SqlDbType.VarChar, 400).Value = objeto.tx_servicios_ofrece;
                        comando.Parameters.Add("@tx_descripcion_extra_servicio", SqlDbType.VarChar, 255).Value = objeto.tx_descripcion_extra_servicio == null ? "" : objeto.tx_descripcion_extra_servicio;

                        //ssss
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = objeto.id;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        Tbl_anuncio entidad = GetAnucionXId(objeto.id);
                        clientResponse.Data = JsonConvert.SerializeObject(entidad).ToString();
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
        public Tbl_anuncio GetAnucionXId(int id_anucion)
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
                            if (reader.Read())
                            {
                                entidad = reader.ReadFields<Tbl_anuncio>();
                            }
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
            return entidad;
        }
        public Tbl_anuncio GetAnucion_x_tokens(string token_anuncio)
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
                            while (reader.Read())
                            {
                                entidad = reader.ReadFields<Tbl_anuncio>();
                            }

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
            return entidad;
        }
        public ClientResponse GetAnucion_Details_anucion_x_tokens(string token_anuncio)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_fichas_anuncio_x_tokens", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@cod_anuncio_encryptado", SqlDbType.VarChar, 500).Value = token_anuncio;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                entidad = reader.ReadFields<Tbl_anuncio>();
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
        public ClientResponse ListarAnuncioPaginate(Tbl_anuncio tblAnuncio)
        {
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_sel_anuncio_paginada", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@PageIndex", SqlDbType.Int).Value = tblAnuncio.beanPaginate.pageIndex;
                        comando.Parameters.Add("@pageSize", SqlDbType.Int).Value = tblAnuncio.beanPaginate.pageSize;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            lstAnuncio = reader.ReadRows<Tbl_anuncio>();
                            reader.NextResult();
                            while (reader.Read())
                            {
                                clientResponse.totalCount = reader["totalCount"].ToString();
                            }
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

        public ClientResponse listarPaginado(Pagination objeto)
        {
            int recordCount = 0;
            try
            {
                using (conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (comando = new SqlCommand("sp_listar_anuncio", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;                        
                        comando.Parameters.Add("@vi_pagina", SqlDbType.Int).Value = objeto.CurrentPage;
                        comando.Parameters.Add("@vi_registrosporpagina", SqlDbType.Int).Value = objeto.ItemsPerPage;
                        comando.Parameters.Add("@vi_RecordCount", SqlDbType.Int).Direction = ParameterDirection.Output;
                        conexion.Open();
                        using (reader = comando.ExecuteReader())
                        {
                            lstAnuncio = reader.ReadRows<Tbl_anuncio>();
                        }
                        recordCount = Convert.ToInt32(comando.Parameters["@vi_RecordCount"].Value);
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
            Pagination responsepaginacion = new Pagination()
            {
                TotalItems = recordCount,
                TotalPages = (int)Math.Ceiling((double)recordCount / objeto.ItemsPerPage)                
            };

            clientResponse.DataJson = JsonConvert.SerializeObject(lstAnuncio).ToString();
            clientResponse.paginacion = JsonConvert.SerializeObject(responsepaginacion).ToString();
            return clientResponse;
        }
        #endregion
    }
}
