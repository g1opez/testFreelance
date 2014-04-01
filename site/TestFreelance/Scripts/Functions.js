/*  Page/Test.aspx  */
function SetColorInBar(cRed, cBlue, cGreen) {
    $("#sectorRed").css({
        'width': '' + cRed + '%'
    });
    $("#sectorBlue").css({
        'width': '' + cBlue + '%'
    });
    $("#sectorGreen").css({
        'width': '' + cGreen + '%'
    });
}

function ShowPercentage(cRed, cBlue, cGreen) {
    // Red        
    $("#lblBarRed").text(parseFloat(cRed).toFixed(2) + '%');
    $("#hdnLblBarRed").val(parseFloat(cRed).toFixed(2));
    // Blue
    $("#lblBarBlue").text(parseFloat(cBlue).toFixed(2) + '%');
    $("#hdnLblBarBlue").val(parseFloat(cBlue).toFixed(2));
    // Green
    $("#lblBarGreen").text(parseFloat(cGreen).toFixed(2) + '%');
    $("#hdnLblBarGreen").val(parseFloat(cGreen).toFixed(2));
}

function ShowMessageAjax(cRed, cBlue, cGreen) {
    $.ajax({
        type: "POST",
        url: "/Page/Test.aspx/ShowMessageAjax",
        data: "{cRed:'" + cRed + "',cBlue:'" + cBlue + "',cGreen:'" + cGreen + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            setMessageAndShow(data);
        },
        error: function (data) {
            if (data.d != undefined) {
                alert('There was an error.' + data.d);
            }
        }
    });
};

function setMessageAndShow(data) {
    $("#lblMessage").text(data.d.lblMessage);
    $("#lblMessage1").text(data.d.lblMessage1);
    $("#lblMessage2").text(data.d.lblMessage2);
    $("#lblMessage3").text(data.d.lblMessage3);
}

function SetLanguage(lang) {
    $.ajax({
        async: false,
        type: "POST",
        url: "/Page/Test.aspx/SetLanguage",
        data: "{lang:'" + lang + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $('#btnUpdatePageFromCliente').val(data.d.button1);
            $('#btnGetValueWithPostBack').val(data.d.button2);
            $('#btnGetValueWithAjax').val(data.d.button3);
            $('#langEs').val(data.d.langEs);
            $('#langUs').val(data.d.langUs);            
            $('footer > span').text(data.d.lblFooter);
            $('#divInputColors span:nth-of-type(1)').text(data.d.colorRed);
            $('#divInputColors span:nth-of-type(2)').text(data.d.colorBlue);
            $('#divInputColors span:nth-of-type(3)').text(data.d.colorGreen);
        },
        error: function (data) {
            if (data.d != undefined) {
                alert('There was an error.' + data.d);
            }
        }
    });
}
/* --------------- */
function CalculatePercentage(valueColor, valueTotal) {
    return valueColor * 100 / valueTotal;
}
