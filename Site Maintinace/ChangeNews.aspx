<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="ChangeNews.aspx.cs" Inherits="ChangeNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
    {
        width: 284px;
    }
    .style8
    {
        table-layout: fixed;
        height: 89px;
        width: 533px;
    }
    .style9
    {
        width: 284px;
        height: 89px;
    }
    .style10
    {
        width: 533px;
    }
    .style11
    {
        width: 533px;
        height: 64px;
    }
    .style12
    {
        width: 284px;
        height: 64px;
    }
    .style13
    {
        font-size: large;
        color: #0000FF;
        text-align: center;
        text-decoration: underline;
    }
        .style14
        {
            width: 533px;
            height: 23px;
        }
        .style15
        {
            width: 284px;
            height: 23px;
        }
        .style16
        {
            width: 533px;
            height: 61px;
        }
        .style17
        {
            width: 284px;
            height: 61px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <p style="width: 500px; height: 48px" class="style13">
        This Page Is to add a picture and a Caption to the Home Page.</p>
<p style="width: 500px; height: 48px">
        Chose the news article Title from the drop down list and then click &quot;View News 
        Clip&quot; To preview the picture and the text that goes with it along with its 
        caption.</p>
<p style="width: 500px; height: 37px">
        <asp:DropDownList ID="ddlNews" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="STY_TITLE" 
            DataValueField="STY_ID">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="View News Clip" />
        <br />
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMain %>" 
            
            
            SelectCommand="SELECT * FROM [STORY] ORDER BY [STY_TITLE]" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringMain.ProviderName %>">
        </asp:SqlDataSource>
    </p>
    <table style="table-layout: fixed">
        <tr>
            <td class="style8" style="border-style: inset" >
                <asp:TextBox ID="txtArticle" runat="server" Height="140px" Width="517px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="style9" style="border-style: inset; margin-left: 80px;" >
                <asp:Image ID="picNewsSource" runat="server" Height="141px" 
                    ImageUrl="&quot;~/ImageHandler.ashx?imgID=&quot; + ddlNews.SelectedValue" 
                    Width="269px" />
                <br />
                <asp:Label ID="lblNewsSource" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style16" >
                Use the Browser to find the picture you want, The text box next to it will allow 
                you to enter the title of the picture. Type the caption in the Text Box 
                under it. Once you have completed that, Click the Submit button one time.</td>
            <td class="style17">
                If the Picture is assosiated with an event, upload the event first, then 
                assosiate this with the event title and CHECK THE BOX.</td>
        </tr>
        <tr>
            <td class="style10" >
                <asp:FileUpload ID="fuImage" runat="server" Width="218px" />
            &nbsp;&nbsp;
                Change Picture<br />
                Change Caption</td>
            <td class="style7">
&nbsp;&nbsp;
                </td>
        </tr>
        <tr>
            <td class="style11">
                <asp:TextBox ID="txtCaption" runat="server" Height="60px" Rows="3" 
                    TextMode="MultiLine" Width="503px"></asp:TextBox>
            </td>
            <td class="style12">
                <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                    Text="Submit" style="margin-left: 0px; margin-bottom: 0px" Width="62px" 
                    ValidationGroup="DB" />
            </td>
        </tr>
        <tr>
            <td class="style14">
                <asp:Label ID="lblResult" runat="server" Text="Result:" BackColor="#DBDBE8" 
                    ForeColor="Red"></asp:Label>
            </td>
            <td class="style15">
                </td>
        </tr>
    </table>
    <p>
        &nbsp;</p>
</asp:Content>

