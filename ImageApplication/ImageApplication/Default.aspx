<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ImageApplication.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main</title>
</head>
<body>

<%--
This tester application requires the following SQL DB structures:

CREATE TABLE [dbo].[ZImageData] (
	ID			INT IDENTITY(1,1) NOT NULL,
	Name		NVARCHAR(100),
	DirPath		NVARCHAR(300),
	PicImage	IMAGE,
	PicVBin		VARBINARY(MAX)
)

-- CREATE THE PROC TO INSERT THE IMAGE
USE [appsosdev]
GO
/****** Object:  StoredProcedure [dbo].[proc_ImageLoad]    Script Date: 03/30/2016 11:55:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_ImageLoad](
 @Name		NVARCHAR(100),
 @DirPath	NVARCHAR(300),
 @PicImage	IMAGE,
 @PicVBin	VARBINARY(MAX) = NULL,
 @OutID		INT = 0 OUTPUT)
	
AS

INSERT INTO [dbo].[ZImageData]
(Name,
 DirPath,
 PicImage,
 PicVBin)
VALUES
(@Name,
 @DirPath,
 @PicImage,
 @PicVBin)

SET @OutID = @@IDENTITY

RETURN


-- CREATE THE PROC TO EXTRACT THE IMAGE
--USE [appsosdev]
GO
/****** Object:  StoredProcedure [dbo].[proc_ImageGet]    Script Date: 03/30/2016 11:55:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_ImageGet](
	@ID		INT = 0
)
AS

SELECT * FROM [dbo].[ZImageData] WHERE ID = @ID;

RETURN

            --%>

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

                <div>Organization:
                    <input type="text" id="miOrganization" style="width: 300px;" />
                </div>
                <div>Verbiage:
                    <input type="text" id="miVerbiage" style="height:100px; width: 300px;" />
                </div>
                <div>Email:
                    <input type="text" id="miEmail" style="width: 300px;" />
                </div>
                <div>Org Contact:
                    <input type="text" id="miContact" style="width: 300px;" />
                </div>
                <div>Campaign Desc:
                    <input type="text" id="miCampaignDesc" style="height:100px; width:300px" />
                </div>

                <h3>Please select an Image to load</h3>
                <div>
                    <input type="file" id="miInput1" onchange="loadMIfilename()"/>         
                </div>
                <input type="text" id="miTxt1" style="width:300px;" />
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
