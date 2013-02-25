<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="MaintinanceHome.aspx.cs" Inherits="Site_Maintinace_MaintinanceHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <p style="width: 618px; height: 263px">
        This is the main page for updating the main page.<br />
        <br />
        To add a new article, click the link below, if you have a picture that goes with 
        the article, add the article first, then add the picture and link it to the 
        article name.<br />
        <asp:HyperLink ID="HyperLink2" runat="server" 
            NavigateUrl="~/Site Maintinace/AddNews.aspx">Add Article</asp:HyperLink>
        <br />
        <br />
        Manage the front page by changing which already uploaded articles and pictures 
        are shown on it.&nbsp;
        <br />
        <asp:HyperLink ID="HyperLink3" runat="server" 
            NavigateUrl="~/Site Maintinace/ChangeNews.aspx">Manage Articles</asp:HyperLink>
        <br />
    </p>
</asp:Content>

