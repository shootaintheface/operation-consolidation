<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="AddCalendarEvents.aspx.cs" Inherits="Cadre_AddCalendarEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            width: 39px;
        }
        .style8
        {
            height: 23px;
        }
        .style9
        {
            width: 39px;
            height: 23px;
        }
        .style10
        {
            height: 23px;
            width: 152px;
        }
        .style11
        {
            width: 152px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table width="600px">
        <tr>
            <td class="style10">
                Pick Class:</td>
            <td class="style9">
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="CLS_NAME" DataValueField="CLS_ID" 
                    Width="197px">
                </asp:DropDownList>
            </td>
            <td class="style8">
                <asp:Button ID="Button2" runat="server" Text="View" />
            </td>
        </tr>
        <tr>
            <td class="style11">
                Add Event:</td>
            <td class="style7">
                <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="Add" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None" Width="595px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="CCE_DATE" HeaderText="Event Date" 
                SortExpression="CCE_DATE" />
            <asp:BoundField DataField="CCE_CONTENT" HeaderText="Event Description" 
                SortExpression="CCE_CONTENT" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        SelectCommand="SELECT CCE_DATE, CCE_CONTENT FROM CLASS_CALENDAR WHERE (CLS_ID = @CLS)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="CLS" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        SelectCommand="SELECT [CLS_ID], [CLS_NAME] FROM [CLASS]">
    </asp:SqlDataSource>
    <br />
</asp:Content>

