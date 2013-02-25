<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="AddOPORD.aspx.cs" Inherits="MSIII_AddOPORD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table style="width: 500px" >
        <tr>
            <td class="style7">
            </td>
            <td class="style7">
                Add to exsiting OPORD or create a new one</td>
            <td class="style7">
            </td>
        </tr>
        <tr>
            <td>
                Exsiting OPORD Name:</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="OP_NAME" DataValueField="OP_ID">
                </asp:DropDownList>
            &nbsp;<asp:Button ID="Button2" runat="server" Text="View" />
            </td>
            <td>
                <asp:Button ID="btnEdit" runat="server" Text="Add To Current Op" 
                    onclick="btnEdit_Click" />
            </td>
        </tr>
        <tr>
            <td>
                Create New Operation:</td>
            <td>
                <asp:Button ID="btnNew" runat="server" Text="New" 
                    PostBackUrl="~/MSIII/NewOp.aspx" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource2" Width="500px" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="CDT_LNAME" HeaderText="Creator" 
                SortExpression="CDT_LNAME" />
            <asp:BoundField DataField="BLOB_NAME" HeaderText="File Name" 
                SortExpression="BLOB_NAME" />
            <asp:BoundField DataField="BLOB_TYPE" HeaderText="File Extention" 
                SortExpression="BLOB_TYPE" />
            <asp:BoundField DataField="BLOB_ID" HeaderText="File Id" 
                SortExpression="BLOB_ID" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                        CommandName="Select" Text="Select" onclick="Button1_Click" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" />
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
    <asp:Label ID="lblResult" runat="server"></asp:Label>
    <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
        Text="Download" />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        
        SelectCommand="SELECT [OP_ID], [OP_NAME] FROM [OPORD] WHERE ([OP_LVL] = @OP_LVL)">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="OP_LVL" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        
        SelectCommand="SELECT CADET.CDT_LNAME, OPORD.OP_NAME, OP_BLOB.BLOB_NAME, OP_BLOB.BLOB_TYPE, OP_BLOB.BLOB_ID FROM CADET INNER JOIN OPORD ON CADET.CDT_ID = OPORD.CDT_ID INNER JOIN OP_BLOB ON OPORD.OP_ID = OP_BLOB.OP_ID WHERE (OPORD.OP_ID = @OPID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="OPID" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

