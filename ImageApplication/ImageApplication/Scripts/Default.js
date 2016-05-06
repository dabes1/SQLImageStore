
function loadIt() {
    alert("LoadIt Fired");
}

var loadfilename = function () {
    var eleFile = document.getElementById('input1');

    var selectedPath = eleFile.value;
    var selectedFile = eleFile.files[0];

    document.getElementById('txt1').value = selectedPath;

}

    var LoadToDB = function () {
        var eleFile = document.getElementById('input1');

        var selectedPath = eleFile.value;
        var selectedFile = eleFile.files[0].name;

        var fileObj = new Object;
        fileObj.Path = selectedPath;
        fileObj.File = selectedFile;

        ImageApplication.WebServices.DatabaseServices.LoadToDB(fileObj, LoadDBCallbackSuccess);

    };

    function LoadDBCallbackSuccess(result) {

        alert("File was loaded");

    }


    var displayImage = function () {
        var imgID = document.getElementById("txtImgID").value;

        ImageApplication.WebServices.DatabaseServices.ExtractFromDB(imgID, ExtractFromDBCallbackSuccess);
    };

    function ExtractFromDBCallbackSuccess(result) {
        var pic = new Image(150, 580);
        pic.src = result;

        var imgArea = document.getElementById("imgArea");
        imgArea.src = "data:image/png;base64," + result;
        // other examples
        //imgArea.src = "data:image/jpg;base64,"
        //imgArea.src = "data:image/gif;base64,"

    }




    var loadMIfilename = function () {
        //var eleFile = document.getElementById('miInput1');

        //var selectedPath = eleFile.value;
        //var selectedFile = eleFile.files[0];

        document.getElementById('miTxt1').value = document.getElementById('miInput1').value;

    }


    var LoadToMIDB = function () {
        var fileObj = new Object;

        fileObj.ReferrerID = 0; // default to new
        if (document.getElementById('miReferrerID').value != "" && document.getElementById('miReferrerID').value != undefined)
            fileObj.ReferrerID = document.getElementById('miReferrerID').value;

        fileObj.Organization = document.getElementById('miOrganization').value;
        fileObj.PrimaryContactEmail = document.getElementById('miEmail').value;
        fileObj.PrimaryContactName = document.getElementById('miContact').value;

        fileObj.ReferrerCampaignID = 0;
        if (document.getElementById('miCampaignID').value != "" && document.getElementById('miCampaignID').value != undefined)
            fileObj.ReferrerCampaignID = document.getElementById('miCampaignID').value;

        fileObj.ImgFile = document.getElementById('miInput1').files[0].name;
        fileObj.ImgPath = document.getElementById('miTxt1').value;
        fileObj.CampaignDescription = document.getElementById('miCampaignDesc').value;
        fileObj.Verbiage = document.getElementById('miVerbiage').value;

        fileObj.APPSalesAgentName = document.getElementById('miSalesAgent').value;
        fileObj.APPSalesAgentEmail = document.getElementById('miSalesAgenEmail').value;

        fileObj.Hierarchy = document.getElementById('miHierarchy').value;
        fileObj.APPccEmailList = document.getElementById('miCCEmailList').value;
        fileObj.APPbccEmailList = document.getElementById('miBCCEmailList').value;

        ImageApplication.WebServices.DatabaseServices.LoadToMIDB(fileObj, LoadToMIDBCallbackSuccess);
    };

    function LoadToMIDBCallbackSuccess(result) {
        document.getElementById('miOutRefID').value = result.oReferrerID;
        document.getElementById('miOutCmpID').value = result.oCampaignID;
        alert("MI Load Successful");
    }





    UpdMIData = function () {

        var Public = {
            LoadReferrringOrganizationsTo_selOrg: function (elem) {
                elem.style.display = "block;";
                elem.style.cssText = "display: block;"

                ImageApplication.WebServices.DatabaseServices.GetReferringOrganizations(this.GetReferringOrganizations_CallbackSuccess)
            },

            GetReferringOrganizations_CallbackSuccess: function (result) {
                var ddlSel = document.getElementById("selOrg");
                var selectedIdx = 0;
                var ctr = 0;
                var option;
                for (var idx in result.Organizations) {
                    option = document.createElement('option');

                    if (result.Organizations[idx] == "Get a Merchant Account") {
                        result.Organizations[idx] = "APPS Merchant Intake Home";

                    }

                    option.value = result.Organizations[idx];
                    option.innerText = result.Organizations[idx];
                    ddlSel.appendChild(option);
                    ctr++;
                    option = null;
                }
                ddlSel.selectedIndex = 0;

                ddlSel = undefined;
                ddlSel = document.getElementById("selRefID");
                selectedIdx = ctr = option = 0;
                for (var idx in result.IDs) {
                    option = document.createElement('option');
                    option.value = result.IDs[idx];
                    option.innerText = result.IDs[idx];
                    ddlSel.appendChild(option);
                    ctr++;
                    option = null;
                }
                ddlSel.selectedIndex = 0;
            },

            updSelectedReferringOrganizationNameSelected: function (elem) {
                document.getElementById("selRefID").selectedIndex = elem.selectedIndex;

                var value = document.getElementById("selRefID")[document.getElementById("selRefID").selectedIndex].value;

                if (value == "Select")
                    this.GetReferringOrganizationCampaignIDsCallbackSuccess(value);

                ImageApplication.WebServices.DatabaseServices.GetReferringOrganizationCampaignIDs(value, this.GetReferringOrganizationCampaignIDsCallbackSuccess);
            },

            updSelectedReferringOrganizationIdSelected: function (elem) {
                document.getElementById("selOrg").selectedIndex = elem.selectedIndex;
                var value = elem[elem.selectedIndex].value;

                if (value == "Select")
                    this.GetReferringOrganizationCampaignIDsCallbackSuccess(value);

                ImageApplication.WebServices.DatabaseServices.GetReferringOrganizationCampaignIDs(value, this.GetReferringOrganizationCampaignIDsCallbackSuccess);
            },

            updSelectedReferringOrganizationCampaignSelected: function (elem) {
                document.getElementById("btnLoad").disabled = false;
            },

            GetReferringOrganizationCampaignIDsCallbackSuccess: function (result) {
                var ddlSel = document.getElementById("selCmpID");

                ddlSel.options.length = 1;

                if (result == "Select")
                    return;

                var selectedIdx = 0;
                var ctr = 0;
                var option;
                for (var idx in result.CampaignIDs) {
                    option = document.createElement('option');
                    option.value = result.CampaignIDs[idx];
                    option.innerText = result.CampaignIDs[idx];
                    ddlSel.appendChild(option);
                    ctr++;
                    option = null;
                }
                ddlSel.selectedIndex = 0;
            },
            
            loadCurrentData: function () {
                var refID = document.getElementById("selRefID")[document.getElementById("selRefID").selectedIndex].value;
                var cmpID = document.getElementById("selCmpID")[document.getElementById("selCmpID").selectedIndex].value;

                ImageApplication.WebServices.DatabaseServices.GetReferringOrganziationCurrentInfo(refID, cmpID, this.GetReferringOrganziationCurrentInfoCallbackSuccess);
            },

            GetReferringOrganziationCurrentInfoCallbackSuccess: function (result) {
                var curData = result;

                document.getElementById("miCurOrganization").value = result.Organization;
                document.getElementById("miCurPrimaryContactEmail").value = result.PrimaryContactEmail;
                document.getElementById("miCurPrimaryContactName").value = result.PrimaryContactName;
                document.getElementById("miCurCampaignDesc").value = result.CampaignDescription;
                document.getElementById("miCurVerbiage").value = result.Verbiage;
                document.getElementById("miCurSalesAgent").value = result.APPSalesAgentName;
                document.getElementById("miCurSalesAgenEmail").value = result.APPSalesAgentEmail;
                document.getElementById("miCurCCEmailList").value = result.APPccEmailList;
                document.getElementById("miCurBCCEmailList").value = result.APPbccEmailList;
                document.getElementById("miCurHierarchy").value = result.Hierarchy;

            },

            loadMIUPDfilename: function () {
                document.getElementById("miUpdTxt1").value = document.getElementById("miUpdInput1").value;
            },

            loadUpdatesToMIDB: function () {
            var fileObj = new Object;

            fileObj.ReferrerID = document.getElementById("selRefID")[document.getElementById("selRefID").selectedIndex].value;
            fileObj.ReferrerCampaignID = document.getElementById("selCmpID")[document.getElementById("selCmpID").selectedIndex].value;

            fileObj.Organization = null;
            if (document.getElementById('miUpdOrganization').value != "" || document.getElementById('miUpdOrganization').value.length > 0)
                fileObj.Organization = document.getElementById('miUpdOrganization').value;

            fileObj.PrimaryContactEmail = null;
            if (document.getElementById('miUpdPrimaryContactEmail').value != "" || document.getElementById('miUpdPrimaryContactEmail').value.length > 0)
                fileObj.PrimaryContactEmail = document.getElementById('miUpdPrimaryContactEmail').value;

            fileObj.PrimaryContactName = null;
            if (document.getElementById('miUpdPrimaryContactName').value != "" || document.getElementById('miUpdPrimaryContactName').value.length > 0)
                fileObj.PrimaryContactName = document.getElementById('miUpdPrimaryContactName').value;

            fileObj.ImgFile = null;
            if (document.getElementById('miUpdInput1').files.length > 0)
                fileObj.ImgFile = document.getElementById('miUpdInput1').files[0].name;

            fileObj.ImgPath = null;
            if (document.getElementById('miUpdTxt1').value != "" || document.getElementById('miUpdTxt1').value.length > 0)
                fileObj.ImgPath = document.getElementById('miUpdTxt1').value;

            fileObj.CampaignDescription = null;
            if (document.getElementById('miUpdCampaignDesc').value != "" || document.getElementById('miUpdCampaignDesc').value.length > 0)
                fileObj.CampaignDescription = document.getElementById('miUpdCampaignDesc').value;

            fileObj.Verbiage = null;
            if (document.getElementById('miUpdVerbiage').value != "" || document.getElementById('miUpdVerbiage').value.length > 0)
                fileObj.Verbiage = document.getElementById('miUpdVerbiage').value;

            fileObj.APPSalesAgentName = null;
            if (document.getElementById('miUpdSalesAgent').value != "" || document.getElementById('miUpdSalesAgent').value.length > 0)
                fileObj.APPSalesAgentName = document.getElementById('miUpdSalesAgent').value;

            fileObj.APPSalesAgentEmail = null;
            if (document.getElementById('miUpdSalesAgenEmail').value != "" || document.getElementById('miUpdSalesAgenEmail').value.length > 0)
                fileObj.APPSalesAgentEmail = document.getElementById('miUpdSalesAgenEmail').value;

            fileObj.APPccEmailList = null;
            if (document.getElementById('miUpdCCEmailList').value != "" || document.getElementById('miUpdCCEmailList').value.length > 0)
                fileObj.APPccEmailList = document.getElementById('miUpdCCEmailList').value;          

            fileObj.APPbccEmailList = null;
            if (document.getElementById('miUpdBCCEmailList').value != "" || document.getElementById('miUpdBCCEmailList').value.length > 0)
                fileObj.APPbccEmailList = document.getElementById('miUpdBCCEmailList').value;

            fileObj.Hierarchy = null;
            if (document.getElementById('miUpdHierarchy').value != "" || document.getElementById('miUpdHierarchy').value.length > 0)
                fileObj.Hierarchy = document.getElementById('miUpdHierarchy').value;

            ImageApplication.WebServices.DatabaseServices.LoadToMIDB(fileObj, this.LoadUpdatesToMIDBCallbackSuccess);
            },

            LoadUpdatesToMIDBCallbackSuccess: function (result) {
                alert("Update to Referring Organization Data Successful!!!");

                var ancestor = document.getElementById("divUpdateArea"), descendants = ancestor.getElementsByTagName("*");

                var ctr;
                var elem;
                for (var i = 0; i < descendants.length; i++) {
                    elem = descendants[i];
                    if (elem.id == "" || elem.id == undefined)
                        continue;
                    elem.value = "";
                }


                //this.ClearAllUpdFields();
            },

            ClearAllUpdFields: function () {
                var ancestor = document.getElementById("divUpdateArea"), descendants = ancestor.getElementsByTagName("*");

                var ctr;
                var elem;
                for (var i = 0; i < descendants.length; i++) {
                    elem = descendants[i];
                    if (elem.id == "" || elem.id == undefined)
                        continue;
                    elem.value = "";
                }

            }

        };


        return Public;

    }();



    DocumentLoads = function () {
        var Private = {
        };

        var Public = {
            TestLoad: function () {
                alert("DocumentLoads.TestLoad() Fired!");
            },

        };


        return Public;
    }();