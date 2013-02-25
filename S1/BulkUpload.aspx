<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="BulkUpload.aspx.cs" Inherits="S1_BulkUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table width="720px">
        <tr>
            <td>
                Upload File</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            &nbsp;
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Upload" />
&nbsp;
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Add To Data Base</td>
            <td>
                <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                    Text="Update Database" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
                    SelectCommand="SELECT * FROM [CADET]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
</asp:Content>

