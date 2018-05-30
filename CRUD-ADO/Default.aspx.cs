using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD_ADO
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            bool isCap = args.Value.All(char.IsUpper);
            if (isCap)  
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

    }
}