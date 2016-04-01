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
    var eleFile = document.getElementById('miInput1');

    var selectedPath = eleFile.value;
    var selectedFile = eleFile.files[0];

    document.getElementById('miTxt1').value = selectedPath;

}


var LoadToMIDB = function () {
    var fileObj = new Object;

    fileObj.ReferrerID = 0; // default to new
    if (document.getElementById('miReferrerID').value != "" && document.getElementById('miReferrerID').value != undefined)
        fileObj.ReferrerID = document.getElementById('miReferrerID').value;

    fileObj.Organization = document.getElementById('miOrganization').value;
    fileObj.Email = document.getElementById('miEmail').value;
    fileObj.Contact = document.getElementById('miContact').value;

    fileObj.ReferrerCampaignID = 0;
    if (document.getElementById('miCampaignID').value != "" && document.getElementById('miCampaignID').value != undefined)
        fileObj.ReferrerCampaignID = document.getElementById('miCampaignID').value;

    fileObj.ImgFile = document.getElementById('miInput1').files[0].name;
    fileObj.ImgPath = document.getElementById('miTxt1').value;
    fileObj.CampaignDescription = document.getElementById('miCampaignDesc').value;
    fileObj.Verbiage = document.getElementById('miVerbiage').value;



    ImageApplication.WebServices.DatabaseServices.LoadToMIDB(fileObj, LoadToMIDBCallbackSuccess);
};

function LoadToMIDBCallbackSuccess(result) {
    document.getElementById('miOutRefID').value = result.oReferrerID;
    document.getElementById('miOutCmpID').value = result.oCampaignID;
    alert("MI Load Successful");
}

