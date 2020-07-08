<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shopping_Cart.aspx.cs" Inherits="Shopping_Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <p>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Back to Home page</asp:HyperLink>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Shopping_Cart.productID, Product.productName, Product.price, Shopping_Cart.quantity FROM (Shopping_Cart INNER JOIN Product ON Shopping_Cart.productID = Product.productID) WHERE (Shopping_Cart.customerID = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="customerID" SessionField="visitorID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT sum(subtotal) FROM [Shopping_Cart] WHERE (customerID = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="customerID" SessionField="visitorID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="productID" HeaderText="productID" SortExpression="productID" />
                <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                <asp:HyperLinkField DataNavigateUrlFields="productID" DataNavigateUrlFormatString="Product_Details.aspx?productID={0}" HeaderText="Product details" Text="Product details" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="Expr1000" HeaderText="Total Amount" SortExpression="Expr1000" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Check out" OnClick="Button1_Click" />
        </p>
    </form>
</body>
</html>
