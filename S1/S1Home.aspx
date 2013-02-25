<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="S1Home.aspx.cs" Inherits="S1_S1Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <p style="margin-left: 160px; width: 328px;">
        Personnel Management</p>
    <table width="400px">
        <tr>
            <td >
    <asp:HyperLink ID="HyperLink6" runat="server" 
        NavigateUrl="~/S1/ManagePersonnel.aspx">Manage Personnel</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/S1/AddClass.aspx">Add Classes</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td >
    <asp:HyperLink ID="HyperLink7" runat="server" 
        NavigateUrl="~/S1/AddPersonnel.aspx">Add Personnel</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink10" runat="server" 
                    NavigateUrl="~/S1/EditClasses.aspx">Edit Classes</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td >
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                    Text="Bulk Personnel Add" />
            </td>
            <td>
                <asp:HyperLink ID="HyperLink11" runat="server" 
                    NavigateUrl="~/S1/FillClass.aspx">Fill Classes</asp:HyperLink>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    </asp:Content>

