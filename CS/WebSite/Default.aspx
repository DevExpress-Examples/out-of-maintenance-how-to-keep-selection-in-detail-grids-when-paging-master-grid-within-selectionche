<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web" TagPrefix="dxhf" %>
<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>

	<script type="text/javascript" language="javascript">
	    var detailGridViewName = '';
	    function SelectionChangedEventHandler(s, e) {
			detailGridViewName = s.cpName;
			s.GetSelectedFieldValues('ProductID', SaveSelection);
		}
		function SaveSelection(selectedKeys) {
		    HiddenFieldStorage.Set(detailGridViewName, selectedKeys);
		}
	</script>

	<form id="mainForm" runat="server">
	<div>
		<dxhf:ASPxHiddenField ID="ASPxHiddenFieldStorage" runat="server" ClientInstanceName="HiddenFieldStorage">
		</dxhf:ASPxHiddenField>
		<dxwgv:ASPxGridView ID="ASPxGridViewMaster" runat="server" AutoGenerateColumns="False"
			DataSourceID="AccessDataSourceMaster" KeyFieldName="CategoryID">
			<Templates>
				<DetailRow>
					<dxwgv:ASPxGridView ID="ASPxGridViewDetail" runat="server" AutoGenerateColumns="False"
						DataSourceID="AccessDataSourceDetail" KeyFieldName="ProductID" OnBeforePerformDataSelect="ASPxGridViewDetail_BeforePerformDataSelect"
						OnDataBound="ASPxGridViewDetail_DataBound" OnInit="ASPxGridViewDetail_Init">
						<ClientSideEvents SelectionChanged="SelectionChangedEventHandler" />
						<Columns>
							<dxwgv:GridViewCommandColumn ShowSelectCheckbox="true" VisibleIndex="0">
							</dxwgv:GridViewCommandColumn>
							<dxwgv:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="1">
								<EditFormSettings Visible="False" />
							</dxwgv:GridViewDataTextColumn>
							<dxwgv:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="2">
							</dxwgv:GridViewDataTextColumn>
							<dxwgv:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="3">
							</dxwgv:GridViewDataTextColumn>
							<dxwgv:GridViewDataCheckColumn FieldName="Discontinued" VisibleIndex="4">
							</dxwgv:GridViewDataCheckColumn>
						</Columns>
						<SettingsDetail IsDetailGrid="True" />
					</dxwgv:ASPxGridView>
				</DetailRow>
			</Templates>
			<Columns>
				<dxwgv:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
					<EditFormSettings Visible="False" />
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="Description" VisibleIndex="2">
				</dxwgv:GridViewDataTextColumn>
			</Columns>
			<SettingsDetail ShowDetailRow="True" />
			<SettingsPager PageSize="5" />
		</dxwgv:ASPxGridView>
	</div>
	<asp:AccessDataSource ID="AccessDataSourceMaster" runat="server" DataFile="~/App_Data/nwind.mdb"
		SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
	</asp:AccessDataSource>
	<asp:AccessDataSource ID="AccessDataSourceDetail" runat="server" DataFile="~/App_Data/nwind.mdb"
		SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [Discontinued] FROM [Products] WHERE ([CategoryID] = ?)">
		<SelectParameters>
			<asp:SessionParameter Name="CategoryID" SessionField="CategoryID" Type="Int32" />
		</SelectParameters>
	</asp:AccessDataSource>
	</form>
</body>
</html>