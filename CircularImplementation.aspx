<%@ Page Title="Circular Implementation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="CircularImplementation.aspx.cs" Inherits="DeveloperSite.CircularImplementation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:RadioButtonList ID="rblTables" CssClass="btn-group" RepeatColumns="4" RepeatDirection="Horizontal" runat="server" AutoPostBack="true">
            <asp:ListItem Text="ZipCode" Value="ZipCode" Selected="True" />
            <asp:ListItem Text="TerritoryCodeByZipCode" Value="TerritoryCodeByZipCode" />
        </asp:RadioButtonList>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="width: 80%;">
                <div class="modal-header">
                    <h3 class="panel-title" style="display: inline; line-height: 24px;">
                        <asp:Literal runat="server" Text="Circular Implementation Deviations" ID="DomainTableValueDetailGridTitle" /></h3>
                </div>

                <div class="modal-content">
                    <sol:PagingSearching ID="PagingSearching1"
                        circularNumber="LI-GL-2017-108" tableName="ZipCode" tableType="domain" runat="server" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>

