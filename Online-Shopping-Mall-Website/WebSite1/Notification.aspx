<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Notification.aspx.cs" Inherits="Notification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Back to Home page</asp:HyperLink>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" ForeColor="#00CC00" Text="Unread Notification:"></asp:Label>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="POnumber" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="POnumber" HeaderText="POnumber" ReadOnly="True" SortExpression="POnumber" />
                    <asp:BoundField DataField="customerID" HeaderText="customerID" SortExpression="customerID" />
                    <asp:BoundField DataField="fullname" HeaderText="fullname" SortExpression="fullname" />
                    <asp:BoundField DataField="message" HeaderText="message" SortExpression="message" />
                    <asp:BoundField DataField="read" HeaderText="read" SortExpression="read" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="height: 26px" Text="read all" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" ForeColor="Black" Text="Read Notification:"></asp:Label>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [POnumber], [customerID], [fullname], [message], [read] FROM [Notification] WHERE (([read] = ?) AND ([customerID] = ?))">
            <SelectParameters>
                <asp:Parameter DefaultValue="No" Name="read" />
                <asp:SessionParameter DefaultValue="" Name="customerID" SessionField="visitorID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [POnumber], [customerID], [fullname], [message], [read] FROM [Notification] WHERE (([read] = ?) AND ([customerID] = ?))">
            <SelectParameters>
                <asp:Parameter DefaultValue="Yes" Name="read" />
                <asp:SessionParameter DefaultValue="" Name="customerID" SessionField="visitorID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="POnumber" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="POnumber" HeaderText="POnumber" ReadOnly="True" SortExpression="POnumber" />
                <asp:BoundField DataField="customerID" HeaderText="customerID" SortExpression="customerID" />
                <asp:BoundField DataField="fullname" HeaderText="fullname" SortExpression="fullname" />
                <asp:BoundField DataField="message" HeaderText="message" SortExpression="message" />
                <asp:BoundField DataField="read" HeaderText="read" SortExpression="read" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
