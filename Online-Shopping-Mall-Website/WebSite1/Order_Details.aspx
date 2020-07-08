<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order_Details.aspx.cs" Inherits="Order_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            order details page<br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Back to Home page</asp:HyperLink>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT POnumber, purchaseDate, shipmentDate, status FROM [Order] WHERE (customerID = ?) AND (POnumber = ?)">
                <SelectParameters>
                    <asp:SessionParameter Name="customerID" SessionField="visitorID" />
                    <asp:SessionParameter Name="POnumber" SessionField="POnumber" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Customer.firstName, Customer.lastName, Customer.address FROM Customer WHERE (Customer.customerID = ?)">
                <SelectParameters>
                    <asp:SessionParameter Name="customerID" SessionField="visitorID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Order_Details.productID, Product.productName, Order_Details.quantity, Order_Details.price, Order_Details.subTotal FROM (Order_Details INNER JOIN Product ON Order_Details.productID = Product.productID) WHERE (Order_Details.POnumber = ?)">
                <SelectParameters>
                    <asp:SessionParameter Name="POnumber" SessionField="POnumber" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                    <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                </Columns>
            </asp:GridView>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="POnumber">
                <Columns>
                    <asp:BoundField DataField="POnumber" HeaderText="POnumber" InsertVisible="False" SortExpression="POnumber" ReadOnly="True" />
                    <asp:BoundField DataField="purchaseDate" HeaderText="purchaseDate" SortExpression="purchaseDate" />
                    <asp:BoundField DataField="shipmentDate" HeaderText="shipmentDate" SortExpression="shipmentDate" />
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                </Columns>
            </asp:GridView>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:BoundField DataField="productID" HeaderText="productID" SortExpression="productID" Visible="False" />
                    <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="subTotal" HeaderText="subTotal" SortExpression="subTotal" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br />
            Total Amount: <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Purchase_Tracking.aspx">Purchase Tracking</asp:HyperLink>
            <br />
        </div>
    </form>
</body>
</html>
