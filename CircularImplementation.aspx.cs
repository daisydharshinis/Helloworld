using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DeveloperSite.Common;
using DeveloperSite.Common.Api;
using Newtonsoft.Json.Linq;

namespace DeveloperSite
{
    public partial class CircularImplementation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                PagingSearching1.tableName = rblTables.SelectedValue;
                DomainTableValueDetailGridTitle.Text = PagingSearching1.tableName + " Table Changes";
        }

        //private void PagingSearching1_visibilityChanged(object sender, ParentDivVisibilityChangedEventArgs e)
        //{
        //    throw new NotImplementedException();
        //}
    }


    public static class DataTableExtensions
    {
        public static void SetColumnsOrder(this DataTable table, params String[] columnNames)
        {
            int columnIndex = 0;
            foreach (var columnName in columnNames)
            {
                table.Columns[columnName].SetOrdinal(columnIndex);
                columnIndex++;
            }
        }
    }
}