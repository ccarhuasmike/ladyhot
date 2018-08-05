using System.Web;
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
                        "~/js/bootstrap.min.js",
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
                        "~/js/jquery.jscrollpane.min.js",
                        "~/js/main.js",
                        "~/js/typeahead.bundle.min.js",
                        "~/js/mscroller.js",
                        "~/js/jquery.sha1.js",
                        "~/js/megamenu.js",
                        "~/js/home.js",
                        "~/js/modulo/add-anuncio/add-anuncio.js"
                        ));

            //bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
            //            "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.

            //bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
            //            "~/Scripts/modernizr-*"));

            //bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
            //          "~/Scripts/bootstrap.js",
            //          "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      //"~/Content/bootstrap.css",
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
                      "~/css/flickity/flickity.css",
                      "~/css/estilos.css",
                      "~/css/estilos-responsive.css",
                      "~/css/print.css",
                      "~/Content/site.css"
                      ));
        }
    }
}
