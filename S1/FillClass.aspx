<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="FillClass.aspx.cs" Inherits="S1_FillClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            width: 51px;
        }
        .style8
        {
            width: 126px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table class="style1" width="400px">
        <tr>
            <td class="style8" width="200px">
                <asp:Label ID="Label1" runat="server" EnableTheming="True" 
                    Text="List of classes"></asp:Label>
            </td>
            <td class="style7" width="200px">
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="CLS_NAME" DataValueField="CLS_ID" 
                    Height="16px" Width="115px">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="CDT_ID" DataSourceID="SqlDataSource2" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" Width="400px">
        <Columns>
            <asp:BoundField DataField="CDT_ID" HeaderText="ID" ReadOnly="True" 
                SortExpression="CDT_ID" />
            <asp:BoundField DataField="CDT_FNAME" HeaderText="First" 
                SortExpression="CDT_FNAME" />
            <asp:BoundField DataField="CDT_LNAME" HeaderText="Last" 
                SortExpression="CDT_LNAME" />
            <asp:BoundField DataField="CDT_MSLEVEL" HeaderText="MS Level" 
                SortExpression="CDT_MSLEVEL" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                        CommandName="Select" onclick="Button1_Click" Text="Select" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Submit" />
    <br />
    <asp:Label ID="lblResult" runat="server"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        SelectCommand="SELECT [CLS_ID], [CLS_NAME] FROM [CLASS]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        SelectCommand="SELECT [CDT_ID], [CDT_FNAME], [CDT_LNAME], [CDT_MSLEVEL] FROM [CADET]">
    </asp:SqlDataSource>
</asp:Content>

