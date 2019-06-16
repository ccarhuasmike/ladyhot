using Communities;
using BusinessEntity;
using System;
using System.Web.Http;
using System.Collections.Generic;
using BusinessLogic;
using System.Linq;

namespace ApiAnuncio.Controllers
{
    [RoutePrefix("api/contactar")]
    public class ApiContactarController : ApiController
    {
        [Route("EnvioEmail"), HttpPost]
        public ClientResponse EnvioEmail(Bean_mail beanMail)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                Tbl_parameter_det entidad_det = null;

                entidad_det = new Tbl_parameter_det()
                {
                    paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_MAIL" }
                };
                IEnumerable<Tbl_parameter_det> lista = new ParameterLogic().GetParameter_skey(entidad_det);

                Tbl_parameter_det user = lista.ToList().Where(x => x.skey_det.Equals("SKEY_MAIL_DET_USER")).FirstOrDefault();
                Tbl_parameter_det clave = lista.Where(x => x.skey_det.Equals("SKEY_MAIL_DET_CLAVE")).FirstOrDefault();
                Tbl_parameter_det smtp = lista.Where(x => x.skey_det.Equals("SKEY_MAIL_DET_SMTP")).FirstOrDefault();
                Tbl_parameter_det puerto = lista.Where(x => x.skey_det.Equals("SKEY_MAIL_DET_PUERTO")).FirstOrDefault();
                beanMail.puerto = int.Parse(puerto.tx_descripcion);
                beanMail.de = user.tx_descripcion;
                beanMail.para = beanMail.para;
                beanMail.clave = clave.tx_descripcion;
                beanMail.smtpServer = smtp.tx_descripcion;
                beanMail.body = beanMail.body;
                beanMail.asunto = beanMail.asunto;
                clientResponse = Mail.EnvioMailSegundo(beanMail);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return clientResponse;
        }
    }
}
