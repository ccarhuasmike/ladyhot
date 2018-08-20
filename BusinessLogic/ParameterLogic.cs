using AccessData;
using BusinessEntity;
using Communities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class ParameterLogic
    {
        private ParameterData _parameterData;

        public ParameterLogic()
        {
            _parameterData = new ParameterData();
        }
        public ClientResponse GetCargarControles_Add_Anuncio()
        {
            ClientResponse clientResponse = new ClientResponse();
            Tbl_carga_controles_add entidad = new Tbl_carga_controles_add();
            Tbl_parameter_det entidad_det = null;
            try
            {
                
               
                /*carga edad*/
                entidad_det = new Tbl_parameter_det()
                {
                    paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_EDADES" }
                };
                entidad.edad = _parameterData.GetParameter_skey(entidad_det);

                /*carga color cabello*/
                entidad_det = new Tbl_parameter_det()
                {
                    paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_COLOR_CABELLO" }
                };
                entidad.color_cabello = _parameterData.GetParameter_skey(entidad_det);

                /*carga color ojos*/
                entidad_det = new Tbl_parameter_det()
                {
                    paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_COLOR_OJOS" }
                };
                entidad.color_ojos = _parameterData.GetParameter_skey(entidad_det);

                /*carga distrito*/
                entidad_det = new Tbl_parameter_det()
                {
                    paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_DISTRITO" }
                };
                entidad.distritro = _parameterData.GetParameter_skey(entidad_det);

                /*carga estatura*/
                entidad_det = new Tbl_parameter_det()
                {
                    paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_ESTATURA" }
                };
                entidad.estatura = _parameterData.GetParameter_skey(entidad_det);

                /*carga estudios*/
                entidad_det = new Tbl_parameter_det()
                {
                    paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_ESTUDIOS" }
                };
                entidad.estudios = _parameterData.GetParameter_skey(entidad_det);

                /*carga formapago*/
                entidad_det = new Tbl_parameter_det()
                {
                    paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_FORMA_PAGO" }
                };
                entidad.formapago = _parameterData.GetParameter_skey(entidad_det);

                /*carga lugaratencion*/
                entidad_det = new Tbl_parameter_det()
                {
                    paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_LUGAR_ATENCION" }
                };
                entidad.lugaratencion = _parameterData.GetParameter_skey(entidad_det);

                /*carga servicio ofrece*/
                entidad_det = new Tbl_parameter_det()
                {
                    paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_SERVICIO_OFRECE" }
                };
                entidad.servicio_ofrece = _parameterData.GetParameter_skey(entidad_det);

                /*carga servicio pais*/
                entidad_det = new Tbl_parameter_det()
                {
                    paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_PAISES" }
                };
                entidad.pais = _parameterData.GetParameter_skey(entidad_det);

                /*carga servicio peso*/
                entidad_det = new Tbl_parameter_det()
                {
                    paramter_cab = new Tbl_parameter_cab() { skey_cab = "SKEY_PESO" }
                };
                entidad.peso = _parameterData.GetParameter_skey(entidad_det);
                clientResponse.Status = "OK";
            }
            catch (Exception ex )
            {

                clientResponse.Mensaje = ex.Message;
                clientResponse.Status = "ERROR";
            }
            

            clientResponse.DataJson = JsonConvert.SerializeObject(entidad).ToString();
            return clientResponse;
        }

        public IEnumerable<Tbl_parameter_det> GetParameter_skey(Tbl_parameter_det det)
        {
            return _parameterData.GetParameter_skey(det);
        }
        public ClientResponse GetParameter_skey_x_det_Id(Tbl_parameter_det det)
        {
            return _parameterData.GetParameter_skey_x_det_Id(det);
        }
    }
}
