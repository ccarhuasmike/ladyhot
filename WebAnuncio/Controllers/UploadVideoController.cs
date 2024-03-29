﻿using BusinessEntity;
using BusinessLogic;
using Communities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebAnuncio.Controllers
{
    public class UploadVideoController : Controller
    {
        // GET: UploadVideo
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetVideoXIdAnuncio(int id_anuncio)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                Tbl_galeria_anuncio entidad = new Tbl_galeria_anuncio() { id_anuncio = id_anuncio };
                IEnumerable<Tbl_galeria_anuncio> lst = new GaleriaLogic().Get_Video_x_id_anuncio(entidad);
                clientResponse.DataJson = JsonConvert.SerializeObject(lst).ToString();
                clientResponse.Status = "Ok";
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

        public JsonResult EliminarVideo(int id_galeria)
        {
            ClientResponse clientResponse;
            try
            {
                Tbl_galeria_anuncio entidad = new Tbl_galeria_anuncio() { id = id_galeria };
                clientResponse = new GaleriaLogic().Get_galeria_x_id(entidad);
                Tbl_galeria_anuncio resultObjeto = Newtonsoft.Json.JsonConvert.DeserializeObject<Tbl_galeria_anuncio>(clientResponse.DataJson);
                FileInfo fi = new FileInfo(resultObjeto.tx_ruta_file);
                fi.Delete();
                clientResponse = new GaleriaLogic().Eliminar_video_x_id(resultObjeto);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }

            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AgregarVideo(int id_anuncio)
        {
            ClientResponse clientResponse;
            try
            {

                Tbl_parameter_det entidad_rutas_fisica_fichas = new Tbl_parameter_det() { skey_det = "SKEY_RUTAS_FISICAS_VIDEOS", paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_RUTAS_FICHAS" } };
                ClientResponse respons_rutas_fisica_fichas = new ParameterLogic().GetParameter_skey_x_det_Id(entidad_rutas_fisica_fichas);
                Tbl_parameter_det rutas_fisica_image = Newtonsoft.Json.JsonConvert.DeserializeObject<Tbl_parameter_det>(respons_rutas_fisica_fichas.DataJson);

                Tbl_parameter_det entidad_rutas_virtuales_fichas = new Tbl_parameter_det() { skey_det = "SKEY_RUTAS_VIRTUALES_VIDEOS", paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_RUTAS_FICHAS" } };
                ClientResponse respons_rutas_virtuales_fichas = new ParameterLogic().GetParameter_skey_x_det_Id(entidad_rutas_virtuales_fichas);
                Tbl_parameter_det rutas_rutas_virtuales_image = Newtonsoft.Json.JsonConvert.DeserializeObject<Tbl_parameter_det>(respons_rutas_virtuales_fichas.DataJson);


                HttpFileCollectionBase filesCollection = Request.Files;
                //string hora = DateTime.Now.ToString("yyyyMMddhhmmss");
                List<Tbl_galeria_anuncio> list = new List<Tbl_galeria_anuncio>();
                Tbl_galeria_anuncio entidad = null;
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

                    string file_ruta = tempPath + @"/" + filename;
                    string file_ruta_virtual = tempPathVirtual + @"/" + filename;
                    file.SaveAs(file_ruta);


                    entidad = new Tbl_galeria_anuncio();
                    entidad.tx_ruta_file = id_anuncio + "/" + filename;
                    entidad.id_tipo_archivo = id_tipo_archivo;
                    entidad.tx_ruta_file_cort = id_anuncio + "/" + filename;
                    entidad.txt_ruta_virtuales = file_ruta_virtual;
                    entidad.size_file = file.ContentLength;
                    entidad.tx_filename = filename;
                    list.Add(entidad);
                }

                clientResponse = new GaleriaLogic().Insert_Videos(list, id_anuncio);

            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }

            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

    }
}
