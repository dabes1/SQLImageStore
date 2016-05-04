using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImgApp.Objects
{
    public class MIFileObj
    {
        public string ReferrerID { get; set; }
        public string Organization { get; set; }
        public string PrimaryContactEmail { get; set; }
        public string PrimaryContactName { get; set; }

        public string ReferrerCampaignID { get; set; }
        public string ImgFile { get; set; }
        public string ImgPath { get; set; }
        public string CampaignDescription { get; set; }
        public string Verbiage { get; set; }

        public string APPSalesAgentName { get; set; }
        public string APPSalesAgentEmail { get; set; }


        public string Hierarchy { get; set; }
        public string APPccEmailList { get; set; }
        public string APPbccEmailList { get; set; }


        public int oReferrerID { get; set; }
        public int oCampaignID { get; set; }

    }
}