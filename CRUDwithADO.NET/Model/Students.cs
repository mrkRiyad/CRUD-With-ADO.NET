using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUDwithADO.NET
{
    public class Students
    {
        public int StudentID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Subject { get; set; }
        public int SessionYear { get; set; }    
    }
}