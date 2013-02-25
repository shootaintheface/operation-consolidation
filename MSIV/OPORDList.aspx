<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="OPORDList.aspx.cs" Inherits="MSIV_OPORDList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" Width="720px" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="OP_NAME" HeaderText="Operation" 
                SortExpression="OP_NAME" />
            <asp:BoundField DataField="OP_DATE" HeaderText="Date" 
                SortExpression="OP_DATE" />
            <asp:BoundField DataField="CDT_LNAME" HeaderText="Creator" 
                SortExpression="CDT_LNAME" />
            <asp:BoundField DataField="BLOB_NAME" HeaderText="File Name" 
                SortExpression="BLOB_NAME" />
            <asp:TemplateField HeaderText="ID" SortExpression="BLOB_ID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BLOB_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("BLOB_ID") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="1px" />
            </asp:TemplateField>
            <asp:BoundField DataField="OP_PUBLISH" HeaderText="Is Published" 
                SortExpression="OP_PUBLISH" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <asp:Label ID="lblResult" runat="server"></asp:Label>
    <br />
    <br />
    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
        Text="Download" />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        
        
        SelectCommand="SELECT OPORD.OP_NAME, OPORD.OP_DATE, CADET.CDT_LNAME, OP_BLOB.BLOB_NAME, OP_BLOB.BLOB_ID, OPORD.OP_PUBLISH FROM OPORD INNER JOIN OP_BLOB ON OPORD.OP_ID = OP_BLOB.OP_ID INNER JOIN CADET ON OPORD.CDT_ID = CADET.CDT_ID ORDER BY OPORD.OP_NAME">
    </asp:SqlDataSource>
</asp:Content>

