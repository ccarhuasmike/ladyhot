﻿using BusinessEntity;
using BusinessLogic;
using Communities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace WebAnuncio.Controllers
{
    public class UpdAnuncioController : Controller
    {   
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult GetAnuncio_x_tokens(string token_anuncio)
        {   
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                Tbl_anuncio list = new AnuncioLogic().GetAnucion_x_tokens(token_anuncio);
                ClientResponse clientResponse_cargaInicial = new ParameterLogic().GetCargarControles_Add_Anuncio();
                object initData = new
                {
                    DetailleAnuncion = list,
                    ListCargarInicial = clientResponse_cargaInicial
                };
                clientResponse.Status = "OK";
                clientResponse.Data = initData;
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            //  return Json(new { Result = "Ocurrio un Error", Status = "ERROR" }, JsonRequestBehavior.AllowGet);
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

        public  JsonResult Todospasos(Tbl_anuncio oregistro)
        {
            ClientResponse clientResponse = new ClientResponse();
            try
            {
                clientResponse = new AnuncioLogic().UpdateTodopaso(oregistro);
            }
            catch (Exception ex)
            {
                clientResponse = Utilidades.ObtenerMensajeErrorWeb(ex);
            }
            return Json(clientResponse, JsonRequestBehavior.AllowGet);
        }

    }
}