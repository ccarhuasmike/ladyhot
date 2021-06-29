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
        private static IEnumerable<Tbl_anuncioDto> lstAnuncioDto;

        private static Tbl_anuncio entidad;
        //private static SqlConnection conexion;
        //private static SqlCommand comando;
        //private static SqlDataReader reader;
        private static ClientResponse clientResponse;
        #endregion

        #region Constructor
        public AnuncioData()
        {
            entidad = null;
            //var conexion = null;
            //var comando = null;
            //var reader = null;
            clientResponse = new ClientResponse();
            clientResponse.Status = "OK";
        }
        #endregion

        #region Metodo
        public ClientResponse ListarAnuncio_top_10()
        {
            try
            {
                using (var  conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var  comando = new SqlCommand("sp_sel_fichas_anuncio_top_10", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        conexion.Open();
                        using (var  reader = comando.ExecuteReader())
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }
            return clientResponse;
        }
        public ClientResponse ListarAnuncioPaginado(TblAnuncioBusqueda anuncioBusqueda)
        {
            try
            {
                using (var  conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var  comando = new SqlCommand("sp_sel_fichas_anuncio_paginado", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@edad_min", SqlDbType.Int).Value = anuncioBusqueda.edad_min;
                        comando.Parameters.Add("@edad_max", SqlDbType.Int).Value = anuncioBusqueda.edad_max;
                        comando.Parameters.Add("@estatura", SqlDbType.Int).Value = anuncioBusqueda.estatura;
                        comando.Parameters.Add("@ojos", SqlDbType.Int).Value = anuncioBusqueda.ojos;
                        comando.Parameters.Add("@pais", SqlDbType.Int).Value = anuncioBusqueda.pais;
                        comando.Parameters.Add("@pelo", SqlDbType.Int).Value = anuncioBusqueda.pelo;
                        comando.Parameters.Add("@peso", SqlDbType.Int).Value = anuncioBusqueda.peso;
                        comando.Parameters.Add("@forma_pago", SqlDbType.VarChar).Value = (object)anuncioBusqueda.forma_pago ?? DBNull.Value;
                        comando.Parameters.Add("@lugar_atencion", SqlDbType.VarChar).Value = (object)anuncioBusqueda.lugar_atencion ?? DBNull.Value;
                        comando.Parameters.Add("@servicio_ofrece", SqlDbType.VarChar).Value = (object)anuncioBusqueda.servicio_ofrece ?? DBNull.Value;
                        comando.Parameters.Add("@nombre_ficha", SqlDbType.VarChar).Value = (object)anuncioBusqueda.nombre_ficha ?? DBNull.Value;
                        comando.Parameters.Add("@Start", SqlDbType.Int).Value = anuncioBusqueda.paginacion.StartPages;
                        comando.Parameters.Add("@Length", SqlDbType.Int).Value = anuncioBusqueda.paginacion.ItemsPerPage;
                        conexion.Open();
                        using (var  reader = comando.ExecuteReader())
                        {
                            lstAnuncioDto = reader.ReadRows<Tbl_anuncioDto>();
                        }
                        clientResponse.DataJson = JsonConvert.SerializeObject(lstAnuncioDto).ToString();
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
        public ClientResponse ListarMisAnuncioPorUsuario(Tbl_anuncio anuncio)
        {
            try
            {
                using (var  conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var  comando = new SqlCommand("sp_sel_fichas_mis_anuncio_por_usuario", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@id_usuario", SqlDbType.Int).Value = anuncio.id_usuario;
                        conexion.Open();
                        using (var  reader = comando.ExecuteReader())
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }
            return clientResponse;
        }
        public ClientResponse MisAnuncio(string usuario_token)
        {
            try
            {
                using (var  conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var  comando = new SqlCommand("sp_sel_tbl_anuncio_x_usuario", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@token_usuario", SqlDbType.VarChar, 255).Value = usuario_token;
                        conexion.Open();
                        using (var  reader = comando.ExecuteReader())
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }
            return clientResponse;
        }
        public ClientResponse DarBajarAnuncio(Tbl_anuncio entidad)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_upd_dar_baja_tbl_anuncio", conexion))
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
            }
            return clientResponse;
        }
        public ClientResponse ActualizarPrimerpaso(Tbl_anuncio objeto)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_up_anuncio_primerpaso", conexion))
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }
            return clientResponse;
        }
        public ClientResponse InsertPrimerpaso(Tbl_anuncio objeto)
        {
            int id = 0;
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_ins_anuncio_primerpaso", conexion))
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
            }
            return clientResponse;
        }
        public ClientResponse UpdateSegundopaso(Tbl_anuncio objeto)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_upd_anuncio_segundopaso", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@int_edad", SqlDbType.Int).Value = objeto.int_edad;
                        comando.Parameters.Add("@int_pais_origen", SqlDbType.Int).Value = objeto.int_pais_origen;
                        ///comando.Parameters.Add("@int_estudios", SqlDbType.Int).Value = objeto.int_estudios;
                        comando.Parameters.Add("@txt_presentacion", SqlDbType.Text).Value = objeto.txt_presentacion;
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = objeto.id;
                        comando.Parameters.Add("@txt_titulo", SqlDbType.VarChar).Value = objeto.txt_titulo;
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }
            return clientResponse;
        }
        public ClientResponse UpdateTercerpaso(Tbl_anuncio objeto)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_upd_anuncio_tercerpaso", conexion))
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }
            return clientResponse;
        }
        public ClientResponse UpdateCuartopaso(Tbl_anuncio objeto)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_upd_anuncio_cuartopaso", conexion))
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }
            return clientResponse;
        }
        public ClientResponse UpdateQuintopaso(Tbl_anuncio objeto)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_upd_anuncio_quintopaso", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@txt_lugar_servicio_distrito", SqlDbType.VarChar, 255).Value = objeto.txt_lugar_servicio_distrito;
                        comando.Parameters.Add("@fl_atencion_24horas", SqlDbType.Int).Value = objeto.fl_atencion_24horas;
                        comando.Parameters.Add("@tx_descripcion_extra_horario", SqlDbType.VarChar, 200).Value = objeto.tx_descripcion_extra_horario == null ? "" : objeto.tx_descripcion_extra_horario;
                        comando.Parameters.Add("@tx_lugar_atencion", SqlDbType.VarChar, 255).Value = objeto.tx_lugar_atencion;
                        comando.Parameters.Add("@tx_servicios_ofrece", SqlDbType.VarChar, 400).Value = objeto.tx_servicios_ofrece;
                        comando.Parameters.Add("@tx_descripcion_extra_servicio", SqlDbType.VarChar, 255).Value = objeto.tx_descripcion_extra_servicio == null ? "" : objeto.tx_descripcion_extra_servicio;
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = objeto.id;
                        comando.Parameters.Add("@int_departamento", SqlDbType.Int).Value = objeto.int_departamento;
                        comando.Parameters.Add("@int_provincia", SqlDbType.Int).Value = objeto.int_provincia;
                        conexion.Open();
                        comando.ExecuteNonQuery();

                        IEnumerable<Tbl_provincia> listProvincia = null;
                        Tbl_anuncio entidad = GetAnucionXId(objeto.id);
                        if (objeto.int_departamento > 0)
                        {
                            listProvincia = new UbigeoData().GetProvincia(new Tbl_departamento() { IdDepa = objeto.int_departamento });
                        }
                        IEnumerable<Tbl_distrito> listDistrito = null;
                        if (objeto.int_provincia > 0)
                        {
                            listDistrito = new UbigeoData().GetDistrito(new Tbl_provincia() { IdProv = objeto.int_provincia });
                        }
                        var ubigeo = new
                        {
                            provincia = listProvincia,
                            distrito= listDistrito
                        };
                        clientResponse.Data = JsonConvert.SerializeObject(entidad).ToString();
                        clientResponse.DataJson = JsonConvert.SerializeObject(ubigeo).ToString();
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
        public ClientResponse UpdateTodopaso(Tbl_anuncio objeto)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_upd_anuncio_todos_paso", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@txt_nombre_ficha", SqlDbType.VarChar, 60).Value = objeto.txt_nombre_ficha == null ? "" : objeto.txt_nombre_ficha;
                        comando.Parameters.Add("@txt_telefono_1", SqlDbType.VarChar, 50).Value = objeto.txt_telefono_1 == null ? "" : objeto.txt_telefono_1;
                        comando.Parameters.Add("@txt_telefono_2", SqlDbType.VarChar, 50).Value = objeto.txt_telefono_2 == null ? "" : objeto.txt_telefono_2;
                        comando.Parameters.Add("@txt_email", SqlDbType.VarChar, 40).Value = objeto.txt_email == null ? "" : objeto.txt_email;
                        comando.Parameters.Add("@txt_web", SqlDbType.VarChar, 500).Value = objeto.txt_web == null ? "" : objeto.txt_web;
                        comando.Parameters.Add("@int_edad", SqlDbType.Int).Value = objeto.int_edad;
                        comando.Parameters.Add("@int_pais_origen", SqlDbType.Int).Value = objeto.int_pais_origen;
                        comando.Parameters.Add("@txt_titulo", SqlDbType.VarChar).Value = objeto.txt_titulo;
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
                        
                        comando.Parameters.Add("@int_departamento", SqlDbType.Int).Value = objeto.int_departamento;
                        comando.Parameters.Add("@int_provincia", SqlDbType.Int).Value = objeto.int_provincia;
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }
            return clientResponse;
        }
        public Tbl_anuncio GetAnucionXId(int id_anucion)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_sel_tbl_anuncio_x_id", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@id", SqlDbType.Int).Value = id_anucion;
                        conexion.Open();
                        using (var reader = comando.ExecuteReader())
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }
            return entidad;
        }
        public Tbl_anuncio GetAnucion_x_tokens(string token_anuncio)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_sel_tbl_anuncio_x_tokens", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@cod_anuncio_encryptado", SqlDbType.VarChar, 500).Value = token_anuncio;
                        conexion.Open();
                        using (var reader = comando.ExecuteReader())
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }
            return entidad;
        }
        public ClientResponse GetAnucion_Details_anucion_x_tokens(string token_anuncio)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_sel_fichas_anuncio_x_tokens", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@cod_anuncio_encryptado", SqlDbType.VarChar, 500).Value = token_anuncio;
                        conexion.Open();
                        using (var reader = comando.ExecuteReader())
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }
            return clientResponse;
        }
        public ClientResponse ListarAnuncioPaginate(Tbl_anuncio tblAnuncio)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_sel_anuncio_paginada", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@PageIndex", SqlDbType.Int).Value = tblAnuncio.beanPaginate.pageIndex;
                        comando.Parameters.Add("@pageSize", SqlDbType.Int).Value = tblAnuncio.beanPaginate.pageSize;
                        conexion.Open();
                        using (var reader = comando.ExecuteReader())
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
            }
            return clientResponse;
        }
        public ClientResponse listarPaginado(Pagination objeto)
        {
            int recordCount = 0;
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_listar_anuncio", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@vi_pagina", SqlDbType.Int).Value = objeto.CurrentPage;
                        comando.Parameters.Add("@vi_registrosporpagina", SqlDbType.Int).Value = objeto.ItemsPerPage;
                        comando.Parameters.Add("@vi_RecordCount", SqlDbType.Int).Direction = ParameterDirection.Output;
                        conexion.Open();
                        using (var reader = comando.ExecuteReader())
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
                //reader.Dispose();
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
        public ClientResponse RegistrarPago(BeanCharge objeto)
        {
            int id = 0;
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_registrar_pago", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@nombre_completo_pagador", SqlDbType.VarChar, 60).Value = objeto.nombreCompleto == null ? "" : objeto.nombreCompleto;
                        comando.Parameters.Add("@descripcion_pago", SqlDbType.VarChar, 300).Value = objeto.descripcionCargo == null ? "" : objeto.descripcionCargo;
                        comando.Parameters.Add("@numero_tarjeta", SqlDbType.VarChar, 20).Value = objeto.numeroTarjeta == null ? "" : objeto.numeroTarjeta;
                        comando.Parameters.Add("@tipo_tarjeta", SqlDbType.VarChar, 30).Value = objeto.tipoTarjeta == null ? "" : objeto.tipoTarjeta;
                        comando.Parameters.Add("@nombre_tarjeta", SqlDbType.VarChar, 50).Value = objeto.nombreTarjeta == null ? "" : objeto.nombreTarjeta;
                        comando.Parameters.Add("@email_pagador", SqlDbType.VarChar, 30).Value = objeto.correo == null ? "" : objeto.correo;
                        //comando.Parameters.Add("@monto_pagado", SqlDbType.Decimal).Value = objeto.montoPagar;
                        comando.Parameters.Add("@moneda", SqlDbType.VarChar, 20).Value = objeto.moneda;
                        comando.Parameters.Add("@id_anuncio", SqlDbType.Int).Value = objeto.idAnuncio;
                        comando.Parameters.Add("@id_producto", SqlDbType.Int).Value = objeto.idProducto;
                        comando.Parameters.Add("@primer_dia_subida", SqlDbType.DateTime).Value = objeto.primerDiaSubida;
                        comando.Parameters.Add("@ultimo_dia_subida", SqlDbType.DateTime).Value = objeto.ultimoDiaSubida;
                        comando.Parameters.Add("@primer_hora_subida", SqlDbType.VarChar).Value = objeto.primerHoraSubida;
                        comando.Parameters.Add("@ultimo_hora_subida", SqlDbType.VarChar).Value = objeto.ultimoHoraSubida;
                        comando.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output;
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        if (comando.Parameters["@id"] != null)
                        {
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
                //conexion.Close();
                //conexion.Dispose();
                //comando.Dispose();
            }
            return clientResponse;
        }
        public ClientResponse ListarCantAnuncioFotoPorPaisRegion()
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("sp_lista_cant_anuncio_foto_pais_region", conexion))
                    {
                        IEnumerable<Tbl_CantAnuncioFotoPorPaisRegion> lstAnuncioFotoPorPaisRegion = new List<Tbl_CantAnuncioFotoPorPaisRegion>();
                        comando.CommandType = CommandType.StoredProcedure;
                        conexion.Open();
                        using (var reader = comando.ExecuteReader())
                        {
                            lstAnuncioFotoPorPaisRegion = reader.ReadRows<Tbl_CantAnuncioFotoPorPaisRegion>();
                        }
                        clientResponse.DataJson = JsonConvert.SerializeObject(lstAnuncioFotoPorPaisRegion).ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                clientResponse.Mensaje = ex.Message;
                clientResponse.Status = "ERROR";
            }
            return clientResponse;
        }
        #endregion
    }
}