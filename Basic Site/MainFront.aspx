<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="MainFront.aspx.cs" Inherits="MainFront" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style4
        {
            width: 369px;
        }
    .style5
    {
        }
    .style6
    {
        width: 196px;
    }
    .style7
    {
        width: 259px;
    }
        .style8
        {
            width: 168px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <br />
    <table>
        <tr>
            <td class="style8" width="150px">
                <asp:Label ID="lblArticleTitle" runat="server" style="font-size: x-large"></asp:Label>
            </td>
            <td class="style7" width="150px">
            </td>
            <td class="style4" rowspan="2">
                <asp:Image ID="picNewsPic" runat="server" Height="215px" Width="285px" />
            </td>
        </tr>
        <tr>
            <td class="style5" colspan="2" width="150px">
                <asp:Label ID="lblArticle" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style8" width="150px">
                &nbsp;</td>
            <td class="style7" width="150px">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="lblPicDiscription" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style8" width="150px">
                &nbsp;</td>
            <td class="style7" width="150px">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8" width="150px">
                <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td class="style7" width="150px">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
        </tr>
    </table>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <asp:SqlDataSource ID="sqlNewsArticleDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMain %>" 
        SelectCommand="SELECT * FROM [NEWS]"></asp:SqlDataSource>
</asp:Content>

