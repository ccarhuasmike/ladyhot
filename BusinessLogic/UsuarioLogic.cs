using AccessData;
using AccessData.Conexion;
using BusinessEntity;
using Communities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BusinessLogic
{
    public class UsuarioLogic
    {
        private UsuarioData _usuarioData;           
       
        public UsuarioLogic()
        {
            _usuarioData = new UsuarioData();
        }
        public ClientResponse Listar_usuario() {
            return _usuarioData.Listar_usuario();
        }

        public ClientResponse InsertUsuario(Tbl_usuario objeto)
        {
            return _usuarioData.InsertUsuario(objeto);
        }

        public ClientResponse GetUsuario_X_password(Tbl_usuario entidad)
        {
            string usuarioDesencryptado = Utilidades.Desencryptar(entidad.tx_email);
            string passwordDesencryptado = Utilidades.Desencryptar(entidad.tx_pass);
            entidad.tx_email = usuarioDesencryptado;
            entidad.tx_pass = passwordDesencryptado;
            return _usuarioData.GetUsuario_X_password(entidad);
        }
    }
}
