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
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace WebAnuncio.Controllers
{
    public class AddAnuncioController : Controller
    {
        // GET: AddAnuncio
        public ActionResult Index()
        {
            return View();
        }        
        public JsonResult GetAnucionXId(int id)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {   
                Tbl_galeria_anuncio entidad = new Tbl_galeria_anuncio() { id_anuncio = id };                
                object initData = new
                {
                    DetailleAnuncion = new AnuncioLogic().GetAnucionXId(id),
                    ListCargarInicial = new GaleriaLogic().Get_galeria_x_id_anuncio(entidad)
                };
                clientResponse.Status = "OK";
                clientResponse.Data = initData;                
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Primeropaso(Tbl_anuncio oregistro)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                clientResponse = new AnuncioLogic().InsertPrimerpaso(oregistro);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ActualizarPrimerpaso(Tbl_anuncio oregistro)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                clientResponse = new AnuncioLogic().ActualizarPrimerpaso(oregistro);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Segundopaso(Tbl_anuncio oregistro)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                clientResponse = new AnuncioLogic().UpdateSegundopaso(oregistro);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Tercerpaso(Tbl_anuncio oregistro)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                clientResponse = new AnuncioLogic().UpdateTercerpaso(oregistro);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

        public JsonResult EliminarFoto(int id_galeria)
        {
            ClientResponse clientResponse;
            try
            {
                Tbl_galeria_anuncio entidad = new Tbl_galeria_anuncio() { id = id_galeria };
                clientResponse = new GaleriaLogic().Get_galeria_x_id(entidad);
                Tbl_galeria_anuncio resultObjeto = Newtonsoft.Json.JsonConvert.DeserializeObject<Tbl_galeria_anuncio>(clientResponse.DataJson);
                FileInfo fi = new FileInfo(resultObjeto.tx_ruta_file);
                fi.Delete();
                clientResponse = new GaleriaLogic().Eliminar_galeria_x_id(resultObjeto);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }

            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AgregarFotos(int id)
        {
            ClientResponse clientResponse;
            try
            {
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

                HttpFileCollectionBase filesCollection = Request.Files;
                //string hora = DateTime.Now.ToString("yyyyMMddhhmmss");
                List<Tbl_galeria_anuncio> list = new List<Tbl_galeria_anuncio>();
                Tbl_galeria_anuncio entidad ;
                for (int i = 0; i < filesCollection.Count; i++)
                {
                    HttpPostedFileBase file = filesCollection[i];
                    string filename;
                    // Checking for Internet Explorer  
                    if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                    {
                        string[] testfiles = file.FileName.Split(new char[] { '\\' });
                        filename = testfiles[testfiles.Length - 1];
                    }
                    else
                    {
                        filename = file.FileName;
                    }          

                    string[] split_extension = filename.Split(new Char[] { '.' });
                    Tbl_parameter_det entidad_det = new Tbl_parameter_det()
                    {
                        paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_TIPO_ARCHIVO" }
                    };
                    IEnumerable<Tbl_parameter_det> lstExtension = new ParameterLogic().GetParameter_skey(entidad_det);
                    int id_tipo_archivo = 0;
                    foreach (var element in lstExtension)
                    {
                        if (element.tx_descripcion.Equals(split_extension[1].ToLower()))
                        {
                            id_tipo_archivo = element.val_valor;
                            break;
                        }
                    }

                    string tempPath = rutas_fisica_image.tx_descripcion + id;
                    string tempPathVirtual = rutas_rutas_virtuales_image.tx_descripcion + id;

                    if (!Directory.Exists(tempPath))
                        Directory.CreateDirectory(tempPath);

                    string file_ruta = tempPath + @"/" + filename;
                    string file_ruta_virtual = tempPathVirtual + @"/" + filename;
                    file.SaveAs(file_ruta);


                    /*BajaResolucion a Imagen*/
                    string file_ruta_virtual_cortada = "";
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

                        string tempPath_cortada = rutas_fisica_image_cortada.tx_descripcion + id;
                        string tempPathVirtual_cortada = rutas_rutas_virtuales_image_cortada.tx_descripcion + id;

                        if (!Directory.Exists(tempPath_cortada))
                            Directory.CreateDirectory(tempPath_cortada);

                        string file_ruta_cortada = tempPath_cortada + @"/" + filename;
                        file_ruta_virtual_cortada = tempPathVirtual_cortada + @"/" + filename;                        
                        bmp1.Save(file_ruta_cortada, jpgEncoder, myEncoderParameters);
                    }


                    entidad = new Tbl_galeria_anuncio();
                    entidad.tx_ruta_file = id + "/" + filename;
                    entidad.tx_ruta_file_cort = id + "/" + filename;
                    entidad.txt_ruta_virtuales = file_ruta_virtual;
                    entidad.txt_ruta_virtuales_cortada = file_ruta_virtual_cortada;
                    entidad.id_tipo_archivo = id_tipo_archivo;
                    entidad.size_file = file.ContentLength;
                    entidad.tx_filename = filename;
                    list.Add(entidad);
                }

                clientResponse = new GaleriaLogic().Insert_Galeria(list, id);

            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }

            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

    }
}