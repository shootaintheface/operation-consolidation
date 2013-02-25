<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="BackDoor.aspx.cs" Inherits="BackDoor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style8
        {
            height: 23px;
            width: 100px;
        }
        .style9
        {
            width: 100px;
        }
        .style10
        {
            width: 10px;
        }
        .style12
    {
        height: 42px;
    }
    .style13
    {
        width: 100px;
        height: 42px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table width="750px">
        <tr>
            <td rowspan="2" class="style9">
                <asp:Button ID="btnProfile" runat="server" Text="Profile" 
                        PostBackUrl="~/Level 0/EditProfile.aspx" Width="77px" />
            </td>
            <td width="75px" >
            </td>
            <td class="style8" width="250px">
                <asp:HyperLink ID="HyperLink2" runat="server" 
                    NavigateUrl="~/S1/S1Home.aspx">S1: Personnel</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td width="75px" >
                <asp:Button ID="Button2" runat="server" Text="BN Calendar" 
                    PostBackUrl="~/Level 0/BNCalendar.aspx" Visible="False" />
            </td>
            <td class="style8" width="250px">
                <asp:HyperLink ID="HyperLink3" runat="server" 
                    NavigateUrl="~/MSIV/MSIVHome.aspx">MSIV</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td rowspan="2" class="style9">
                <asp:Button ID="btnCalendar" runat="server" Text="Calendar" 
                        PostBackUrl="~/Level 0/Calendar.aspx" />
            </td>
            <td width="75px" >
                &nbsp;</td>
            <td class="style9" width="250px">
                <asp:HyperLink ID="HyperLink4" runat="server" 
                    NavigateUrl="~/MSIII/MSIIIHome.aspx">MSIII</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="style10" width="75px">
                <asp:Button ID="Button3" runat="server" Text="Published OPORDs" 
                    PostBackUrl="~/Level 0/PublishedOPORDs.aspx"/>
            </td>
            <td class="style9" width="250px">
                <asp:HyperLink ID="HyperLink5" runat="server" 
                    NavigateUrl="~/Cadre/CadreHome.aspx">Cadre</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td rowspan="2" class="style9">
                <asp:Button ID="btnClass" runat="server" Text="Class" 
                        PostBackUrl="~/Level 0/Class.aspx" Width="77px" />
            </td>
            <td width="75px" class="style12" >
                </td>
            <td class="style13" width="250px">
                <asp:HyperLink ID="HyperLink6" runat="server" 
                        NavigateUrl="~/Site Maintinace/MaintinanceHome.aspx">S5: Public Affairs</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td width="75px" >
                &nbsp;</td>
            <td class="style9" width="250px">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

