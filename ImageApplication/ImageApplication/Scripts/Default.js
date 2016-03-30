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
//    var imgID = $('#txtImgID')[0].value;
//    var imgID = $('#txtImgID').value;
//    var imgID = $("#txtImgID").value;
//    var imgID = $("#txtImgID")[0].value;

    ImageApplication.WebServices.DatabaseServices.ExtractFromDB(imgID, ExtractFromDBCallbackSuccess);
};

function ExtractFromDBCallbackSuccess(result) {
    var pic = new Image(100, 100);
    pic.src = result;

    var imgArea = document.getElementById("imgArea");
    imgArea.src = "data:image/png;base64," + result;
    //imgArea.src = pic.src;


    //$("#imgArea").attr("src", pic);
}


