<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style7
    {
        width: 88px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <p style="width: 595px; height: 178px">
    <table class="style1">
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td>
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style7">
                <asp:Label ID="Label1" runat="server" Text="Login:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLogin" runat="server"></asp:TextBox>
            &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtLogin" ErrorMessage="Please enter your username"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtPassword" ErrorMessage="Please enter your password"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                <asp:CheckBox ID="chkCadet" runat="server" Text="Cadet" />
            </td>
            <td>
                <asp:CheckBox ID="chkCadre" runat="server" Text="Cadre" />
            </td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Login" />
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="sqlLoginDB" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        SelectCommand="SELECT [CDT_LNAME], [CDT_FNAME], [CDT_LOGIN], [CDT_PASS] FROM [CADET]">
    </asp:SqlDataSource>
    <br />
</p>
</asp:Content>

