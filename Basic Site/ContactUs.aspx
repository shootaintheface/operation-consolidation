<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            width: 176px;
        }
        .style8
        {
            width: 270px;
            font-style: italic;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <p style="width: 648px">
        This is the Contact Page.</p>
    <table class="style1" style="width: 572%">
        <tr>
            <td class="style7">
                Phone:</td>
            <td class="style8">
                615-898-2470</td>
            <td rowspan="5">
                <asp:ImageButton ID="ImageButton1" runat="server" BorderStyle="Solid" 
                    Height="383px" ImageUrl="~/Images/forrest Hall.jpg" Width="409px" />
            </td>
        </tr>
        <tr>
            <td class="style7">
                Email:</td>
            <td class="style8">
                <a href="mailto:arotc@mtsu.edu">arotc@mtsu.edu</a></td>
        </tr>
        <tr>
            <td class="style7">
                Fax:</td>
            <td class="style8">
                TBD</td>
        </tr>
        <tr>
            <td class="style7">
                Address:</td>
            <td class="style8">
                <span class="pp-headline-item pp-headline-address" dir="ltr"><span>Middle 
                Tennessee State University, Murfreesboro, TN 37130</span></span></td>
        </tr>
        <tr>
            <td class="style7">
                Hours of Operation:</td>
            <td class="style8">
                0600 - 1700 Monday - Friday</td>
        </tr>
    </table>
    <p>
    </p>
</asp:Content>

