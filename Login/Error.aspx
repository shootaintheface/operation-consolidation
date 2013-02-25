<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Login_Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <p class="style7" style="font-size: xx-large">
        ERROR 606: You do Not Have Permission to Access that Location!</p>
    <p class="style7" style="font-size: xx-large">
        <asp:HyperLink ID="HyperLink6" runat="server" 
            NavigateUrl="~/Basic Site/MainFront.aspx">Go Home</asp:HyperLink>
    </p>
</asp:Content>

