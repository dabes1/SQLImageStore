<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ImageApplication.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main</title>
</head>
<body>
    <!-- Test this change -->
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="scriptMgr">
            <Scripts>
                <asp:ScriptReference Path="~/Scripts/Default.js" />
            </Scripts>
            <Services>
                <asp:ServiceReference Path="~/WebServices/DatabaseServices.asmx" /> 
            </Services>
        </asp:ScriptManager>

    <div>   
        <h1>This application was designed as a tester application to load/retrieve image files into a SQL database</h1>

        <div>
            <h3>Please select a file to load</h3>
            <div>
                <input type="file" id="input1" onchange="loadfilename()"/>         
            </div>
            <input type="text" id="txt1" style="width:300px;" />
        </div>
        <div>
            <input type="button" id="btn1" value="Load" onclick="LoadToDB()" /> <%--  LoadTest() --%>
        </div>

        
        <div>
            <h3>Display the loaded image</h3>
            <div>
                <input type="text" id="txtImgID" />
                <input type="button" id="btnBtnDisplay" value="Display" onclick="displayImage()" />
            </div>
            <img id="imgArea" src="" style="height:150px; width:580px;" />
        </div>


        <div>
            <h3>Load the MI Stuff</h3>

            <div>
                <div>Referrer ID (blank indicates new):
                    <input type="text" id="miReferrerID" style="width:50px" />
                </div>

                <div>Organization:
                    <input type="text" id="miOrganization" style="width: 300px;" />
                </div>
                <div>Email:
                    <input type="text" id="miEmail" style="width: 300px;" />
                </div>
                <div>Org Contact:
                    <input type="text" id="miContact" style="width: 300px;" />
                </div>

                <div>&nbsp;</div>
                <hr />

                <div>Campaign ID:
                    <input type="text" id="miCampaignID" style="width:50px" />
                </div>
                <div>Image load
                    <input type="file" id="miInput1" onchange="loadMIfilename()"/>         
                </div>
                <div>ImagePath:
                    <input type="text" id="miTxt1" style="width:300px;" />
                </div>
                <div>Campaign Desc:
                    <input type="text" id="miCampaignDesc" style="height:100px; width:300px" />
                </div>
                <div>Verbiage:
                    <input type="text" id="miVerbiage" style="height:100px; width: 300px;" />
                </div>
            </div>

            <div>
                <div>APPS Sales Agent:
                    <input type="text" id="miSalesAgent" style="width: 300px;" />
                </div>

                <div>APPS Sales Agent Email:
                    <input type="text" id="miSalesAgenEmail" style="width: 300px;" />
                </div>

            </div>


            <div>
                <input type="button" id="btn2" value="MI Load" onclick="LoadToMIDB()" />
            </div>

            <h3>Returned ID's on successful load</h3>
            <div>
                <div>ReferrerID:
                    <input type="text" id="miOutRefID" />
                </div>
                <div>CampaignID:
                    <input type="text" id="miOutCmpID" />
                </div>

            </div>
        </div>
    </div>
    </form>
</body>
</html>

<script src="Scripts/Default.js" type="text/javascript"></script>
