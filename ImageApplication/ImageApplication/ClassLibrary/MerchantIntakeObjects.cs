using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
// Added usings
using System.Data;
namespace MerchantIntake.ClassLibrary
{
    public class MerchantIntakeObjects
    {
    }

    public class ReferringOrganizations
    {
        public List<string> IDs { get; set; }
        public List<string> Organizations { get; set; }

        // constructor
        public ReferringOrganizations()
        {
            IDs = new List<string>();
            Organizations = new List<string>();
        }

        public ReferringOrganizations(DataTable inTbl)
            : this()
        {
            foreach (DataRow r in inTbl.Rows)
            {
                IDs.Add(r["ID"].ToString());
                Organizations.Add(r["Organization"].ToString());
            }
        }

    }

    public class Campaigns
    {
        public List<string> CampaignIDs { get; set; }

        public Campaigns()
        {
            CampaignIDs = new List<string>();
        }

        public Campaigns(DataTable inTbl)
            : this()
        {
            foreach (DataRow r in inTbl.Rows)
            {
                CampaignIDs.Add(r["ReferrerCampaignID"].ToString());
            }
        }
    }

    public class ReferringOrganizationCampaignCurrentData
    {
        public string ReferrerID { get; set; }
        public string ReferrerCampaignID { get; set; }
        public string Organization { get; set; }
        public string PrimaryContactEmail { get; set; }
        public string PrimaryContactName { get; set; }
        public string APPSalesAgentName { get; set; }
        public string APPSalesAgentEmail { get; set; }
        public string APPccEmailList { get; set; }
        public string APPbccEmailList { get; set; }
        public string Hierarchy { get; set; }
        public string CampaignDescription { get; set; }
        public string Verbiage { get; set; }
        public string CampaignImageDirPath { get; set; }
        public string CampaignImage { get; set; }

        public ReferringOrganizationCampaignCurrentData()
        {
        }

        public ReferringOrganizationCampaignCurrentData(DataTable inTbl)
        {
            this.ReferrerID = inTbl.Rows[0]["ID"].ToString();
            this.ReferrerCampaignID = inTbl.Rows[0]["ReferrerCampaignID"].ToString();
            this.Organization = inTbl.Rows[0]["Organization"].ToString();
            this.PrimaryContactEmail = inTbl.Rows[0]["PrimaryContactEmail"].ToString();
            this.PrimaryContactName = inTbl.Rows[0]["PrimaryContactName"].ToString();
            this.APPSalesAgentName = inTbl.Rows[0]["APPSalesAgentName"].ToString();
            this.APPSalesAgentEmail = inTbl.Rows[0]["APPSalesAgentEmail"].ToString();
            this.APPccEmailList = inTbl.Rows[0]["APPccEmailList"].ToString();
            this.APPbccEmailList = inTbl.Rows[0]["APPbccEmailList"].ToString();
            this.Hierarchy = inTbl.Rows[0]["Hierarchy"].ToString();
            this.CampaignDescription = inTbl.Rows[0]["CampaignDescription"].ToString();
            this.Verbiage = inTbl.Rows[0]["Verbiage"].ToString();
            this.CampaignImageDirPath = inTbl.Rows[0]["CampaignImageDirPath"].ToString();
            this.CampaignImage = inTbl.Rows[0]["CampaignImage"].ToString();

        }



    }

}