﻿using AccessData;
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
        public ClientResponse listar_usuario() {
            return _usuarioData.listar_usuario();
        }
    }
}
