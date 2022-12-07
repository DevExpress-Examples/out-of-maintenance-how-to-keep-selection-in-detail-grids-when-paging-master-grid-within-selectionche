Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub ASPxGridViewDetail_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim gridViewDetail As ASPxGridView = CType(sender, ASPxGridView)
		gridViewDetail.ID = String.Format("gv_{0}", gridViewDetail.GetMasterRowKeyValue())
		gridViewDetail.ClientInstanceName = gridViewDetail.ID
		gridViewDetail.JSProperties("cpName") = gridViewDetail.ID
	End Sub
	Protected Sub ASPxGridViewDetail_BeforePerformDataSelect(ByVal sender As Object, ByVal e As EventArgs)
		Dim gridViewDetail As ASPxGridView = CType(sender, ASPxGridView)
		Session("CategoryID") = gridViewDetail.GetMasterRowKeyValue()
	End Sub
	Protected Sub ASPxGridViewDetail_DataBound(ByVal sender As Object, ByVal e As EventArgs)
		Dim gridViewDetail As ASPxGridView = CType(sender, ASPxGridView)
		If ASPxHiddenFieldStorage.Contains(gridViewDetail.ID) Then
			Dim keys() As Object = CType(ASPxHiddenFieldStorage(gridViewDetail.ID), Object())
			For Each key As Object In keys
				gridViewDetail.Selection.SelectRowByKey(Integer.Parse(key.ToString()))
			Next key
		End If
	End Sub
End Class