using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
// Added usings
using System.Web.Script.Services;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using ImgApp.Objects;

namespace ImageApplication.WebServices
{
    /// <summary>
    /// Summary description for DatabaseServices
    /// </summary>
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [ScriptService]
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class DatabaseServices : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public string LoadTest(string inFilePath)
        {
            return "the LoadTest() fired";
        }

        [WebMethod]
        public int LoadToDB(FileObj inObj)
        {
            int _outID = 0;
            byte[] imgData = null;

            FileInfo fInfo = new FileInfo(inObj.Path);
            long numBytes = fInfo.Length;
            FileStream fStream = new FileStream(inObj.Path, FileMode.Open, FileAccess.Read);
            BinaryReader bRdr = new BinaryReader(fStream);
            imgData = bRdr.ReadBytes((int)numBytes);

            string conStr = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ToString();
            using (SqlConnection con = new SqlConnection(conStr))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = con;
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.CommandText = "proc_ImageLoad";
                        cmd.Parameters.AddWithValue("@Name", inObj.File);
                        cmd.Parameters.AddWithValue("@DirPath", inObj.Path);
                        cmd.Parameters.AddWithValue("@PicImage", imgData);
                        cmd.Parameters.AddWithValue("@OutID", _outID).Direction = System.Data.ParameterDirection.Output;

                        try
                        {
                            if (cmd.ExecuteNonQuery() == 0)
                            {

                                return _outID;
                            }                        
                        }
                        catch (Exception e)
                        {
                            return 0;
                        }
                    }
                }
                catch (Exception e)
                {
                    return 0;
                }
            }

            return 0;
        }


        [WebMethod]
        public string ExtractFromDB(string inImgID)
        {
            string _outStr = string.Empty;
            byte[] _outFile = null;
            string conStr = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ToString();

            using (SqlConnection con = new SqlConnection(conStr))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = con;
                        cmd.CommandText = "SELECT PicImage FROM [dbo].[ZImageData] WHERE ID = " + inImgID;
                        cmd.CommandType = CommandType.Text;

                        byte[] rtnImg = (byte[])cmd.ExecuteScalar();

                        _outFile = rtnImg;

                    }
                }
                catch (Exception e)
                {
                    return null;
                }

            }

            string _converted = Convert.ToBase64String(_outFile);
            return _converted;
        }


    }
}
