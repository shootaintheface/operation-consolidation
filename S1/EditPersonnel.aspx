<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="EditPersonnel.aspx.cs" Inherits="S1_EditPersonnel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style8
        {
            width: 79px;
        }
        .style10
        {
            width: 195px;
        }
        .style9
        {
            width: 100px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <br />
    <table>
        <tr>
            <td class="style8">
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
            <td class="style8">
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
            <td class="style8">
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
            <td class="style8">
                MS level</td>
            <td class="style10" width="201px">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="39px" 
                    RepeatDirection="Horizontal" Width="53px">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem Value="null">none</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td width="10px">
                &nbsp;</td>
            <td class="style9" width="100px">
                Rank/ Pos</td>
            <td width="201px">
                <asp:DropDownList ID="ddlRank" runat="server">
                    <asp:ListItem Value="E1">Private</asp:ListItem>
                    <asp:ListItem Value="E2">Private (2)</asp:ListItem>
                    <asp:ListItem Value="E3">Private First Class</asp:ListItem>
                    <asp:ListItem Value="E4">Specialist/ Cpl</asp:ListItem>
                    <asp:ListItem Value="E5">Sargent</asp:ListItem>
                    <asp:ListItem Value="E6">Staff Sargent</asp:ListItem>
                    <asp:ListItem Value="E7">Sargent First Class</asp:ListItem>
                    <asp:ListItem Value="E8">1Sgt/ MSgt</asp:ListItem>
                    <asp:ListItem Value="E9">Sargent Major</asp:ListItem>
                    <asp:ListItem Value="O1">2nd Lt</asp:ListItem>
                    <asp:ListItem Value="O2">1st Lt</asp:ListItem>
                    <asp:ListItem Value="O3">Captian</asp:ListItem>
                    <asp:ListItem Value="O4">Major</asp:ListItem>
                    <asp:ListItem Value="O5">Lt Colonel</asp:ListItem>
                    <asp:ListItem Value="O6">Colonel</asp:ListItem>
                </asp:DropDownList>
&nbsp;<asp:TextBox ID="txtPos" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8">
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
            <td class="style8">
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
            <td class="style8">
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
            <td class="style8">
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
            <td class="style8">
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
            <td class="style8">
                &nbsp;</td>
            <td class="style10" width="201px">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                    onclick="btnUpdate_Click" />
            &nbsp;
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Delete" />
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
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        SelectCommand="SELECT [CDT_ID], [CDT_LNAME] FROM [CADET]">
    </asp:SqlDataSource>
    <br />
</asp:Content>

