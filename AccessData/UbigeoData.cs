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
    public class UbigeoData
    {
        #region Variables
        private static IEnumerable<Tbl_departamento> lstDepartamento =  null;
        private static IEnumerable<Tbl_provincia> lstProvincia = null;
        private static IEnumerable<Tbl_distrito> lstDistrito = null;
        private static Tbl_parameter_det entidad = null;
        //private static SqlConnection conexion;
        //private static SqlCommand comando;
        //private static SqlDataReader reader;
        private static ClientResponse clientResponse;
        #endregion

        #region Constructor
        public UbigeoData()
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
        public IEnumerable<Tbl_departamento> GetDepatamento()
        {
            try
            {
                using (var  conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var  comando = new SqlCommand("sp_lista_departamento", conexion))
                    {   
                        conexion.Open();
                        using (var  reader = comando.ExecuteReader())
                        {
                            lstDepartamento = reader.ReadRows<Tbl_departamento>();
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
            return lstDepartamento;
        }
        public IEnumerable<Tbl_provincia> GetProvincia(Tbl_departamento request)
        {
            try
            {
                using (var  conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var  comando = new SqlCommand("sp_lista_provincia", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@IdDepa", SqlDbType.VarChar, 45).Value = request.IdDepa;
                        conexion.Open();
                        using (var  reader = comando.ExecuteReader())
                        {
                            lstProvincia = reader.ReadRows<Tbl_provincia>();
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
            return lstProvincia;
        }
        public IEnumerable<Tbl_distrito> GetDistrito(Tbl_provincia request)
        {
            try
            {
                using (var  conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var  comando = new SqlCommand("sp_lista_distrito", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@IdProv", SqlDbType.VarChar, 45).Value = request.IdProv;
                        conexion.Open();
                        using (var  reader = comando.ExecuteReader())
                        {
                            lstDistrito = reader.ReadRows<Tbl_distrito>();
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
            return lstDistrito;
        }
        #endregion
    }
}
