<%@ Page Title="How To" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HowTo.aspx.cs" Inherits="DeveloperSite.HowTo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <div id="howTo">
        <div>
            <blockquote>
                <p>View our demo videos to know how our Rating engine works for various Business Lines/Products</p>
            </blockquote>
            <hr />
        </div>
        <div class="row">
            <div class="col-md-9">
                <asp:UpdatePanel runat="server" ID="updatePanel1">
                    <ContentTemplate>
                        <div class="panel">
                            <video style="width: 100%; height: 100%" id="demoVideo" controls autoplay runat="server">
                                <%--<source src="/Images/Demo.webm"
                            type='video/webm' />--%>
                                <source runat="server" src="/Images/Demo.mp4" id="videoSource" type='video/mp4' />
                                <%--<p>Your browser does not support the video tag</p>--%>
                            </video>
                        </div>
                        <h3 runat="server" id="hdrProduct">ISO - Business Owners</h3>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="lnkBOP" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkGL" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkCUP" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkIH" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkCA" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkAU" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkLTI" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkCEQ" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkProff" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkFWC" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkPL" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkArt" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkHab" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkVac" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>


            </div>

            <div class="col-md-3">
                <div class="panel-group" id="divAccordion">
                    <div class="panel panel-primary">
                        <div class="panel-heading" style="background-color: #2C9CEE;">
                            <h4 class="panel-title">
                                <a id="lblHeader" runat="server" class="accordion-toggle collapsed" data-toggle="collapse" title="Click here to Show/Hide the product version details" data-parent="#divAccordion" href="#collapseOne">ISO Products</a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="collapse collapse in">
                            <div class="list-group">
                                <asp:LinkButton ID="lnkBOP" runat="server" OnClick="LoadVideo" CssClass="list-group-item" Style="padding: 6px 10px;"><span class="glyphicon glyphicon-play-circle" style="padding-right: 10px; color: darkblue;"></span>Business Owners</asp:LinkButton>
                                <asp:LinkButton ID="lnkGL" runat="server" OnClick="LoadVideo" CssClass="list-group-item" Style="padding: 6px 10px;"><span class="glyphicon glyphicon-play-circle" style="padding-right: 10px; color: darkblue;"></span>General Liability</asp:LinkButton>
                                <asp:LinkButton ID="lnkCUP" runat="server" OnClick="LoadVideo" CssClass="list-group-item" Style="padding: 6px 10px;"><span class="glyphicon glyphicon-play-circle" style="padding-right: 10px; color: darkblue;"></span>Commercial Umbrella</asp:LinkButton>
                                <asp:LinkButton ID="lnkIH" runat="server" OnClick="LoadVideo" CssClass="list-group-item" Style="padding: 6px 10px;"><span class="glyphicon glyphicon-play-circle" style="padding-right: 10px; color: darkblue;"></span>Non-Filed Inland Marine</asp:LinkButton>
                                <asp:LinkButton ID="lnkCA" runat="server" OnClick="LoadVideo" CssClass="list-group-item" Style="padding: 6px 10px;"><span class="glyphicon glyphicon-play-circle" style="padding-right: 10px; color: darkblue;"></span>Commercial Auto (CA)</asp:LinkButton>
                                <asp:LinkButton ID="lnkAU" runat="server" OnClick="LoadVideo" CssClass="list-group-item" Style="padding: 6px 10px;"><span class="glyphicon glyphicon-play-circle" style="padding-right: 10px; color: darkblue;"></span>Commercial Auto - OCP (AU)</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <%--</div>
            <div class="panel-group" id="divSolartisProductsAccordian">--%>
                    <div class="panel panel-primary">
                        <div class="panel-heading" style="background-color: #2C9CEE;">
                            <h4 class="panel-title">
                                <a id="aSolHeader" runat="server" class="accordion-toggle collapsed" data-toggle="collapse" title="Click here to Show/Hide the product version details" data-parent="#divAccordion" href="#collapseTwo">Solartis Products
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="collapse collapse out">
                            <div class="list-group">
                                <asp:LinkButton ID="lnkLTI" runat="server" OnClick="LoadVideo" CssClass="list-group-item" Style="padding: 6px 10px;">
                                    <span class="glyphicon glyphicon-play-circle" style="padding-right: 10px; color: darkblue;"></span>Leisure Travel</asp:LinkButton>
                                <asp:LinkButton ID="lnkCEQ" runat="server" OnClick="LoadVideo" CssClass="list-group-item" Style="padding: 6px 10px;">
                                    <span class="glyphicon glyphicon-play-circle" style="padding-right: 10px; color: darkblue;"></span>Commercial - Earthquake</asp:LinkButton>
                                <asp:LinkButton ID="lnkProff" runat="server" OnClick="LoadVideo" CssClass="list-group-item" Style="padding: 6px 10px;">
                                    <span class="glyphicon glyphicon-play-circle" style="padding-right: 10px; color: darkblue;"></span>Proffessional Liability</asp:LinkButton>
                                <asp:LinkButton ID="lnkFWC" runat="server" OnClick="LoadVideo" CssClass="list-group-item" Style="padding: 6px 10px;">
                                    <span class="glyphicon glyphicon-play-circle" style="padding-right: 10px; color: darkblue;"></span>Commercial - Fire and Wind</asp:LinkButton>
                                <asp:LinkButton ID="lnkPL" runat="server" OnClick="LoadVideo" CssClass="list-group-item" Style="padding: 6px 10px;">
                                    <span class="glyphicon glyphicon-play-circle" style="padding-right: 10px; color: darkblue;"></span>Personal Lines - Home Owners</asp:LinkButton>
                                <asp:LinkButton ID="lnkArt" runat="server" OnClick="LoadVideo" CssClass="list-group-item" Style="padding: 6px 10px;">
                                    <span class="glyphicon glyphicon-play-circle" style="padding-right: 10px; color: darkblue;"></span>Commercial - Artisan Contractors</asp:LinkButton>
                                <asp:LinkButton ID="lnkHab" runat="server" OnClick="LoadVideo" CssClass="list-group-item" Style="padding: 6px 10px;">
                                    <span class="glyphicon glyphicon-play-circle" style="padding-right: 10px; color: darkblue;"></span>Commercial - Habitational</asp:LinkButton>
                                <asp:LinkButton ID="lnkVac" runat="server" OnClick="LoadVideo" CssClass="list-group-item" Style="padding: 6px 10px;"><span class="glyphicon glyphicon-play-circle" style="padding-right: 10px; color: darkblue;"></span>Commercial - Vacant</asp:LinkButton>
                            </div>
                            <div id="myTabContent2" class="tab-content col-lg-8" runat="server">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
