<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="Class.aspx.cs" Inherits="_Class" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <p style="width: 397px">
        &nbsp;<asp:DataList ID="DataList1" runat="server" CellPadding="4" 
        DataKeyField="CDT_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        RepeatLayout="Flow" Width="600px">
        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <ItemTemplate>
            Date Created:
            <asp:Label ID="CNO_DATELabel" runat="server" Text='<%# Eval("CNO_DATE") %>' />
            <br />
            Task:
            <asp:Label ID="CNO_CONTENTLabel" runat="server" 
                Text='<%# Eval("CNO_CONTENT") %>' />
            <br />
            &nbsp;<br />
<br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
    </p>
    <p style="width: 397px">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
            SelectCommand="SELECT CLASS_NOTES.CNO_CONTENT, CLASS_NOTES.CNO_DATE, CADET.CDT_ID FROM CLASS_NOTES INNER JOIN CLASS_INSTANCE ON CLASS_NOTES.CLS_ID = CLASS_INSTANCE.CLS_ID INNER JOIN CADET ON CLASS_INSTANCE.CDT_ID = CADET.CDT_ID WHERE (CADET.CDT_ID = @cID)">
            <SelectParameters>
                <asp:SessionParameter Name="cID" SessionField="id" DbType="Guid" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

