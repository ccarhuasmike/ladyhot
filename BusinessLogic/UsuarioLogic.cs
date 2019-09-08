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
        public ClientResponse Listar_usuario()
        {
            return _usuarioData.Listar_usuario();
        }

        public Tbl_usuario getUsuarioPorCorreo(Tbl_usuario usuario)
        {
            return _usuarioData.getUsuarioPorCorreo(usuario);
        }
        public ClientResponse InsertUsuario(Tbl_usuario objeto)
        {
            return _usuarioData.InsertUsuario(objeto);
        }
        public ClientResponse UpdatePasswordPorUsuario(Tbl_usuario entidad)
        {
            return _usuarioData.UpdatePasswordPorUsuario(entidad);
        }
        public ClientResponse getUsuarioPorToken(Tbl_usuario entidad)
        {
            return _usuarioData.getUsuarioPorToken(entidad);
        }
        public ClientResponse GetUsuario_X_password(Tbl_usuario entidad)
        {
            //string usuarioDesencryptado = Utilidades.Desencryptar(entidad.tx_email);
            //string passwordDesencryptado = Utilidades.Desencryptar(entidad.tx_pass);
            //string usuarioDesencryptado = "";
            //string passwordDesencryptado = "";
            //entidad.tx_email = usuarioDesencryptado;
            //entidad.tx_pass = passwordDesencryptado;
            return _usuarioData.GetUsuario_X_password(entidad);
        }
    }
}
