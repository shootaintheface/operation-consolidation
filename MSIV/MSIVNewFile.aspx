<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="MSIVNewFile.aspx.cs" Inherits="MSIV_MSIVNewFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


        .style7
        {
            height: 23px;
            width: 87px;
        }
        .style16
        {
            width: 172px;
            height: 23px;
        }
        .style8
        {
            height: 23px;
            width: 10px;
        }
        .style12
        {
            width: 87px;
        }
        .style15
        {
            width: 172px;
        }
        .style9
        {
            width: 10px;
        }
        .style10
        {
            height: 26px;
            width: 87px;
        }
        .style14
        {
            width: 172px;
            height: 26px;
        }
        .style11
        {
            width: 10px;
            height: 26px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table style="width: 500px">
        <tr>
            <td class="style7">
            </td>
            <td class="style16">
                Add New Operation Order</td>
            <td class="style8">
            </td>
        </tr>
        <tr>
            <td class="style12">
                Operation Name</td>
            <td class="style15">
                <asp:Label ID="lblOpName" runat="server"></asp:Label>
            </td>
            <td class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                File Name</td>
            <td class="style14">
                <asp:TextBox ID="txtBlobName" runat="server"></asp:TextBox>
            </td>
            <td class="style11">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style12">
                File Type (ex: .xls, .doc, .ppt)</td>
            <td class="style15">
                <asp:TextBox ID="txtFileType" runat="server"></asp:TextBox>
            </td>
            <td class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style12">
                Upload File</td>
            <td class="style15">
                <asp:FileUpload ID="UploadFile" runat="server" />
            </td>
            <td class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style12">
                Upload</td>
            <td class="style15">
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Upload" />
            </td>
            <td class="style9">
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        SelectCommand="SELECT [OP_ID], [OP_NAME] FROM [OPORD]"></asp:SqlDataSource>
</asp:Content>

