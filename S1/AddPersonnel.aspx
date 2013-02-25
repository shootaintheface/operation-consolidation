<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="AddPersonnel.aspx.cs" Inherits="S1_AddPersonnel" %>

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
        .style11
        {
            width: 10px;
        }
        .style12
        {
            width: 79px;
            height: 26px;
        }
        .style13
        {
            width: 195px;
            height: 26px;
        }
        .style14
        {
            width: 10px;
            height: 26px;
        }
        .style15
        {
            width: 100px;
            height: 26px;
        }
        .style16
        {
            height: 26px;
        }
        .style17
        {
            width: 79px;
            height: 23px;
        }
        .style18
        {
            width: 195px;
            height: 23px;
        }
        .style19
        {
            width: 10px;
            height: 23px;
        }
        .style20
        {
            width: 100px;
            height: 23px;
        }
        .style21
        {
            height: 23px;
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
            <td class="style11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtFName" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="style9" width="100px">
                    Phone Number</td>
            <td width="201px">
                <asp:TextBox ID="txtPhone" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtPhone" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                    Last Name</td>
            <td class="style10" width="201px">
                <asp:TextBox ID="txtLName" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtLName" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="style9" width="100px">
                    AKO Email</td>
            <td width="201px">
                <asp:TextBox ID="txtAKO" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtAKO" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                    Middle Initial</td>
            <td class="style10" width="201px">
                <asp:TextBox ID="txtMInitial" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtMInitial" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="style9" width="100px">
                    School Email</td>
            <td width="201px">
                <asp:TextBox ID="txtSchool" runat="server" Width="200px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtSchool" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                MS Level</td>
            <td class="style10" width="201px">
                <asp:RadioButtonList ID="rdlMSLvl" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1"></asp:ListItem>
                    <asp:ListItem Value="2"></asp:ListItem>
                    <asp:ListItem Value="3"></asp:ListItem>
                    <asp:ListItem Value="4"></asp:ListItem>
                    <asp:ListItem Value="5"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style11">
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
            <td class="style11">
                &nbsp;</td>
            <td class="style9" width="100px">
                &nbsp;</td>
            <td width="201px">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style12">
                    Access Level 0 - 7</td>
            <td class="style13" width="201px">
                <asp:TextBox ID="txtAccessLevel" runat="server" Width="203px"></asp:TextBox>
            </td>
            <td class="style14">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtAccessLevel" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            <td class="style15" width="100px">
                    Login ID</td>
            <td width="201px" class="style16">
                <asp:TextBox ID="txtLoginID" runat="server" Width="200px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtLoginID" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                    &nbsp;</td>
            <td class="style10" width="201px" rowspan="2">
                <asp:RadioButton ID="rbCadet" runat="server" GroupName="A" Text="Cadet" />
                <br />
                <asp:RadioButton ID="rbCadre" runat="server" GroupName="A" Text="Cadre" />
            </td>
            <td class="style11">
                &nbsp;</td>
            <td class="style9" width="100px">
                    &nbsp;</td>
            <td width="201px">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                    &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td class="style9" width="100px">
                    &nbsp;</td>
            <td width="201px">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style17">
                    </td>
            <td class="style18" width="201px">
                <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="Add" />
            </td>
            <td class="style19">
                </td>
            <td class="style20" width="100px">
                    </td>
            <td width="201px" style="margin-left: 40px" class="style21">
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style10" width="201px">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td class="style9" width="100px">
                &nbsp;</td>
            <td width="201px" style="margin-left: 40px">
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        SelectCommand="SELECT [CDT_ID], [CDT_LNAME] FROM [CADET]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        SelectCommand="SELECT [CDR_ID], [CDR_LNAME] FROM [CADRE]"></asp:SqlDataSource>
    <br />
</asp:Content>

