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
    public class PersonaData
    {
        #region Variables
        private static IEnumerable<Persona> lstAnuncio;
        private static Persona entidad;
        //private static SqlConnection conexion;
        //private static SqlCommand comando;
        //private static SqlDataReader reader;
        private static ClientResponse clientResponse;
        #endregion

        #region Constructor
        public PersonaData()
        {
            entidad = null;
            //var conexion = null;
            //var comando = null;
            //var reader = null;
            clientResponse = new ClientResponse();
            clientResponse.Status = "OK";
        }
        #endregion

        public IEnumerable<Persona> ListarPersona(DataTableParameter paginacion ,Persona persona)
        {
            try
            {
                using (var conexion = new SqlConnection(ConnectionBaseSql.ConexionBDSQL().ToString()))
                {
                    using (var comando = new SqlCommand("USP_LISTA_PERSNONA_DATAABLE", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@Apellido", SqlDbType.VarChar, 255).Value = persona.Nombre;
                        comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 255).Value = persona.Apellido;
                        comando.Parameters.Add("@Start", SqlDbType.Int).Value = paginacion.start;
                        comando.Parameters.Add("@Length", SqlDbType.Int).Value = paginacion.length;
                        conexion.Open();
                        using (var reader = comando.ExecuteReader())
                        {
                            lstAnuncio = reader.ReadRows<Persona>();
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
            return lstAnuncio;
        }
    }
}
