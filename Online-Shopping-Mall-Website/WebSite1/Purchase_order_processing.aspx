<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Purchase_order_processing.aspx.cs" Inherits="Purchase_order_processing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Purchase Order Processing Page<br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Vender_Home.aspx">Back to Vender's Home page</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Purchase_Order_list.aspx">Back to purchase order list</asp:HyperLink>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Customer.firstName, Customer.lastName, Customer.address FROM Customer WHERE (Customer.customerID = ?)">
                <SelectParameters>
                    <asp:SessionParameter Name="customerID" SessionField="BuyerID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT POnumber, purchaseDate, shipmentDate, status FROM [Order] WHERE (customerID = ?) AND (POnumber = ?)">
                <SelectParameters>
                    <asp:SessionParameter Name="customerID" SessionField="BuyerID" />
                    <asp:SessionParameter Name="POnumber" SessionField="Purchase_POnumber" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Order_Details.productID, Product.productName, Order_Details.quantity, Order_Details.price, Order_Details.subTotal FROM (Order_Details INNER JOIN Product ON Order_Details.productID = Product.productID) WHERE (Order_Details.POnumber = ?)">
                <SelectParameters>
                    <asp:SessionParameter Name="POnumber" SessionField="Purchase_POnumber" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                    <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                </Columns>
            </asp:GridView>
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="POnumber" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="POnumber" HeaderText="POnumber" InsertVisible="False" ReadOnly="True" SortExpression="POnumber" />
                    <asp:BoundField DataField="purchaseDate" HeaderText="purchaseDate" SortExpression="purchaseDate" />
                    <asp:BoundField DataField="shipmentDate" HeaderText="shipmentDate" SortExpression="shipmentDate" />
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                </Columns>
            </asp:GridView>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:BoundField DataField="productID" HeaderText="productID" SortExpression="productID" />
                    <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="subTotal" HeaderText="subTotal" SortExpression="subTotal" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ship This Order" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
