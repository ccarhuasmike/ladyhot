using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Communities
{
    public class Mail
    {
        public static ClientResponse EnvioMailSegundo(Bean_mail entidad)
        {
            ClientResponse clientResponse = new ClientResponse();
            MailMessage correo = new MailMessage();
            SmtpClient smtp = new SmtpClient();

            correo.From = new MailAddress(entidad.de, "Gologolos", System.Text.Encoding.UTF8);
            foreach (var item in entidad.para)
            {
                correo.To.Add(item);
            }   
            correo.SubjectEncoding = System.Text.Encoding.UTF8;
            correo.Subject = entidad.asunto;
            correo.Body = entidad.body;
            correo.BodyEncoding = System.Text.Encoding.UTF8;
            correo.IsBodyHtml = true;
            correo.Priority = MailPriority.High;
            /*foreach (var item in listrutas)
            {
                correo.Attachments.Add(new Attachment(item));
            }*/
            smtp.Credentials = new System.Net.NetworkCredential(entidad.para[0].ToString(), entidad.clave);
            //smtp.Port = Puerto;
            smtp.Host = entidad.smtpServer;
            smtp.EnableSsl = true;           
            smtp.Send(correo);
            clientResponse.Status = "OK";
            return clientResponse;
        }
    }
}
