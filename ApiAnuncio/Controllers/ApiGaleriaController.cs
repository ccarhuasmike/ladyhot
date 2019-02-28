using BusinessEntity;
using BusinessLogic;
using Communities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Drawing;
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
                Tbl_parameter_det entidad_rutas_fisica_fichas = new Tbl_parameter_det() { skey_det = "SKEY_RUTASFISICAS_FICHAS", paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_RUTAS_FICHAS" } };
                ClientResponse respons_rutas_fisica_fichas = new ParameterLogic().GetParameter_skey_x_det_Id(entidad_rutas_fisica_fichas);
                Tbl_parameter_det rutas_fisica_image = Newtonsoft.Json.JsonConvert.DeserializeObject<Tbl_parameter_det>(respons_rutas_fisica_fichas.DataJson);

                string tempPath = rutas_fisica_image.tx_descripcion + objeto.id_anuncio;

                byte[] imageBytes = System.Convert.FromBase64String(objeto.tx_ruta_file);
                if (!Directory.Exists(tempPath))
                    Directory.CreateDirectory(tempPath);
                string file_ruta = tempPath + @"/" + objeto.tx_filename + "." + objeto.tx_extension_archivo;
                File.WriteAllBytes(file_ruta, imageBytes);

                string _b64 = Convert.ToBase64String(File.ReadAllBytes(file_ruta));

                var base64Img = new Base64Image
                {
                    FileContents = File.ReadAllBytes(file_ruta),
                    ContentType = "image/png"
                };
                string base64EncodedImg = base64Img.ToString();
                Tbl_galeria_anuncio entidad = new Tbl_galeria_anuncio()
                {
                    Base64ContentFicha = base64EncodedImg,
                    Base64ContentFichaCort = base64EncodedImg,
                    id_anuncio = objeto.id_anuncio,
                    tx_filename = objeto.tx_filename + "." + objeto.tx_extension_archivo,
                    size_file = 0

                };
                clientResponse = new GaleriaLogic().Insert_GaleriaObject(entidad);
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
                clientResponse = new GaleriaLogic().Eliminar_galeria_x_id(entidad);
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