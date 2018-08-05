using Communities;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Microsoft.Extensions.Options;
using System.Configuration;

namespace AccessData.Conexion
{
    public static class ConnectionBaseSql
    {
        public static string ConexionBDSQL()
        {
            
            var strCadena = ConfigurationManager.ConnectionStrings["ConeccionSql"].ConnectionString.ToString();
            return strCadena;
        }
    }
}
