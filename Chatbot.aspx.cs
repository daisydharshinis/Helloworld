using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeveloperSite
{
    public partial class Chatbot : System.Web.UI.Page
    {
/*
        ConversationService conversation;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                conversation = new ConversationService();
                conversation.SetCredential("b3032d73-7f12-4de1-8c72-8df1dcbee573", "3GYefdXUyolf");
                        }
        }

        protected void SendMessage_Click(object sender, EventArgs e)
        {
            string inputMessage = InputMessage.Text.ToString();
            chat.InnerHtml = string.Format("<div class=\"msg me\">{0}</div>", inputMessage);
            var response = sendMessage("fedf5803-ac12-4903-acd9-9e99adfc8275", inputMessage, null);

        }

        private MessageResponse sendMessage(string workspaceId, string message, Context context)
        {
            MessageRequest messageRequest = new MessageRequest()
            {
                Input = new InputData()
                {
                    Text = ""
                },
                Context = context
            };
        }
    }*/
}