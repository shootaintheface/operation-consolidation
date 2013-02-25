<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="CadreAddNotes.aspx.cs" Inherits="Cadre_CadreAddNotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table width="600px">
        <tr>
            <td class="style7">
                Look Up Notes By Class</td>
            <td class="style7">
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="CLS_NAME" DataValueField="CLS_ID" 
                    Height="22px" Width="194px">
                </asp:DropDownList>
            </td>
            <td class="style7">
                <asp:Button ID="Button2" runat="server" Text="View" />
            </td>
        </tr>
        <tr>
            <td>
                Create a New Note for Current Class:</td>
            <td>
                <asp:Button ID="Button3" runat="server" Text="New" onclick="Button3_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" 
        GridLines="None" Width="584px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="CNO_CONTENT" HeaderText="Content" 
                SortExpression="CNO_CONTENT">
            <ControlStyle Width="400px" />
            </asp:BoundField>
            <asp:BoundField DataField="CNO_DATE" HeaderText="Date Added" 
                SortExpression="CNO_DATE" />
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
        SelectCommand="SELECT [CLS_ID], [CLS_NAME] FROM [CLASS]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        SelectCommand="SELECT CNO_CONTENT, CNO_DATE FROM CLASS_NOTES WHERE (CLS_ID = @cID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="cID" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

