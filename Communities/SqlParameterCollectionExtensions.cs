using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Communities
{
    public static class SqlParameterCollectionExtensions
    {
        public static SqlParameter AddWithValue(this SqlParameterCollection target, string parameterName, object value, object nullValue)
        {
            if (value == null)
            {
                return target.AddWithValue(parameterName, nullValue ?? DBNull.Value);
            }
            return target.AddWithValue(parameterName, value);
        }

        public static SqlParameter AddWithValueAux(string name, SqlDbType type, int size, string value)
        {
            SqlParameter parameter = new SqlParameter(name, type, size);
            parameter.Value = value;
            return parameter;
        }

    }
}
