using BusinessEntity;
using BusinessLogic;
using Communities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace WebAnuncio.Controllers
{
    public class updGaleriaController : Controller
    {
        // GET: updGaleria
        public ActionResult Index()
        {
            return View();
        }
        public async Task<JsonResult> getGeleriaXIdAnuncio(int id_anuncio)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                tbl_galeria_anuncio entidad = new tbl_galeria_anuncio() { id_anuncio = id_anuncio };
                IEnumerable<tbl_galeria_anuncio> lst =new GaleriaLogic().get_galeria_x_id_anuncio(entidad);
                clientResponse.DataJson = JsonConvert.SerializeObject(lst).ToString();
                clientResponse.Status = "Ok";
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

        public async Task<JsonResult> EliminarFoto(int id_galeria)
        {
            ClientResponse clientResponse;
            try
            {
                tbl_galeria_anuncio entidad = new tbl_galeria_anuncio() { id = id_galeria };
                clientResponse = new GaleriaLogic().get_galeria_x_id(entidad);
                tbl_galeria_anuncio resultObjeto = Newtonsoft.Json.JsonConvert.DeserializeObject<tbl_galeria_anuncio>(clientResponse.DataJson);
                FileInfo fi = new FileInfo(resultObjeto.tx_ruta_file);
                fi.Delete();
                clientResponse = new GaleriaLogic().eliminar_galeria_x_id(resultObjeto);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }

            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

        public async Task<JsonResult> AgregarFotos(int id_anuncio)
        {
            ClientResponse clientResponse;
            try
            {
                tbl_parameter_det entidad_rutas_fisica_fichas = new tbl_parameter_det() { skey_det = "SKEY_RUTASFISICAS_FICHAS", paramter_cab = new tbl_parameter_cab() { skey_cab = "SKEY_RUTAS_FICHAS" } };
                ClientResponse respons_rutas_fisica_fichas = new ParameterLogic().getParameter_skey_x_det_Id(entidad_rutas_fisica_fichas);
                tbl_parameter_det rutas_fisica_image = Newtonsoft.Json.JsonConvert.DeserializeObject<tbl_parameter_det>(respons_rutas_fisica_fichas.DataJson);

                tbl_parameter_det entidad_rutas_virtuales_fichas = new tbl_parameter_det() { skey_det = "SKEY_RUTASVIRTUALES_FICHAS", paramter_cab = new tbl_parameter_cab() { skey_cab = "SKEY_RUTAS_FICHAS" } };
                ClientResponse respons_rutas_virtuales_fichas = new ParameterLogic().getParameter_skey_x_det_Id(entidad_rutas_virtuales_fichas);
                tbl_parameter_det rutas_rutas_virtuales_image = Newtonsoft.Json.JsonConvert.DeserializeObject<tbl_parameter_det>(respons_rutas_virtuales_fichas.DataJson);


                HttpFileCollectionBase filesCollection = Request.Files;
                //string hora = DateTime.Now.ToString("yyyyMMddhhmmss");
                List<tbl_galeria_anuncio> list = new List<tbl_galeria_anuncio>();
                tbl_galeria_anuncio entidad = null;
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

                    string tempPath = rutas_fisica_image.tx_descripcion + id_anuncio;
                    string tempPathVirtual = rutas_rutas_virtuales_image.tx_descripcion + id_anuncio;
                    if (!Directory.Exists(tempPath))
                        Directory.CreateDirectory(tempPath);

                    string file_ruta = tempPath + @"/" + filename;
                    string file_ruta_virtual = tempPathVirtual + @"/" + filename;
                    file.SaveAs(file_ruta);

                    entidad = new tbl_galeria_anuncio();
                    entidad.tx_ruta_file = file_ruta;
                    entidad.tx_ruta_file_cort = file_ruta;
                    entidad.txt_ruta_virtuales = file_ruta_virtual;
                    entidad.size_file = file.ContentLength;
                    entidad.tx_filename = filename;
                    list.Add(entidad);
                }

                clientResponse = new GaleriaLogic().Insert_Galeria(list, id_anuncio);

            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }

            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

    }
}