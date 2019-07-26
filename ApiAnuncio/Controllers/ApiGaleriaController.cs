using BusinessEntity;
using BusinessLogic;
using Communities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;


namespace ApiAnuncio.Controllers
{
    [RoutePrefix("api/galeria")]
    public class ApiGaleriaController : ApiController
    {
        [Route("InsertGaleria"), HttpPost]
        public ClientResponse InsertGaleria(Tbl_galeria_anuncio objeto)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                Tbl_galeria_anuncio entidad = new Tbl_galeria_anuncio();
                Tbl_parameter_det entidad_rutas_fisica_fichas = new Tbl_parameter_det() { skey_det = "SKEY_RUTASFISICAS_FICHAS", paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_RUTAS_FICHAS" } };
                ClientResponse respons_rutas_fisica_fichas = new ParameterLogic().GetParameter_skey_x_det_Id(entidad_rutas_fisica_fichas);
                Tbl_parameter_det rutas_fisica_image = Newtonsoft.Json.JsonConvert.DeserializeObject<Tbl_parameter_det>(respons_rutas_fisica_fichas.DataJson);


                Tbl_parameter_det entidad_rutas_virtuales_fichas = new Tbl_parameter_det() { skey_det = "SKEY_RUTASVIRTUALES_FICHAS", paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_RUTAS_FICHAS" } };
                ClientResponse respons_rutas_virtuales_fichas = new ParameterLogic().GetParameter_skey_x_det_Id(entidad_rutas_virtuales_fichas);
                Tbl_parameter_det rutas_rutas_virtuales_image = Newtonsoft.Json.JsonConvert.DeserializeObject<Tbl_parameter_det>(respons_rutas_virtuales_fichas.DataJson);


                Tbl_parameter_det entidad_rutas_fisica_fichas_cortada = new Tbl_parameter_det() { skey_det = "SKEY_RUTAS_FISICAS_FICHAS_CORTADAS", paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_RUTAS_FICHAS" } };
                ClientResponse respons_rutas_fisica_fichas_cortada = new ParameterLogic().GetParameter_skey_x_det_Id(entidad_rutas_fisica_fichas_cortada);
                Tbl_parameter_det rutas_fisica_image_cortada = Newtonsoft.Json.JsonConvert.DeserializeObject<Tbl_parameter_det>(respons_rutas_fisica_fichas_cortada.DataJson);

                Tbl_parameter_det entidad_rutas_virtuales_fichas_cortada = new Tbl_parameter_det() { skey_det = "SKEY_RUTAS_VIRTUALES_FICHAS_CORTADAS", paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_RUTAS_FICHAS" } };
                ClientResponse respons_rutas_virtuales_fichas_cortada = new ParameterLogic().GetParameter_skey_x_det_Id(entidad_rutas_virtuales_fichas_cortada);
                Tbl_parameter_det rutas_rutas_virtuales_image_cortada = Newtonsoft.Json.JsonConvert.DeserializeObject<Tbl_parameter_det>(respons_rutas_virtuales_fichas_cortada.DataJson);

                string[] split_extension = objeto.tx_filename.Split(new Char[] { '.' });
                Tbl_parameter_det entidad_det = new Tbl_parameter_det()
                {
                    paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_TIPO_ARCHIVO" }
                };
                IEnumerable<Tbl_parameter_det> lstExtension = new ParameterLogic().GetParameter_skey(entidad_det);
                int id_tipo_archivo = 0;
                foreach (var element in lstExtension)
                {
                    if (element.tx_descripcion.Equals(objeto.tx_extension_archivo))
                    {
                        id_tipo_archivo = element.val_valor;
                        break;
                    }
                }

                string tempPath = rutas_fisica_image.tx_descripcion + objeto.id_anuncio;
                string tempPathVirtual = rutas_rutas_virtuales_image.tx_descripcion + objeto.id_anuncio;

                byte[] imageBytes = System.Convert.FromBase64String(objeto.tx_ruta_file);
                if (!Directory.Exists(tempPath))
                    Directory.CreateDirectory(tempPath);
                
                string file_ruta = tempPath + @"/" + objeto.tx_filename + "." + objeto.tx_extension_archivo;                
                string file_ruta_virtual = tempPathVirtual + @"/" + objeto.tx_filename + "." + objeto.tx_extension_archivo;
                File.WriteAllBytes(file_ruta, imageBytes);

                /*BajaResolucion a Imagen*/
                string file_ruta_virtual_cortada = "";
                string file_ruta_cortada = "";
                //using (Bitmap bmp1 = new Bitmap(@"C:\ImagenResolucion\foto.jpg"))
                using (Bitmap bmp1 = new Bitmap(file_ruta))
                {
                    ImageCodecInfo jpgEncoder = Utilidades.GetEncoder(ImageFormat.Jpeg);
                    // Create an Encoder object based on the GUID  
                    // for the Quality parameter category.  
                    System.Drawing.Imaging.Encoder myEncoder =
                    System.Drawing.Imaging.Encoder.Quality;

                    // Create an EncoderParameters object.  
                    // An EncoderParameters object has an array of EncoderParameter  
                    // objects. In this case, there is only one  
                    // EncoderParameter object in the array.  
                    EncoderParameters myEncoderParameters = new EncoderParameters(1);

                    EncoderParameter myEncoderParameter = new EncoderParameter(myEncoder, 15L);
                    myEncoderParameters.Param[0] = myEncoderParameter;

                    string tempPath_cortada = rutas_fisica_image_cortada.tx_descripcion + objeto.id_anuncio;
                    string tempPathVirtual_cortada = rutas_rutas_virtuales_image_cortada.tx_descripcion + objeto.id_anuncio;

                    if (!Directory.Exists(tempPath_cortada))
                        Directory.CreateDirectory(tempPath_cortada);

                    file_ruta_cortada = tempPath_cortada + @"/" + objeto.tx_filename + "." + objeto.tx_extension_archivo;
                    file_ruta_virtual_cortada = tempPathVirtual_cortada + @"/" + objeto.tx_filename + "." + objeto.tx_extension_archivo;
                    bmp1.Save(file_ruta_cortada, jpgEncoder, myEncoderParameters);
                }                
                objeto.tx_ruta_file = objeto.id_anuncio + "/" + objeto.tx_filename + "." + objeto.tx_extension_archivo;
                objeto.id_tipo_archivo = id_tipo_archivo;
                objeto.tx_ruta_file_cort = objeto.id_anuncio + "/" + objeto.tx_filename + "." + objeto.tx_extension_archivo;
                objeto.txt_ruta_virtuales = file_ruta_virtual;
                objeto.txt_ruta_virtuales_cortada = file_ruta_virtual_cortada;
                //entidad.size_file = file.ContentLength;
                objeto.tx_filename = objeto.tx_filename + "." + objeto.tx_extension_archivo;
                clientResponse = new GaleriaLogic().Insert_GaleriaObject(objeto);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return clientResponse;
        }

        [Route("GetGeleriaXIdAnuncio"), HttpPost]
        public ClientResponse GetGeleriaXIdAnuncio(Tbl_galeria_anuncio entidad)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {   
                IEnumerable<Tbl_galeria_anuncio> lst = new GaleriaLogic().Get_galeria_x_id_anuncio(entidad);
                clientResponse.DataJson = JsonConvert.SerializeObject(lst).ToString();  
                clientResponse.Status = "OK";
            }
            catch (Exception ex)
            {                
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return clientResponse;
        }
        [Route("EliminarFoto"), HttpPost]
        public ClientResponse EliminarFoto(Tbl_galeria_anuncio entidad)
        {
            ClientResponse clientResponse;
            try
            {
                //Tbl_galeria_anuncio entidad = new Tbl_galeria_anuncio() { id = entidad.id };
                clientResponse = new GaleriaLogic().Get_galeria_x_id(entidad);
                Tbl_galeria_anuncio resultObjeto = Newtonsoft.Json.JsonConvert.DeserializeObject<Tbl_galeria_anuncio>(clientResponse.DataJson);
                FileInfo fi = new FileInfo(resultObjeto.tx_ruta_file);
                fi.Delete();
                clientResponse = new GaleriaLogic().Eliminar_galeria_x_id(resultObjeto);
                //clientResponse = new GaleriaLogic().Eliminar_galeria_x_id(entidad);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }

            return clientResponse;
        }

    }
}

public class Base64Image
{
    public static Base64Image Parse(string base64Content)
    {
        if (string.IsNullOrEmpty(base64Content))
        {
            throw new ArgumentNullException(nameof(base64Content));
        }

        int indexOfSemiColon = base64Content.IndexOf(";", StringComparison.OrdinalIgnoreCase);

        string dataLabel = base64Content.Substring(0, indexOfSemiColon);

        string contentType = dataLabel.Split(':').Last();

        var startIndex = base64Content.IndexOf("base64,", StringComparison.OrdinalIgnoreCase) + 7;

        var fileContents = base64Content.Substring(startIndex);

        var bytes = Convert.FromBase64String(fileContents);

        return new Base64Image
        {
            ContentType = contentType,
            FileContents = bytes
        };
    }

    public string ContentType { get; set; }

    public byte[] FileContents { get; set; }

    public override string ToString()
    {
        return $"data:{ContentType};base64,{Convert.ToBase64String(FileContents)}";
    }
}