<%@ Page Title="Configure Sandbox" Language="C#" AutoEventWireup="true" CodeBehind="Configure.aspx.cs" MasterPageFile="~/Site.Master" Inherits="DeveloperSite.Configure" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="/Scripts/CodeMirror/lib/codemirror.css">
    <link rel="stylesheet" href="/Scripts/CodeMirror/theme/eclipse.css">
    <link rel="stylesheet" href="/Scripts/CodeMirror/addon/dialog/dialog.css">
    <link rel="stylesheet" href="/Scripts/CodeMirror/addon/search/matchesonscrollbar.css">
    <link rel="stylesheet" href="/Scripts/CodeMirror/addon/fold/foldgutter.css" />

    <script src="/Scripts/CodeMirror/lib/codemirror.js"></script>
    <script src="/Scripts/CodeMirror/mode/javascript/javascript.js"></script>
    <script src="/Scripts/CodeMirror/mode/xml/xml.js"></script>

    <script src="/Scripts/CodeMirror/addon/dialog/dialog.js"></script>
    <script src="/Scripts/CodeMirror/addon/search/searchcursor.js"></script>
    <script src="/Scripts/CodeMirror/addon/search/search.js"></script>
    <script src="/Scripts/CodeMirror/addon/scroll/annotatescrollbar.js"></script>
    <script src="/Scripts/CodeMirror/addon/search/matchesonscrollbar.js"></script>
    <script src="/Scripts/CodeMirror/addon/search/jump-to-line.js"></script>
    <script src="/Scripts/CodeMirror/addon/fold/brace-fold.js"></script>
    <script src="/Scripts/CodeMirror/addon/edit/matchbrackets.js"></script>
    <script src="/Scripts/CodeMirror/addon/fold/foldcode.js"></script>
    <script src="/Scripts/CodeMirror/addon/fold/foldgutter.js"></script>

    <div class="row">
        <div class="col-md-8">

            <h4 runat="server" id="UISandboxTitle"></h4>
        </div>
        <div class="col-md-4">
            <div class="pull-right">
                <asp:Button runat="server" CausesValidation="false" ID="UIResetConfiguration" UseSubmitBehavior="false" Text="Reset" CssClass="btn btn-link" OnClick="UIResetConfiguration_Click" />
                <asp:Button runat="server" ID="UICancelConfiguration" UseSubmitBehavior="false" CausesValidation="false" Text="Cancel" CssClass="btn btn-secondary" OnClick="UICancelConfiguration_Click" />
                <asp:Button runat="server" ID="UISaveConfgiuration" Text="Save" CssClass="btn btn-primary" OnClick="UISaveConfgiuration_Click" OnClientClick="if ( ! confirmSave()) return false;" />
            </div>
            <asp:CustomValidator runat="server" ControlToValidate="UIConfiguration" Style="color: red; float: right;" OnServerValidate="UIConfiguration_ServerValidate" Text="Configuration JSON syntax error." Display="Dynamic" />
            <asp:CustomValidator runat="server" ControlToValidate="BAXMLConfiguration" Style="color: red; float: right;" OnServerValidate="BAXMLConfiguration_ServerValidate" Text="Configuration XML syntax error." Display="Dynamic"></asp:CustomValidator>
            <p class="text-success" style="float: right;">
                <asp:Literal runat="server" ID="ltrSaveSuccess" Text="Saved Successfully" Visible="false"></asp:Literal>
            </p>
        </div>
    </div>
    <div class="row" runat="server" id="divBAXMLConfiguration" visible="false">
        <div class="col-md-3">
            <a class="dropdown-toggle btn btn-primary" id="lnkISOProductsXMLConfiguration" data-toggle="dropdown" href="#">ISO Products <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu" aria-labelledby="lnkISOProductsXMLConfiguration">
                <li role="presentation">
                    <asp:LinkButton ID="lnkISOInputAttributes" runat="server" Text="Input Attributes" CausesValidation="false" OnClick="BAXmlConfiguration_click"></asp:LinkButton>
                </li>
                <li role="presentation">
                    <asp:LinkButton ID="lnkISOOutputAttributes" runat="server" Text="Output Attributes" CausesValidation="false" OnClick="BAXmlConfiguration_click"></asp:LinkButton>
                </li>
            </ul>
        </div>
        <div class="col-md-3">
            <a class="dropdown-toggle btn btn-primary" id="lnkSolartisProductsXMLConfiguration" data-toggle="dropdown" href="#">Solartis Products <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu" aria-labelledby="lnkSolartisProductsXMLConfiguration">
                <li role="presentation">
                    <asp:LinkButton ID="lnkSolartisInputAttributes" runat="server" Text="Input Attributes" CausesValidation="false" OnClick="BAXmlConfiguration_click"></asp:LinkButton>
                </li>
                <li role="presentation">
                    <asp:LinkButton ID="lnkSolartisOutputAttributes" runat="server" Text="Output Attributes" CausesValidation="false" OnClick="BAXmlConfiguration_click"></asp:LinkButton>
                </li>
            </ul>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:TextBox ValidateRequestMode="Disabled" runat="server" ID="UIConfiguration" TextMode="MultiLine" Columns="50" Rows="50" CssClass="form-control" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="col-md-12">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:TextBox ValidateRequestMode="Disabled" runat="server" ID="BAXMLConfiguration" TextMode="MultiLine" Columns="50" Rows="50" CssClass="form-control" Visible="false" />
                </ContentTemplate>
                <Triggers>
                    <%--<asp:AsyncPostBackTrigger ControlID="ISOProductsXml" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="SolartisProductsXml" EventName="Click" />--%>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>

    <style>
        textarea + div.CodeMirror {
            border: 1px solid #ccc;
        }
    </style>

    <script type="text/javascript">
        var codemirror_config = {
            mode: "application/ld+json",
            lineNumbers: true,
            matchBrackets: true,
            searchMode: 'inline',
            theme: 'eclipse',
            extraKeys: { "Ctrl-F": "findPersistent" },
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        };

        $(function () {
            Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function () {
                CodeMirror.fromTextArea(document.getElementById('<% =UIConfiguration.ClientID %>'), codemirror_config);
            });
        });

        var xmlEditor = CodeMirror.fromTextArea(document.getElementById('<% =BAXMLConfiguration.ClientID %>'), {
            mode: "text/html",
            lineNumbers: true,
            matchBrackets: true,
            readOnly: false,
            theme: 'eclipse',
            extraKeys: { "Ctrl-F": "findPersistent" },
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        $(function () {
            Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function () {
                CodeMirror.fromTextArea(document.getElementById('<% =BAXMLConfiguration.ClientID %>'), xmlEditor);
            });
        });
        function confirmSave() {
            return confirm("Are you sure you want to save?");
        }
    </script>
</asp:Content>
