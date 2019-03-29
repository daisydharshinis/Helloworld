<%@ Page Title="Holding Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Holding.aspx.cs" Inherits="DeveloperSite._Holding" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="text-align:center">
        <p class="lead" style="font-size:40px;"></p>
        <h3 style="color:#666666"><b><asp:Label ID="lblLobName" runat="server"/> site is currently <br> being updated.</b></h3>
        <br>
        <img src="\Images\underconstruction.png" />
        <br>
        <br>
        <p class="lead" style="font-size:25px"><b>We will be back shortly. <br> Thank you for your patience.</b></p>
    </div>   
</asp:Content>
