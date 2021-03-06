﻿using BusinessEntity;
using BusinessLogic;
using Communities;
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
    public class DetailsController : Controller
    {
        // GET: Details
        public ActionResult Index()
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                //clientResponse = new AnuncioLogic().GetAnucion_Details_anucion_x_tokens(cod_anuncio_encryptado);
                //clientResponse = new AnuncioLogic().ListarAnuncio_top_10();
                string cod_anuncio_encryptado = Request.QueryString["id"];// "EA957C43-D29D-4B3A-9C2B-97CA9DCD8054";
                object initData = new
                {
                    DetailsAnuncion = new AnuncioLogic().GetAnucion_Details_anucion_x_tokens(cod_anuncio_encryptado),
                    ListCargarInicial = new AnuncioLogic().ListarAnuncio_top_10()
                };
                clientResponse.Status = "OK";
                clientResponse.Data = initData;

            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            //return Json(clientResponse, JsonRequestBehavior.AllowGet);

            ViewBag.Message = clientResponse;
            return View();
        }
        public JsonResult GetDetailsAnuncio(string cod_anuncio_encryptado)
        {
            //ClientResponse clientResponse = new ClientResponse();
            //try
            //{
            //    //clientResponse = new AnuncioLogic().GetAnucion_Details_anucion_x_tokens(cod_anuncio_encryptado);
            //    //clientResponse = new AnuncioLogic().ListarAnuncio_top_10();

            //    object initData = new
            //    {
            //        DetailsAnuncion = new AnuncioLogic().GetAnucion_Details_anucion_x_tokens(cod_anuncio_encryptado),
            //        ListCargarInicial = new AnuncioLogic().ListarAnuncio_top_10()
            //    };
            //    clientResponse.Status = "OK";
            //    clientResponse.Data = initData;

            //}
            //catch (Exception ex)
            //{
            //    clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            //}
            //return Json(clientResponse, JsonRequestBehavior.AllowGet);
            return null;
        }
    }
}