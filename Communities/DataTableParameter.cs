using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Communities
{
    public class DataTableParameter
    {
        public int draw { get; set; }
        public int length { get; set; }
        public int start { get; set; }
        public List<columm> columns { get; set; }
    }
    public struct columm
    {
        public string data;
        public string name;
        public Boolean searchable;
        public Boolean orderable;
        public searchValue Search;
    }
    public struct searchValue
    {
        public string value;
        public Boolean regex;
    }

}
