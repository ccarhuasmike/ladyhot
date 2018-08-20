using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Communities
{
    public  class Utilidades
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
        public static ImageCodecInfo GetEncoder(ImageFormat format)
        {
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageDecoders();
            foreach (ImageCodecInfo codec in codecs)
            {
                if (codec.FormatID == format.Guid)
                {
                    return codec;
                }
            }
            return null;
        }
    }
}
