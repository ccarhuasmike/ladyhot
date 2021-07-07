using System;
using System.Collections.Generic;
using System.Linq;
namespace BusinessEntity
{
    public class Bean_mail
    {
        public string nombreContactante { get; set; } = "";
        public string asunto { get; set; } = "";
        public List<string> para { get; set; }= new List<string>();
        public string body { get; set; } = "";
        public string de { get; set; } = "";
        public string clave { get; set; } = "";
        public string smtpServer { get; set; } = "";
        public int puerto { get; set; } = 0;
        public string correoEnvia { get; set; } = "";
        public List<string> telefonoContacto { get; set; } = new List<string>();
    }
}
