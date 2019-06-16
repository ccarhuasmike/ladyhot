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

            correo.From = new MailAddress(entidad.de, "LADYHOT", System.Text.Encoding.UTF8);
            foreach (var item in entidad.para)
            {
                correo.To.Add(item);
            }   
            correo.SubjectEncoding = System.Text.Encoding.UTF8;
            correo.Subject = entidad.asunto;
            correo.Body = string.Format("Nombre del Solicitante: {0}<br/>Numero de telefono: {1}<br/>Solicitud: {2}", entidad.nombreContactante, string.Join(",", entidad.telefonoContacto), entidad.body);
            correo.BodyEncoding = System.Text.Encoding.UTF8;
            correo.IsBodyHtml = true;
            correo.Priority = MailPriority.High;
            /*foreach (var item in listrutas)
            {
                correo.Attachments.Add(new Attachment(item));
            }*/
            smtp.Credentials = new System.Net.NetworkCredential(entidad.de, entidad.clave);
            //smtp.Port = Puerto;
            smtp.Host = entidad.smtpServer;
            smtp.EnableSsl = true;


            //ServicePointManager.ServerCertificateValidationCallback =
            //   delegate (object s
            //       , X509Certificate certificate
            //       , X509Chain chai
            //       , SslPolicyErrors sslPolicyErrors)
            //   { return true; };
            smtp.Send(correo);
            clientResponse.Status = "OK";
            return clientResponse;
        }
    }
}
