<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Purchase_Tracking.aspx.cs" Inherits="Purchase_Tracking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Purchase Tracking Page<br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Back to Home page</asp:HyperLink>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Order].POnumber, [Order].purchaseDate, SUM(Order_Details.subTotal), [Order].status FROM (Order_Details INNER JOIN [Order] ON Order_Details.POnumber = [Order].POnumber) WHERE ([Order].customerID = ?)  group by [Order].POnumber, [Order].purchaseDate, [Order].status ORDER BY [Order].POnumber DESC;">
                <SelectParameters>
                    <asp:SessionParameter Name="customerID" SessionField="visitorID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Order].POnumber, [Order].purchaseDate, SUM(Order_Details.subTotal), [Order].status FROM (Order_Details INNER JOIN [Order] ON Order_Details.POnumber = [Order].POnumber) WHERE ([Order].customerID = ?) AND ([Order].status = 'Pending' OR [Order].status = 'Hold' ) group by [Order].POnumber, [Order].purchaseDate, [Order].status ORDER BY [Order].purchaseDate DESC;">
                <SelectParameters>
                    <asp:SessionParameter Name="customerID" SessionField="visitorID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Order].POnumber, [Order].purchaseDate, SUM(Order_Details.subTotal), [Order].status FROM (Order_Details INNER JOIN [Order] ON Order_Details.POnumber = [Order].POnumber) WHERE ([Order].customerID = ?) AND ([Order].status = 'Shipped' OR [Order].status = 'Cancelled' ) group by [Order].POnumber, [Order].purchaseDate, [Order].status ORDER BY [Order].purchaseDate DESC;">
                <SelectParameters>
                    <asp:SessionParameter Name="customerID" SessionField="visitorID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            &nbsp;<br />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Current Purchases" Width="167px" />
            <br />
            <asp:Button ID="Button4" runat="server" Height="21px" OnClick="Button4_Click" Text="Past Purchases" Width="167px" />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Display All" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="POnumber">
                <Columns>
                    <asp:BoundField DataField="POnumber" HeaderText="POnumber" InsertVisible="False" SortExpression="POnumber" ReadOnly="True" />
                    <asp:BoundField DataField="purchaseDate" HeaderText="purchaseDate" SortExpression="purchaseDate" />
                    <asp:BoundField DataField="Expr1002" HeaderText="Total Amount" SortExpression="Expr1002" />
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                    <asp:HyperLinkField DataNavigateUrlFields="POnumber" DataNavigateUrlFormatString="Order_Details.aspx?POnumber={0}" HeaderText="Order details" Text="Order Details" />
                </Columns>
            </asp:GridView>
            &nbsp;<asp:Label ID="Label1" runat="server" Text="Label" Visible="False" EnableViewState="False"></asp:Label>
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
