using BusinessEntity;
using BusinessLogic;
using Communities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PaginationDatatables
{
    public partial class dataTables : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string GetDTDataSerializedList(String ClientParameters)
        {
            DataTableParameter dtp = JsonConvert.DeserializeObject<DataTableParameter>(ClientParameters);
            Persona persona = new Persona() {
                Apellido = "",
                Nombre =""
            };
            IEnumerable<Persona> list = new PersonaLogic().ListarPersona(dtp, persona);
            int CantidadRegistro = list.Count() == 0 ? 0 : list.First().TotalRegistros;            
            var Init = new
            {
                recordsFiltered = CantidadRegistro,
                data = list,
                recordsTotal = CantidadRegistro
            };
            return JsonConvert.SerializeObject(Init);
        }
    }
}