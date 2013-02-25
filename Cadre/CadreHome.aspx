<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="CadreHome.aspx.cs" Inherits="Cadre_CadreHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table style="width: 600px">
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink6" runat="server" 
                    NavigateUrl="~/Cadre/CadreClassList.aspx">Class List</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink9" runat="server" 
                    NavigateUrl="~/Cadre/AddCalendarEvents.aspx">Class Calendar</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink7" runat="server" 
                    NavigateUrl="~/Cadre/CadreAddNotes.aspx">Class Notes</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink10" runat="server" 
                    NavigateUrl="~/Cadre/CadreOpOrdLookUp.aspx">OPORD Look Up</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="style7">
                </td>
            <td class="style7">
                </td>
        </tr>
    </table>
</asp:Content>

