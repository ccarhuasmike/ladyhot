using BusinessEntity;
using BusinessLogic;
using Communities;
using Glimpse.AspNet.Tab;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Hosting;
using System.Web.Http;

namespace ApiAnuncio.Controllers
{
    [RoutePrefix("api/seguridad")]
    public class ApiSeguridadController : ApiController
    {
        [Route("EnvioEmailGenerarContrasnia"), HttpPost]
        public ClientResponse EnvioEmailGenerarContrasnia(Bean_mail beanMail)
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

                //string url = Server.MapPath(@"\Templates\TemplateEmailAfiliacion.html");
                var url = System.Web.Hosting.HostingEnvironment.MapPath("/template/templatecorreo.html");
                string mensaje = "";                
                mensaje = Utilidades.LeerTemplateHTML(url);
                //mensaje = mensaje.Replace("[Nombre]", txtapepaterno.Text + " " + txtapematerno.Text + "," + txtnombres.Text);
                //mensaje = mensaje.Replace("[usuario]", txtCorreoElectronico.Text);
                //mensaje = mensaje.Replace("[clave]", txtcontraseña.Text);
                //mensaje = mensaje.Replace("[userid]", userid);

                mensaje = HttpUtility.HtmlDecode(mensaje);
                beanMail.puerto = int.Parse(puerto.tx_valor);
                beanMail.de = user.tx_valor;
                beanMail.para = beanMail.para;
                beanMail.clave = clave.tx_valor;
                beanMail.smtpServer = smtp.tx_valor;
                beanMail.body = mensaje;
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
