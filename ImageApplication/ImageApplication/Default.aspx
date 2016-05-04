<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ImageApplication.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main</title>
</head>
<body> <%-- onload="loadIt()"  onload="DocumentLoads.LoadReferrringOrganizationsTo_selOrg(selOrg)" --%>
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

        <hr />
        <hr />
        <hr />

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

                <div>Campaign ID (DO NOT ENTER 0 AND DO NOT LEAVE BLANK):
                    <input type="text" id="miCampaignID" style="width:50px" value="1" />
                    
                </div>
                <div>Image load
                    <input type="file" id="miInput1" onchange="loadMIfilename()"/>         
                </div>
                <div>ImagePath:
                    <input type="text" id="miTxt1" style="width:300px;" />
                </div>
                <div>Campaign Desc:
                    <input type="text" id="miCampaignDesc" style="height:25px; width:1457px" />
                </div>
                <div>Verbiage:
                    <input type="text" id="miVerbiage" style="height:25px; width: 1500px;" />
                </div>
                <div>APPS Sales Agent:
                    <input type="text" id="miSalesAgent" style="width: 300px;" />
                </div>
                <div>APPS Sales Agent Email:
                    <input type="text" id="miSalesAgenEmail" style="width: 300px;" />
                </div>
                <div>
                    APPS cc email list
                    <input type="text" id="miCCEmailList" style="width: 300px;" />
                </div>
                <div>
                    APPS bcc email list
                    <input type="text" id="miBCCEmailList" style="width: 300px;" />
                </div>
                <div>
                    Hierarchy Parent Organization ID (Only enter the ID of the parent organization)
                    <input type="text" id="miHierarchy" style="width: 300px;" />
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


        <div>&nbsp;</div>
        <div>&nbsp;</div>

        <hr />
        <hr />
        <hr />

        <div>&nbsp;</div>
        <div>&nbsp;</div>

        <div>
            <h3>Update the MI Stuff</h3>
            <input type="button" value="Display the Update Controls" onclick="UpdMIData.LoadReferrringOrganizationsTo_selOrg(divMIUpdControls)" />
            <div id="divMIUpdControls" style="display:none;">

                <div style="margin-bottom:50px;">
                    Organization
                    <select id="selOrg" onchange="UpdMIData.updSelectedReferringOrganizationNameSelected(this);">
                        <option>Select</option>                    
                    </select>
                    Referrer ID
                    <select id="selRefID" onchange="UpdMIData.updSelectedReferringOrganizationIdSelected(this);">
                        <option>Select</option>
                    </select>
                    Campaign ID
                    <select id="selCmpID" onchange="UpdMIData.updSelectedReferringOrganizationCampaignSelected(this);">
                        <option>Select</option>
                    </select>
                    <input type="button" id="btnLoad" style="height:25px;" value="Load Current Data" onclick="UpdMIData.loadCurrentData();" disabled="disabled" />
                    Inquiry ID
                    <input type="text" id="txtUpdInqID" style="height:25px; width:50px;" />
                </div>
                <div>&nbsp;</div>

                <div id="divUpdateArea">
                    <div><strong>Organization:</strong>
                        <div id="lblCurOrg">
                            Current Organization                
                            <input type="text" id="miCurOrganization" style="width: 300px;"/>
                        </div>
                        <div id="lblUpdOrg">
                            Updated Organization                
                            <input type="text" id="miUpdOrganization" style="width: 300px;" />
                        </div>
                    </div>
                    <div>&nbsp;</div>
                    <div><strong>Email:</strong>
                        <div id="lblCurEmail">
                            Current Email
                            <input type="text" id="miCurPrimaryContactEmail" style="width: 300px;" />
                        </div>
                        <div id="lblUpdEmail">
                            Updated Email
                            <input type="text" id="miUpdPrimaryContactEmail" style="width: 300px;" />
                        </div>
                    </div>
                    <div>&nbsp;</div>
                    <div><strong>Org Contact:</strong>
                        <div id="lblCurContact">
                            Current Organization Contact
                            <input type="text" id="miCurPrimaryContactName" style="width: 300px;" />
                        </div>
                        <div id="lblUpdContact">
                            Updated Organization Contact
                            <input type="text" id="miUpdPrimaryContactName" style="width: 300px;" />
                        </div>
                    </div>
                    <div>&nbsp;</div>
                    <div><strong>Image load</strong>
                        <input type="file" id="miUpdInput1" onchange="UpdMIData.loadMIUPDfilename()"/>         
                    </div>
                    <div>ImagePath:
                        <input type="text" id="miUpdTxt1" style="width:300px;" />
                    </div>
                    <div>&nbsp;</div>
                    <div><strong>Campaign Desc:</strong>
                        <div>
                            Current Campaign Desc
                            <input type="text" id="miCurCampaignDesc" style="height:25px; width:1457px" />
                        </div>
                        <div>
                            Updated Campaign Desc
                            <input type="text" id="miUpdCampaignDesc" style="height:25px; width:1457px" />
                        </div>
                    </div>
                    <div>&nbsp;</div>
                    <div><strong>Verbiage:</strong>
                        <div>
                            Current Verbiage
                            <input type="text" id="miCurVerbiage" style="height:25px; width: 1500px;" />
                        </div>
                        <div>
                            Updated Verbiage
                            <input type="text" id="miUpdVerbiage" style="height:25px; width: 1500px;" />
                        </div>
                    </div>
                    <div>&nbsp;</div>
                    <div><strong>APPS Sales Agent:</strong>
                        <div>
                            Current Sales Agent
                            <input type="text" id="miCurSalesAgent" style="width: 300px;" />
                        </div>
                        <div>
                            Updated Sales Agent
                            <input type="text" id="miUpdSalesAgent" style="width: 300px;" />
                        </div>
                    </div>
                    <div>&nbsp;</div>
                    <div><strong>APPS Sales Agent Email:</strong>
                        <div>
                            Current Sales Agent Email
                            <input type="text" id="miCurSalesAgenEmail" style="width: 300px;" />
                        </div>
                        <div>
                            Updated Sales Agent Email
                            <input type="text" id="miUpdSalesAgenEmail" style="width: 300px;" />
                        </div>
                    </div>
                    <div>&nbsp;</div>
                    <div><strong>APP cc Email List:</strong>
                        <div>
                            Current cc email list
                            <input type="text" id="miCurCCEmailList" style="width: 300px;" />
                        </div>
                        <div>
                            Updated cc email list
                            <input type="text" id="miUpdCCEmailList" style="width: 300px;" />
                        </div>
                    </div>
                    <div>&nbsp;</div>
                    <div><strong>APP bcc Email List:</strong>
                        <div>
                            Current bcc email list
                            <input type="text" id="miCurBCCEmailList" style="width: 300px;" />
                        </div>
                        <div>
                            Updated bcc email list
                            <input type="text" id="miUpdBCCEmailList" style="width: 300px;" />
                        </div>
                    </div>
                    <div>&nbsp;</div>
                    <div><strong>Hierarchy:</strong>(Hierarchy is defined at the Referring Organization Level, NOT BY CAMPAIGN LEVEL)
                        <div>
                            Current Parent Organization ID
                            <input type="text" id="miCurHierarchy" style="width: 300px;" />
                        </div>
                        <div>
                            Updated Parent Organization ID (only enter the ID of the parent organization)
                            <input type="text" id="miUpdHierarchy" style="width: 300px;" />
                        </div>
                    </div>
                </div>

                <input type="button" id="btnUpd" style="height:25px; width:100px" value="Update Values" onclick="UpdMIData.loadUpdatesToMIDB();" />
            </div>



        </div>

    </div>
    </form>
</body>
</html>

<script src="Scripts/Default.js" type="text/javascript"></script>
