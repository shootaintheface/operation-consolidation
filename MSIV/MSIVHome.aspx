<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="MSIVHome.aspx.cs" Inherits="MSIV_MSIVHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table class="style1">
    <tr>
        <td>
            <asp:HyperLink ID="HyperLink6" runat="server" 
                NavigateUrl="~/MSIV/OPORDList.aspx">All Opord Files</asp:HyperLink>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:HyperLink ID="HyperLink7" runat="server" 
                NavigateUrl="~/MSIV/MSIVOpAdd.aspx">MSIV OPORD</asp:HyperLink>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/MSIV/TAC.aspx">Tac</asp:HyperLink>
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

