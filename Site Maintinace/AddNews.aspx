<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="AddNews.aspx.cs" Inherits="Site_Maintinace_AddNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            width: 6px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table width="720px">
        <tr>
            <td>
                Title of Article</td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
            </td>
            <td class="style7">
                &nbsp;</td>
            <td>
                <asp:Label ID="lblDate" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Add Picture</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
&nbsp;
            </td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Add Caption</td>
            <td>
                <asp:TextBox ID="txtCaption" runat="server"></asp:TextBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringMain %>" 
                    SelectCommand="SELECT * FROM [STORY]"></asp:SqlDataSource>
            </td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Article</td>
            <td>
                <asp:TextBox ID="txtArticle" runat="server" Height="180px" TextMode="MultiLine" 
                    Width="500px"></asp:TextBox>
            </td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Upload" />
&nbsp;&nbsp;
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Image ID="imgPreview" runat="server" Height="120px" 
                    Width="160px" />
            </td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

