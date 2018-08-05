using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Communities
{
    public static class AppSettings
    {
        private static readonly string LOGDIRERROR = ConfigurationManager.AppSettings["LOGDIRERROR"];
    }
}
