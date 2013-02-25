<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFrontPage.master" AutoEventWireup="true" CodeFile="ManagePersonnel.aspx.cs" Inherits="S1_ManagePersonnel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontEndPlaceHoder" Runat="Server">
    <p style="width: 270px; text-align: left;">
        Print Master List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink6" runat="server" 
            NavigateUrl="~/S1/MasterPrintOutPage.aspx" Target="_blank">Print to Excel</asp:HyperLink>
    </p>
    <p style="margin-left: 160px">
        Cadets<br />
    </p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None" onselectedindexchanged="GridView1_SelectedIndexChanged1" 
        DataKeyNames="CDT_ID">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="CDT_MSLEVEL" HeaderText="MS Level" 
                SortExpression="CDT_MSLEVEL" />
            <asp:BoundField DataField="CDT_FNAME" HeaderText="First" 
                SortExpression="CDT_FNAME" />
            <asp:BoundField DataField="CDT_LNAME" HeaderText="Last" 
                SortExpression="CDT_LNAME" />
            <asp:BoundField DataField="CDT_MINITIAL" HeaderText="Middle" 
                SortExpression="CDT_MINITIAL" />
            <asp:BoundField DataField="CDT_PHONE" HeaderText="Phone" 
                SortExpression="CDT_PHONE" />
            <asp:BoundField DataField="CDT_EMAIL" HeaderText="Email" 
                SortExpression="CDT_EMAIL" />
            <asp:BoundField DataField="CDT_AKO" HeaderText="AKO" 
                SortExpression="CDT_AKO" />
            <asp:BoundField DataField="CDT_AUTH" HeaderText="Access Level" 
                SortExpression="CDT_AUTH" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" Text="Select"></asp:LinkButton>
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
        
        
        SelectCommand="SELECT [CDT_FNAME], [CDT_LNAME], [CDT_MINITIAL], [CDT_PHONE], [CDT_EMAIL], [CDT_AKO], [CDT_MSLEVEL], [CDT_AUTH], [CDT_ID] FROM [CADET] ORDER BY [CDT_MSLEVEL], [CDT_LNAME]" 
        DeleteCommand="DELETE FROM [CADET] WHERE [CDT_ID] = @CDT_ID" 
        InsertCommand="INSERT INTO [CADET] ([CDT_FNAME], [CDT_LNAME], [CDT_MINITIAL], [CDT_PHONE], [CDT_EMAIL], [CDT_AKO], [CDT_MSLEVEL], [CDT_AUTH], [CDT_ID]) VALUES (@CDT_FNAME, @CDT_LNAME, @CDT_MINITIAL, @CDT_PHONE, @CDT_EMAIL, @CDT_AKO, @CDT_MSLEVEL, @CDT_AUTH, @CDT_ID)" 
        
        UpdateCommand="UPDATE [CADET] SET [CDT_FNAME] = @CDT_FNAME, [CDT_LNAME] = @CDT_LNAME, [CDT_MINITIAL] = @CDT_MINITIAL, [CDT_PHONE] = @CDT_PHONE, [CDT_EMAIL] = @CDT_EMAIL, [CDT_AKO] = @CDT_AKO, [CDT_MSLEVEL] = @CDT_MSLEVEL, [CDT_AUTH] = @CDT_AUTH WHERE [CDT_ID] = @CDT_ID">
        <DeleteParameters>
            <asp:Parameter Name="CDT_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CDT_FNAME" Type="String" />
            <asp:Parameter Name="CDT_LNAME" Type="String" />
            <asp:Parameter Name="CDT_MINITIAL" Type="String" />
            <asp:Parameter Name="CDT_PHONE" Type="String" />
            <asp:Parameter Name="CDT_EMAIL" Type="String" />
            <asp:Parameter Name="CDT_AKO" Type="String" />
            <asp:Parameter Name="CDT_MSLEVEL" Type="String" />
            <asp:Parameter Name="CDT_AUTH" Type="String" />
            <asp:Parameter Name="CDT_ID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CDT_FNAME" Type="String" />
            <asp:Parameter Name="CDT_LNAME" Type="String" />
            <asp:Parameter Name="CDT_MINITIAL" Type="String" />
            <asp:Parameter Name="CDT_PHONE" Type="String" />
            <asp:Parameter Name="CDT_EMAIL" Type="String" />
            <asp:Parameter Name="CDT_AKO" Type="String" />
            <asp:Parameter Name="CDT_MSLEVEL" Type="String" />
            <asp:Parameter Name="CDT_AUTH" Type="String" />
            <asp:Parameter Name="CDT_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblTest" runat="server" Text="TEST"></asp:Label>
    &nbsp;<p style="margin-left: 160px">
        Cadre<br />
    </p>
    &nbsp;<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" 
        GridLines="None" DataKeyNames="CDR_ID" 
        onselectedindexchanged="GridView2_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="CDR_FNAME" HeaderText="First" 
                SortExpression="CDR_FNAME" />
            <asp:BoundField DataField="CDR_LNAME" HeaderText="Last" 
                SortExpression="CDR_LNAME" />
            <asp:BoundField DataField="CDR_MINITIAL" HeaderText="Middle" 
                SortExpression="CDR_MINITIAL" />
            <asp:BoundField DataField="CDR_PNUMBER" HeaderText="Phone" 
                SortExpression="CDR_PNUMBER" />
            <asp:BoundField DataField="CDR_EMAIL" HeaderText="Email" 
                SortExpression="CDR_EMAIL" />
            <asp:BoundField DataField="CDR_AKO" HeaderText="AKO" SortExpression="CDR_AKO" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" Text="Select"></asp:LinkButton>
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
&nbsp;&nbsp;
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlueConnect %>" 
        
        
        SelectCommand="SELECT [CDR_FNAME], [CDR_LNAME], [CDR_MINITIAL], [CDR_PNUMBER], [CDR_EMAIL], [CDR_AKO], [CDR_ID] FROM [CADRE]" 
        DeleteCommand="DELETE FROM [CADRE] WHERE [CDR_ID] = @CDR_ID" 
        InsertCommand="INSERT INTO [CADRE] ([CDR_FNAME], [CDR_LNAME], [CDR_MINITIAL], [CDR_PNUMBER], [CDR_EMAIL], [CDR_AKO], [CDR_ID]) VALUES (@CDR_FNAME, @CDR_LNAME, @CDR_MINITIAL, @CDR_PNUMBER, @CDR_EMAIL, @CDR_AKO, @CDR_ID)" 
        UpdateCommand="UPDATE [CADRE] SET [CDR_FNAME] = @CDR_FNAME, [CDR_LNAME] = @CDR_LNAME, [CDR_MINITIAL] = @CDR_MINITIAL, [CDR_PNUMBER] = @CDR_PNUMBER, [CDR_EMAIL] = @CDR_EMAIL, [CDR_AKO] = @CDR_AKO WHERE [CDR_ID] = @CDR_ID">
        <DeleteParameters>
            <asp:Parameter Name="CDR_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CDR_FNAME" Type="String" />
            <asp:Parameter Name="CDR_LNAME" Type="String" />
            <asp:Parameter Name="CDR_MINITIAL" Type="String" />
            <asp:Parameter Name="CDR_PNUMBER" Type="String" />
            <asp:Parameter Name="CDR_EMAIL" Type="String" />
            <asp:Parameter Name="CDR_AKO" Type="String" />
            <asp:Parameter Name="CDR_ID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CDR_FNAME" Type="String" />
            <asp:Parameter Name="CDR_LNAME" Type="String" />
            <asp:Parameter Name="CDR_MINITIAL" Type="String" />
            <asp:Parameter Name="CDR_PNUMBER" Type="String" />
            <asp:Parameter Name="CDR_EMAIL" Type="String" />
            <asp:Parameter Name="CDR_AKO" Type="String" />
            <asp:Parameter Name="CDR_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

