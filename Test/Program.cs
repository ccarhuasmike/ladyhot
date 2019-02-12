using BusinessEntity;
using BusinessLogic;
using Communities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    class Program
    {
        static void Main(string[] args)
        {
            ClientResponse clientResponse = new ClientResponse();
            Tbl_parameter_det entidad_det = null;
            try
            {

                entidad_det = new Tbl_parameter_det()
                {
                    paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_MAIL" }
                };
                IEnumerable<Tbl_parameter_det> lista = new ParameterLogic().GetParameter_skey(entidad_det);

                var user = lista.ToList().Where(x => x.skey_det.Equals("SKEY_MAIL_DET_USER")).FirstOrDefault();
                Tbl_parameter_det clave = lista.Where(x => x.skey_det.Equals("SKEY_MAIL_DET_CLAVE")).FirstOrDefault();
                Tbl_parameter_det smtp = lista.Where(x => x.skey_det.Equals("SKEY_MAIL_DET_SMTP")).FirstOrDefault();
                Tbl_parameter_det puerto = lista.Where(x => x.skey_det.Equals("SKEY_MAIL_DET_PUERTO")).FirstOrDefault();
                Bean_mail beanMail = new Bean_mail();
                beanMail.puerto = int.Parse(puerto.tx_valor);
                beanMail.de = user.tx_valor;
                beanMail.para.Add("ccarhuas.dante@gmail.com");
                beanMail.clave = clave.tx_valor;
                beanMail.smtpServer = smtp.tx_valor;             
                beanMail.body = "holadante";
                beanMail.asunto = "Mensajoe demo";
                Mail.EnvioMailSegundo(beanMail);
            }
            catch (Exception ex)
            {

                throw;
            }

        }
    }
}
