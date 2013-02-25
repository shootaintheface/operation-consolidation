<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="AddEvent.aspx.cs" Inherits="Cadre_AddEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table width="600px">
        <tr>
            <td>
                Event Date: (MM/DD/YYYY)</td>
            <td>
                <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Event Description:</td>
            <td>
                <asp:TextBox ID="txtContent" runat="server" Height="137px" TextMode="MultiLine" 
                    Width="363px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblResult" runat="server"></asp:Label>
    <br />
    <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="Add" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        SelectCommand="SELECT * FROM [CLASS_CALENDAR]"></asp:SqlDataSource>
</asp:Content>

