<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="AddNotes.aspx.cs" Inherits="Cadre_AddNotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table width="600px">
        <tr>
            <td>
                Type in text box and then hit add note to upload note to class</td>
            <td>
                <asp:Label ID="lblClass" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:TextBox ID="txtContent" runat="server" Height="135px" TextMode="MultiLine" 
        Width="622px"></asp:TextBox>
    <br />
    <asp:Button ID="btnAdd" runat="server" Text="Add Note" onclick="btnAdd_Click" />
    <br />
    <asp:Label ID="lblResult" runat="server"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        SelectCommand="SELECT [CLS_NAME] FROM [CLASS] WHERE ([CLS_ID] = @CLS_ID)">
        <SelectParameters>
            <asp:SessionParameter Name="CLS_ID" SessionField="cid" Type="Object" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

