<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chatbot.aspx.cs" Inherits="DeveloperSite.Chatbot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chat test!</title>
</head>
<body>
    <h1 class="chat-title">Solartis Chatbot</h1>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" AsyncPostBackTimeout="500000" EnablePageMethods="true">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="respond" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="chat-holder">
                    <div id="chat" runat="server"></div>
                    <div class="chat-footer">
                        <asp:TextBox runat="server" ID="InputMessage" CssClass="chat-text" placeholder="Type here..." CausesValidation="true" />
                        <asp:Button runat="server" ID="SendMessage" CssClass="chat-send" OnClick="SendMessage_Click" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script type="text/javascript">
        setInterval("nextMessage()", 200);

        function updateMessages(xhr, status, args) {
            if (!args.ok)
                return;
            var meOrBot = args.user == "me" ? "me" : "bot";
            $('#chat').append(
                    '<div class="msg ' + meOrBot + '"> ' + args.text + '</div>');
            document.getElementById("form1:message").value = '';
        }

        function getfocus() {
            document.getElementById("form1:message").focus();
        }
        getfocus();

        $(document).ready(function () {
            $('input.chat-text').attr('placeholder', 'Type Here...');
        });
    </script>
    <style>
        body {
            background-image: url('http://www.oxygenna.com/wp-content/uploads/2015/11/18.jpg');
            background-attachment: fixed;
            background-position: center;
            background-repeat: round;
            font-family: helvetica;
        }

        .chat-title {
            text-align: center;
            color: white;
        }

        .chat-holder {
            width: 500px;
            margin: 0 auto;
            background: #fff;
        }

        .chat-footer {
            border-top: 1px solid #ccc;
        }

        #chat {
            padding: 20px;
            overflow-y: auto;
            height: 400px;
        }

        .chat-text {
            border-radius: 20px;
            border: 1px solid #ccc;
            width: 386px;
            padding: 14px;
            margin: 10px;
            margin-right: 0px;
        }

        .chat-send {
            border-radius: 60px;
            padding: 14px;
            margin: 10px;          
            background: #f65121;
            border: 1px solid #ccc;
            background-image: url('Images/ic_send.svg');
            background-repeat: no-repeat;
            width: 48px;
            height: 48px;
            cursor: pointer;
            background-position-x: center;
            background-position-y: center;
        }

            .chat-send span {
            }

        .msg {
            margin-bottom: 10px;
            color: white;
            clear: both;
        }

            .msg.me {
                background: #26a3db;
                float: right;
                display: inline-block;
                position: relative;
                padding: 8px;
                border-radius: 15px;
                border-bottom-right-radius: 0px;
            }

            .msg.bot {
                background: #f65121;
                float: left;
                display: inline-block;
                position: relative;
                padding: 8px;
                border-radius: 15px;
                border-top-left-radius: 0px;
            }
    </style>
</body>
</html>
