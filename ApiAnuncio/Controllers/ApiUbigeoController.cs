using BusinessEntity;
using BusinessLogic;
using Communities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiAnuncio.Controllers
{
    [RoutePrefix("api/ubigeo")]
    public class ApiUbigeoController : ApiController
    {

        [Route("sel_departamento"), HttpGet]
        public IEnumerable<Tbl_departamento> sel_departamento()
        {
            IEnumerable<Tbl_departamento> clientResponse = null;
            try
            {
                clientResponse = new UbigeoLogic().GetDepatamento();
            }
            catch (Exception ex)
            {
            }
            return clientResponse;
        }
        [Route("sel_provincia"), HttpPost]
        public IEnumerable<Tbl_provincia> sel_provincia(Tbl_departamento request)
        {
            IEnumerable<Tbl_provincia> clientResponse = null;
            try
            {
                clientResponse = new UbigeoLogic().GetProvincia(request);
            }
            catch (Exception ex)
            {
            }
            return clientResponse;
        }
        [Route("sel_distrito"), HttpPost]
        public IEnumerable<Tbl_distrito> sel_distrito(Tbl_provincia request)
        {
            IEnumerable<Tbl_distrito> clientResponse = null;
            try
            {
                clientResponse = new UbigeoLogic().GetDistrito(request);
            }
            catch (Exception ex)
            {
            }
            return clientResponse;
        }
    }
}