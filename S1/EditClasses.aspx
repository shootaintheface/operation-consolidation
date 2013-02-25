<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="EditClasses.aspx.cs" Inherits="S1_EditClasses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" CellPadding="4" DataKeyNames="CDT_ID" 
        ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="CDR_LNAME" HeaderText="Instructor" 
                SortExpression="CDR_LNAME" />
            <asp:BoundField DataField="CLS_NAME" HeaderText="Class" 
                SortExpression="CLS_NAME" />
            <asp:BoundField DataField="CDT_LNAME" HeaderText="Cadet Last Name" 
                SortExpression="CDT_LNAME" />
            <asp:BoundField DataField="CDT_FNAME" HeaderText="Cadet First Name" 
                SortExpression="CDT_FNAME" />
            <asp:BoundField DataField="CDT_ID" HeaderText="Cadet ID" ReadOnly="True" 
                SortExpression="CDT_ID" />
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
    <br />
    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Delete" />
&nbsp;
    <asp:Label ID="lblResult" runat="server"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        SelectCommand="SELECT CADRE.CDR_LNAME, CLASS.CLS_NAME, CADET.CDT_LNAME, CADET.CDT_FNAME, CADET.CDT_ID FROM CADET INNER JOIN CLASS_INSTANCE ON CADET.CDT_ID = CLASS_INSTANCE.CDT_ID INNER JOIN CLASS ON CLASS_INSTANCE.CLS_ID = CLASS.CLS_ID INNER JOIN CADRE ON CLASS.CDR_ID = CADRE.CDR_ID ORDER BY CLASS.CLS_NAME, CADET.CDT_LNAME">
    </asp:SqlDataSource>
    <br />
    </asp:Content>

