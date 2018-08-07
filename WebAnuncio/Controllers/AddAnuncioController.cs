﻿using BusinessEntity;
using BusinessLogic;
using Communities;
using System;
using System.Collections.Generic;
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
        public async Task<JsonResult> primeropaso(tbl_anuncio oregistro)
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

        public async Task<JsonResult> segundopaso(tbl_anuncio oregistro)
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

        public async Task<JsonResult> tercerpaso(tbl_anuncio oregistro)
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
     
        public async Task<JsonResult> Cuartopaso(int id)
        {
            try
            {   
                tbl_parameter_det entidad_rutas_fisica_fichas = new tbl_parameter_det() { skey_det = "SKEY_RUTASFISICAS_FICHAS", paramter_cab = new tbl_parameter_cab() { skey_cab = "SKEY_RUTAS_FICHAS" } };
                ClientResponse respons_rutas_fisica_fichas = new ParameterLogic().getParameter_skey_x_det_Id(entidad_rutas_fisica_fichas);
                tbl_parameter_det rutas_fisica_image = Newtonsoft.Json.JsonConvert.DeserializeObject<tbl_parameter_det>(respons_rutas_fisica_fichas.DataJson);
                
                tbl_parameter_det entidad_rutas_virtuales_fichas = new tbl_parameter_det() { skey_det = "SKEY_RUTASVIRTUALES_FICHAS", paramter_cab = new tbl_parameter_cab() { skey_cab = "SKEY_RUTAS_FICHAS" } };
                ClientResponse respons_rutas_virtuales_fichas = new ParameterLogic().getParameter_skey_x_det_Id(entidad_rutas_virtuales_fichas);
                tbl_parameter_det rutas_rutas_virtuales_image = Newtonsoft.Json.JsonConvert.DeserializeObject<tbl_parameter_det>(respons_rutas_virtuales_fichas.DataJson);


                HttpFileCollectionBase filesCollection = Request.Files;
                string hora = DateTime.Now.ToString("yyyyMMddhhmmss");
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

                    string tempPath = rutas_fisica_image.tx_descripcion + hora;
                    string tempPathVirtual = rutas_rutas_virtuales_image.tx_descripcion + hora;
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

                ClientResponse clientResponse = new ClientResponse();
                try
                {
                    clientResponse = new AnuncioLogic().Insert_Galeria(list, id);
                }
                catch (Exception ex)
                {
                    clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
                }

            }
            catch (Exception)
            {
               
                return Json("Upload failed");
            }

            return Json("File uploaded successfully");
        }

    }
}