﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace RestaurantMenu_API
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            //Remueve el resultado en xml y solo se visualiza en JSON
            var json = config.Formatters.JsonFormatter;
            json.SerializerSettings.PreserveReferencesHandling = Newtonsoft.Json.PreserveReferencesHandling.None;
            config.Formatters.Remove(config.Formatters.XmlFormatter);

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
