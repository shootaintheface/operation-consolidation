<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="AddClass.aspx.cs" Inherits="S1_AddClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            width: 118px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table class="style1" style="width: 333%">
        <tr>
            <td class="style7">
                <asp:Label ID="Label1" runat="server" Text="Pick Instructor"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlCDR" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="CDR_LNAME" DataValueField="CDR_ID" style="margin-left: 7px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Course Name</td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style7">
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Add" />
            </td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
                    SelectCommand="SELECT [CDR_ID], [CDR_LNAME] FROM [CADRE]">
                </asp:SqlDataSource>
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

