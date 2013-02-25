<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MasterPrintOutPage.aspx.cs" Inherits="S1_MasterPrintOutPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="CDT_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="CDT_ID" HeaderText="ID" ReadOnly="True" 
                    SortExpression="CDT_ID" />
                <asp:BoundField DataField="CDT_FNAME" HeaderText="First" 
                    SortExpression="CDT_FNAME" />
                <asp:BoundField DataField="CDT_LNAME" HeaderText="Last" 
                    SortExpression="CDT_LNAME" />
                <asp:BoundField DataField="CDT_MINITIAL" HeaderText="Initial" 
                    SortExpression="CDT_MINITIAL" />
                <asp:BoundField DataField="CDT_PHONE" HeaderText="Phone" 
                    SortExpression="CDT_PHONE" />
                <asp:BoundField DataField="CDT_EMAIL" HeaderText="Email" 
                    SortExpression="CDT_EMAIL" />
                <asp:BoundField DataField="CDT_AKO" HeaderText="AKO" SortExpression="CDT_AKO" />
                <asp:BoundField DataField="CDT_STREET" HeaderText="Street" 
                    SortExpression="CDT_STREET" />
                <asp:BoundField DataField="CDT_CITY" HeaderText="City" 
                    SortExpression="CDT_CITY" />
                <asp:BoundField DataField="CDT_STATE" HeaderText="State" 
                    SortExpression="CDT_STATE" />
                <asp:BoundField DataField="CDT_ZIP" HeaderText="Zip" SortExpression="CDT_ZIP" />
                <asp:BoundField DataField="CDT_GRADDATE" HeaderText="Graduation" 
                    SortExpression="CDT_GRADDATE" />
                <asp:BoundField DataField="CDT_MSLEVEL" HeaderText="MS Lvl" 
                    SortExpression="CDT_MSLEVEL" />
                <asp:BoundField DataField="CDT_PASS" HeaderText="Password" 
                    SortExpression="CDT_PASS" />
                <asp:BoundField DataField="CDT_LOGIN" HeaderText="Login" 
                    SortExpression="CDT_LOGIN" />
                <asp:BoundField DataField="CDT_AUTH" HeaderText="Access Lvl" 
                    SortExpression="CDT_AUTH" />
                <asp:BoundField DataField="CDT_RANK" HeaderText="Rank" 
                    SortExpression="CDT_RANK" />
                <asp:BoundField DataField="CDT_POS" HeaderText="Position" 
                    SortExpression="CDT_POS" />
            </Columns>
        </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        SelectCommand="SELECT * FROM [CADET] ORDER BY [CDT_LNAME]">
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnExport" runat="server" onclick="btnExport_Click" 
        Text="Export to Excel" />
    </form>
</body>
</html>
