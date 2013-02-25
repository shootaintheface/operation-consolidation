<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="TAC.aspx.cs" Inherits="MSIV_TAC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <asp:HyperLink ID="HyperLink6" runat="server" 
        NavigateUrl="~/MSIV/TACClassList.aspx">Class List</asp:HyperLink>
    <br />
    <asp:HyperLink ID="HyperLink7" runat="server" 
        NavigateUrl="~/MSIV/TACClassNotes.aspx">Class Notes</asp:HyperLink>
    <br />
    <asp:HyperLink ID="HyperLink8" runat="server" 
        NavigateUrl="~/MSIV/TACClassCalendar.aspx">Class Calendar</asp:HyperLink>
</asp:Content>

