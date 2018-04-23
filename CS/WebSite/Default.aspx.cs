using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;

public partial class _Default : System.Web.UI.Page
{
	protected void ASPxGridViewDetail_Init(object sender, EventArgs e)
	{
		ASPxGridView gridViewDetail = (ASPxGridView)sender;
		gridViewDetail.ID = string.Format("gv_{0}", gridViewDetail.GetMasterRowKeyValue());
		gridViewDetail.ClientInstanceName = gridViewDetail.ID;
	}
	protected void ASPxGridViewDetail_BeforePerformDataSelect(object sender, EventArgs e)
	{
		ASPxGridView gridViewDetail = (ASPxGridView)sender;
		Session["CategoryID"] = gridViewDetail.GetMasterRowKeyValue();
	}
	protected void ASPxGridViewDetail_DataBound(object sender, EventArgs e)
	{
		ASPxGridView gridViewDetail = (ASPxGridView)sender;
		if (ASPxHiddenFieldStorage.Contains(gridViewDetail.ID))
		{
			object[] keys = (object[])ASPxHiddenFieldStorage[gridViewDetail.ID];
			foreach (object key in keys)
				gridViewDetail.Selection.SelectRowByKey(int.Parse(key.ToString()));
		}
	}
}