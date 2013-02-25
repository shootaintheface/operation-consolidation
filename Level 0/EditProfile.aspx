<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style8
        {
            width: 79px;
        }
        .style9
        {
            width: 100px;
        }
        .style10
        {
            width: 195px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table class="style1" style="width: 306%">
        <tr>
            <td>
                This is your Profile
                <asp:Label ID="lblLastName" runat="server"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblAccessLevel" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <table>
        <tr>
            <td class="style8" width="80px">
                    First Name</td>
            <td class="style10" width="201px">
                <asp:TextBox ID="txtFName" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td width="10px">
                &nbsp;</td>
            <td class="style9" width="100px">
                    Phone Number</td>
            <td width="201px">
                <asp:TextBox ID="txtPhone" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8" width="80px">
                    Last Name</td>
            <td class="style10" width="201px">
                <asp:TextBox ID="txtLName" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td width="10px">
                &nbsp;</td>
            <td class="style9" width="100px">
                    AKO Email</td>
            <td width="201px">
                <asp:TextBox ID="txtAKO" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8" width="80px">
                    Middle Initial</td>
            <td class="style10" width="201px">
                <asp:TextBox ID="txtMInitial" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td width="10px">
                &nbsp;</td>
            <td class="style9" width="100px">
                    School Email</td>
            <td width="201px">
                <asp:TextBox ID="txtSchool" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8" width="80px">
                &nbsp;</td>
            <td class="style10" width="201px">
                &nbsp;</td>
            <td width="10px">
                &nbsp;</td>
            <td class="style9" width="100px">
                &nbsp;</td>
            <td width="201px">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8" width="80px">
                &nbsp;</td>
            <td class="style10" width="201px">
                &nbsp;</td>
            <td width="10px">
                &nbsp;</td>
            <td class="style9" width="100px">
                &nbsp;</td>
            <td width="201px">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8" width="80px">
                    Street</td>
            <td class="style10" width="201px">
                <asp:TextBox ID="txtStreet" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td width="10px">
                &nbsp;</td>
            <td class="style9" width="100px">
                    Login ID</td>
            <td width="201px">
                <asp:TextBox ID="txtLoginID" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8" width="80px">
                    City</td>
            <td class="style10" width="201px">
                <asp:TextBox ID="txtCity" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td width="10px">
                &nbsp;</td>
            <td class="style9" width="100px">
                    Password</td>
            <td width="201px">
                <asp:TextBox ID="txtPass1" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8" width="80px">
                    State</td>
            <td class="style10" width="201px">
                <asp:TextBox ID="txtState" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td width="10px">
                &nbsp;</td>
            <td class="style9" width="100px">
                    Password</td>
            <td width="201px">
                <asp:TextBox ID="txtPass2" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8" width="80px">
                    Zip</td>
            <td class="style10" width="201px">
                <asp:TextBox ID="txtZip" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td width="10px">
                &nbsp;</td>
            <td class="style9" width="100px">
                    Graduation Date</td>
            <td width="201px" style="margin-left: 40px">
                <asp:TextBox ID="txtGradDate" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8" width="80px">
                    &nbsp;</td>
            <td class="style10" width="201px">
                <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                    Text="Submit Changes" />
            </td>
            <td width="10px">
                &nbsp;</td>
            <td class="style9" width="100px">
                    &nbsp;</td>
            <td width="201px" style="margin-left: 40px">
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="sqlProfile" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        SelectCommand="SELECT * FROM [CADET]"></asp:SqlDataSource>
    <br />
    </asp:Content>

