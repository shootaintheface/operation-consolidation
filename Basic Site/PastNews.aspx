<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="PastNews.aspx.cs" Inherits="Basic_Site_PastNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
        onitemdatabound="DataList1_ItemDataBound">
        <ItemTemplate>
            <table width="720px">
                <tr>
                    <td width="500px">
                        <asp:Label ID="STY_DATELabel" runat="server" 
                            Text='<%# Eval("STY_DATE", "{0:D}") %>' />
                    </td>
                    <td width="220px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="500px">
                        <asp:Label ID="STY_TITLELabel" runat="server" 
                            style="font-size: x-large; color: #0000FF" Text='<%# Eval("STY_TITLE") %>' />
                    </td>
                    <td width="220px">
                        <asp:Image ID="Image4" runat="server" Height="140px" Width="200px" />  
                    </td>
                </tr>
                <tr>
                    <td width="500px">
                        <asp:Label ID="STY_ARTICLELabel" runat="server" 
                            Text='<%# Eval("STY_ARTICLE") %>' />
                    </td>
                    <td style="text-align: center" width="220px">
                        <asp:Label ID="STY_CAPTIONLabel" runat="server" 
                            Text='<%# Eval("STY_CAPTION") %>' style="text-align: left" />
                    </td>
                </tr>
            </table>
            <br />
&nbsp;<asp:Label ID="lblimgID" runat="server" Text='<%# Eval("STY_ID") %>' 
                Visible="False" />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
<br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMain %>" 
        SelectCommand="SELECT [STY_CAPTION], [STY_PIC], [STY_TITLE], [STY_ARTICLE], [STY_DATE], [STY_ID] FROM [STORY] ORDER BY [STY_DATE] DESC"></asp:SqlDataSource>
    <br />
    </asp:Content>

