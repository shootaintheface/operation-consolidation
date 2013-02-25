<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="CadreClassList.aspx.cs" Inherits="Cadre_CadreClassList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table width="600px">
        <tr>
            <td>
                Look Up By Class</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="CLS_NAME" DataValueField="CLS_ID" 
                    Height="16px" Width="298px">
                </asp:DropDownList>
            &nbsp;
                <asp:Button ID="Button2" runat="server" Text="View" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="CDT_LNAME" HeaderText="Cadet Last Name" 
                SortExpression="CDT_LNAME" />
            <asp:BoundField DataField="CDT_FNAME" HeaderText="Cadet First Name" 
                SortExpression="CDT_FNAME" />
            <asp:BoundField DataField="CDT_EMAIL" HeaderText="Cadet Email" 
                SortExpression="CDT_EMAIL" />
            <asp:BoundField DataField="CDT_MSLEVEL" HeaderText="Cadet MS Level" 
                SortExpression="CDT_MSLEVEL" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
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
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        SelectCommand="SELECT CADET.CDT_LNAME, CADET.CDT_FNAME, CADET.CDT_EMAIL, CADET.CDT_MSLEVEL FROM CADET INNER JOIN CLASS_INSTANCE ON CADET.CDT_ID = CLASS_INSTANCE.CDT_ID WHERE (CLASS_INSTANCE.CLS_ID = @cID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="cID" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

