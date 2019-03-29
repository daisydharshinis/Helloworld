<%@ Page Title="Home | Insurance Microservices" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DeveloperSite._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
     
    </style>
    <div class="jumbotron">
        <h3>Welcome to Solartis Insure Sandbox Center</h3>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-4 col-sm-12">
            <h4>Business Analyst Sandbox</h4>
            <div class="row">
                <div class="col-xs-3">
                    <img src="../Images/Target.png" alt="solartis-insure-contact-us-for-a-free-demo" width="97" height="84">
                </div>
                <div class="col-xs-9">
                    <p>Try our example lightning fast microservices in our test harness. Add your own test data in the JSON request and see the resulting info returned in the JSON response.</p>
                    <br />
                    <asp:Button runat="server" ID="btnGoBA" Text="CHECK IT OUT" CssClass="btn btn-primary" OnClick="OnCheckoutButton_Click" />
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-12">
            <h4>Developer Sandbox</h4>
            <div class="row">
                <div class="col-xs-3">
                    <img src="../Images/Target.png" alt="solartis-insure-contact-us-for-a-free-demo" width="97" height="84">
                </div>
                <div class="col-xs-9">
                    <p>Try our example microservices with your technology platforms. Download the packages and quickly enable the sample code in your development environment.</p>
                    <br />
                    <asp:Button runat="server" ID="btnGoDev" Text="CHECK IT OUT" CssClass="btn btn-primary" OnClick="OnCheckoutButton_Click" />
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-12">
            <h4>User Experience Sandbox</h4>
            <div class="row">
                <div class="col-xs-3">
                    <img src="../Images/Target.png" alt="solartis-insure-contact-us-for-a-free-demo" width="97" height="84">
                </div>
                <div class="col-xs-9">
                    <p>Try examples of our Solartis Insure Software as a Service implementations.   Quote, propose, pay and issue test policies on your own with our example product lines.</p>
                    <br />
                    <asp:Button runat="server" ID="btnGoUE" Text="CHECK IT OUT" CssClass="btn btn-primary" OnClick="OnCheckoutButton_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
