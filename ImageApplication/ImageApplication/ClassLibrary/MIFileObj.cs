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
        public string Email { get; set; }
        public string Contact { get; set; }

        public string ReferrerCampaignID { get; set; }
        public string ImgFile { get; set; }
        public string ImgPath { get; set; }
        public string CampaignDescription { get; set; }
        public string Verbiage { get; set; }


        public int oReferrerID { get; set; }
        public int oCampaignID { get; set; }

    }
}