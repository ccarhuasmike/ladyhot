using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ApiAnuncio
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Configuración y servicios de API web
            // Configuración y servicios de API web
            //EnableCorsAttribute defaultPolicyProvider = new EnableCorsAttribute(ConfigurationManager.AppSettings["host"], "*", "GET,POST")
            //{
            //    SupportsCredentials = true
            //};
            var defaultPolicyProvider = new EnableCorsAttribute(
            origins: "*",
            headers: "*",
            methods: "*");
            

            config.EnableCors(defaultPolicyProvider);
            // Rutas de API web
            // Rutas de API web
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
