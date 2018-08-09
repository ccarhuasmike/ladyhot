using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Communities
{
    public class Communities
    {
        public static ClientResponse ObtenerMensajeErrorWeb(Exception ex)
        {
            ClientResponse objReponse = new ClientResponse();
            try
            {
                objReponse.Mensaje = ex.Message;
                objReponse.Data = ex.Source;
                objReponse.ViewResult = ex.StackTrace;
                objReponse.Errores = "Error";
            }
            catch (Exception)
            {

                objReponse = null;
            }

            return objReponse;
        }
    }
}
