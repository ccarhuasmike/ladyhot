using AccessData;
using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class UbigeoLogic
    {
        private UbigeoData _ubigeoData;

        public UbigeoLogic()
        {
            _ubigeoData = new UbigeoData();
        }
        public IEnumerable<Tbl_departamento> GetDepatamento()
        {
            return _ubigeoData.GetDepatamento();
        }
        public IEnumerable<Tbl_provincia> GetProvincia(Tbl_departamento request)
        {
            return _ubigeoData.GetProvincia(request);
        }
        public IEnumerable<Tbl_distrito> GetDistrito(Tbl_provincia request)
        {
            return _ubigeoData.GetDistrito(request);
        }
    }
}
