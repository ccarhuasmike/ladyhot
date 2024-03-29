﻿using System.Web;
using System.Web.Optimization;

namespace WebAnuncio
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/js/jquery-1.10.2.min.js",
                        "~/js/bootstrap.min.js"
                        ));

            bundles.Add(new ScriptBundle("~/bundles/jqueryhome").Include(                    
                      "~/js/jquery.fancybox.js",
                      "~/js/jquery.fancybox-buttons.js",
                      "~/js/jquery.fancybox-thumbs.js",
                      "~/js/bootstrap-touch-carousel.js",
                      "~/js/bootstrap-select.js",
                      "~/js/bootstrap-datepicker.js",
                      "~/js/video.js",
                      "~/js/jquery.equalheights.min.js",
                      "~/js/jRespond.min.js",
                      "~/js/jquery-scrolltofixed-min.js",
                      "~/js/jquery.nouislider.all.min.js",
                      "~/js/jquery.mousewheel.js",
                      "~/js/mwheelIntent.js",
                      "~/js/flickity.pkgd.min.js",
                      "~/js/flickity-imagesloaded.js",
                      "~/js/jquery.mousewheel.js",
                      "~/js/jquery.jscrollpane.min.js",
                      "~/js/main.js",
                      "~/js/typeahead.bundle.min.js",
                      "~/js/mscroller.js",
                      "~/js/jquery.sha1.js",
                      "~/js/megamenu.js",
                      "~/js/home.js"
                      ));

            bundles.Add(new ScriptBundle("~/bundles/flickity").Include(
                    "~/js/flickity.pkgd.min.js",
                    "~/js/fullscreen.js"
                    ));          

            bundles.Add(new StyleBundle("~/Content/css").Include(                      
                      "~/css/bootstrap.min.css",
                      "~/css/flaticon.css",
                      "~/css/flaticon-redes.css",
                      "~/css/social/flaticon.css",
                      "~/css/slide/flaticon.css",
                      "~/css/fancybox/jquery.fancybox-buttons.css",
                      "~/css/fancybox/jquery.fancybox-thumbs.css",
                      "~/css/fancybox/jquery.fancybox.css",
                      "~/css/touch-carousel/bootstrap-touch-carousel.css",
                      "~/css/bootstrap-select.min.css",
                      "~/css/jquery.nouislider.min.css",
                      "~/css/datepicker.css",
                      "~/css/datepicker3.css",
                      "~/css/jquery.jscrollpane.css",
                      "~/css/video/video-js.min.css",
                      "~/css/video/video-js-default-skin.css",
                      "~/css/slidebars/slidebars.css",                      
                      "~/css/estilos.css",
                      "~/css/estilos-responsive.css",
                      "~/css/print.css",
                      "~/Content/site.css"
                      ));
            bundles.Add(new StyleBundle("~/Content/flickitydetails").Include(
                     "~/css/flickity/flickity.css",
                     "~/css/fullscreen/fullscreen.css",
                     "~/css/flickity/flickitydetails.css"
                     ));
            bundles.Add(new StyleBundle("~/Content/flickityhome").Include(
                     "~/css/flickity/flickity.css",
                     "~/css/fullscreen/fullscreen.css",
                     "~/css/flickity/flickityhome.css"
                     ));
        }
    }
}
