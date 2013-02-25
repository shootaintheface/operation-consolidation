<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="MSIIIHome.aspx.cs" Inherits="MSIII_MSIIIHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table style="width: 500px">
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink6" runat="server" 
                    NavigateUrl="~/MSIII/AddOPORD.aspx">OPORD List</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/MSIII/NewOp.aspx">Add OPORD</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

