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
        public List<string> Organizations { get; set; }

        // constructor
        public ReferringOrganizations()
        {
            Organizations = new List<string>();
        }

        public ReferringOrganizations(DataTable inTbl)
            : this()
        {
            foreach (DataRow r in inTbl.Rows)
                Organizations.Add(r["Organization"].ToString());
        }

    }
}