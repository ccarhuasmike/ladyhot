using AccessData;
using BusinessEntity;
using Communities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class PersonaLogic
    {
        private PersonaData _PersonaData;

        public PersonaLogic()
        {
            _PersonaData = new PersonaData();
        }
        public IEnumerable<Persona> ListarPersona(DataTableParameter paginacion, Persona persona)
        {
            return _PersonaData.ListarPersona(paginacion, persona);
        }
    }
}
