﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="TestFreelance.Page.Test" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <title>Test - Freelance </title>
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/Functions.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-1.8.0.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
    $(document).ready(function () {
        $("#btnUpdatePageFromCliente").click(function () {
            var valueTotal =
                parseInt($("#txtRed").val()) +
                parseInt($("#txtBlue").val()) +
                parseInt($("#txtGreen").val());

            var percentageRed = CalculatePercentage(parseInt($("#txtRed").val()), valueTotal);
            var percentageBlue = CalculatePercentage(parseInt($("#txtBlue").val()), valueTotal);
            var percentageGreen = CalculatePercentage(parseInt($("#txtGreen").val()), valueTotal);

            SetColorInBar(percentageRed, percentageBlue, percentageGreen);
            ShowPercentage(percentageRed, percentageBlue, percentageGreen);
        });

        $(".TxtInputColor").keydown(function (event) {
            // Allow only number integer            
            if (event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode >= 96 && event.keyCode <= 105 || event.keyCode == 46 || event.keyCode >= 8 && event.keyCode <= 13) {
            }
            else {
                alert("Input only number");
                $(this).val('');
                event.preventDefault();
            }
        });

        $("#btnGetValueWithAjax").click(function () {
            ShowMessageAjax(
                $("#hdnLblBarRed").val(),
                $("#hdnLblBarBlue").val(),
                $("#hdnLblBarGreen").val());
        });

        $("#langEs").click(function () {
            SetLanguage('ES');
        });

        $("#langUs").click(function () {
            SetLanguage('US');
        });
    });
</script>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Test | Freelance
            </h1>
            <div id="languages">
                <input type="button" runat="server" id="langEs" value="SP" />
                <input type="button" runat="server" id="langUs" value="US" />
            </div>
        </header>
        <section id="Bar">
            <article id="sectorRed" class="Sector" style="background-color: red;" runat="server">
                <label id="lblBarRed" runat="server" />
                <input type="hidden" id="hdnLblBarRed" runat="server" />
            </article>
            <article id="sectorBlue" class="Sector" style="background-color: blue;" runat="server">
                <label id="lblBarBlue" runat="server" />
                <input type="hidden" id="hdnLblBarBlue" runat="server" />
            </article>
            <article id="sectorGreen" class="Sector" style="background-color: green;" runat="server">
                <label id="lblBarGreen" runat="server" />
                <input type="hidden" id="hdnLblBarGreen" runat="server" />
            </article>
        </section>
        <section id="sectionInputData">
            <div id="divInputColors">
                <span>Red</span>
                <input id="txtRed" type="text" runat="server" class="TxtInputColor" />
                <span>Blue</span>
                <input id="txtBlue" type="text" runat="server" class="TxtInputColor" />
                <span>Green</span>
                <input id="txtGreen" type="text" runat="server" class="TxtInputColor" />
            </div>
            <div id="divShowMessage">
                <ul>
                    <label id="lblMessage" runat="server" />
                    <li style="color: red; list-style-type: none;">
                        <label id="lblMessage1" runat="server" />
                    </li>
                    <li style="color: blue; list-style-type: none;">
                        <label id="lblMessage2" runat="server" />
                    </li>
                    <li style="color: green; list-style-type: none;">
                        <label id="lblMessage3" runat="server" />
                    </li>
                </ul>
            </div>
        </section>
        <section id="sectionButton">
            <div id="divButton">
                <input id="btnUpdatePageFromCliente" type="button" runat="server" value="Update Page (client)"
                    class="Button" />
                <input id="btnGetValueWithPostBack" type="button" runat="server" value="Get values on server side postback"
                    class="Button" onserverclick="ShowResult" />
                <input id="btnGetValueWithAjax" type="button" value="Get values on server side" class="Button" />
            </div>
        </section>
        <footer>
            <span>Realized by</span>
            <a>Gustavo Lopez</a>
        </footer>
    </form>
</body>
</html>
