<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="PublishedOPORDs.aspx.cs" Inherits="Level_0_PublishedOPORDs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            height: 23px;
            text-align: center;
        }
        .style8
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <table width="720px">
        <tr>
            <td class="style7">
                <span class="style8">List of OPORDs</span><br />
            </td>
        </tr>
        <tr>
            <td>
                1. Select the operation order.<br />
                2. Press the &quot;Refresh&quot; Button to populate the files.<br />
                3. Press the &quot;Select&quot; Button of the file you wish to download.<br />
                4. Press the &quot;Download&quot; Button to download the file.<br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sqlDSOrder" 
                    DataTextField="OP_NAME" DataValueField="OP_ID" Width="200px">
                </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Text="Refresh" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqlDSOrder" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
                    SelectCommand="SELECT [OP_ID], [OP_NAME] FROM [OPORD]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="sqlDSFile" ForeColor="#333333" GridLines="None" 
                    onselectedindexchanged="GridView2_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="BLOB_NAME" HeaderText="File Name" 
                            SortExpression="BLOB_NAME" />
                        <asp:BoundField DataField="BLOB_TYPE" HeaderText="File Type" 
                            SortExpression="BLOB_TYPE" />
                        <asp:BoundField DataField="BLOB_ID" HeaderText="File ID" 
                            SortExpression="BLOB_ID" />
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
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
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqlDSFile" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
                    SelectCommand="SELECT OP_BLOB.BLOB_NAME, OP_BLOB.BLOB_TYPE, OP_BLOB.BLOB_ID FROM OPORD INNER JOIN OP_BLOB ON OPORD.OP_ID = OP_BLOB.OP_ID WHERE (OPORD.OP_ID = @opid)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="opid" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                    Text="Download" />
&nbsp;
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

