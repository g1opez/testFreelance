using System;
using System.Collections.Generic;
using System.Web.Services;

namespace TestFreelance.Page
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(hdnLblBarRed.Value) && !string.IsNullOrEmpty(hdnLblBarBlue.Value) && !string.IsNullOrEmpty(hdnLblBarGreen.Value))
            {
                SetColorBar(hdnLblBarRed.Value, hdnLblBarBlue.Value, hdnLblBarGreen.Value);
            }
        }

        public void ShowResult(object sender, EventArgs e)
        {
            ShowMessage(hdnLblBarRed.Value, hdnLblBarBlue.Value, hdnLblBarGreen.Value);
        }

        private void SetColorBar(string red, string blue, string green)
        {
            // Percentage 
            sectorRed.Style.Add("width", red + "%");
            sectorBlue.Style.Add("width", blue + "%");
            sectorGreen.Style.Add("width", green + "%");
            // Label Control
            lblBarRed.InnerText = red + "%";
            lblBarBlue.InnerText = blue + "%";
            lblBarGreen.InnerText = green + "%";
            // Hidden Control
            hdnLblBarRed.Value = red;
            hdnLblBarBlue.Value = blue;
            hdnLblBarGreen.Value = green;
        }

        public void ShowMessage(string cRed, string cBlue, string cGreen)
        {
            lblMessage.InnerText = "The color's value at the bar is: ";
            lblMessage1.InnerText = "... " + cRed + "%";
            lblMessage2.InnerText = "... " + cBlue + "%";
            lblMessage3.InnerText = "... " + cGreen + "%";

            SetColorBar(cRed, cBlue, cGreen);
        }

        [WebMethod]
        public static Object ShowMessageAjax(string cRed, string cBlue, string cGreen)
        {
            const string mge = "The color's value at the bar is: ";
            var lblMessage1 = "... " + cRed + "%";
            var lblMessage2 = "... " + cBlue + "%";
            var lblMessage3 = "... " + cGreen + "%";
            var obj = new Dictionary<string, string>
                          {
                              {"lblMessage", mge}, 
                              {"lblMessage1", lblMessage1}, 
                              {"lblMessage2", lblMessage2}, 
                              {"lblMessage3", lblMessage3}
                          };

            return obj;
        }

        [WebMethod]
        public static Object SetLanguage(string lang)
        {
            switch (lang)
            {
                case "ES":
                    return new Dictionary<string, string>
                    {                        
                        {"button1", "Actualizar pagina (cliente)"},
                        {"button2", "Obtener valores del Server (POST)"},
                        {"button3", "Obtener valores del Server (AJAX)"},
                        {"lblFooter", "Realizado por"},
                        {"langEs","ES"},
                        {"langUs","IN"},
                        {"colorRed","Rojo"},
                        {"colorBlue","Azul"},
                        {"colorGreen","Verde"}
                    };

                case "US":
                    return new Dictionary<string, string>
                    {                        
                        {"button1", "Update Page (client)"},
                        {"button2", "Get values on server side postback"},
                        {"button3", "Get values on server side"},
                        {"lblFooter", "Realized by"},
                        {"langEs","SP"},
                        {"langUs","US"},
                        {"colorRed","Red"},
                        {"colorBlue","Blue"},
                        {"colorGreen","Green"}
                    };
            }
            return null;
        }
    }

}