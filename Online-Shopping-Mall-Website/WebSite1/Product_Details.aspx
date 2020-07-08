<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Product_Details.aspx.cs" Inherits="Product_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Back to Home page</asp:HyperLink>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [productID], [productName], [category], [price], [Image] FROM [Product] WHERE ([productID] = ?)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="productID" QueryStringField="productID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [color], [size] FROM [Product] WHERE ([productID] = ?)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="productID" QueryStringField="productID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="productID" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="productID" HeaderText="productID" InsertVisible="False" ReadOnly="True" SortExpression="productID" Visible="False" />
                    <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
                    <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:ImageField DataImageUrlField="Image" HeaderText="Image">
                    </asp:ImageField>
                </Fields>
            </asp:DetailsView>
            <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="color" HeaderText="color" SortExpression="color" />
                    <asp:BoundField DataField="size" HeaderText="size" SortExpression="size" />
                </Fields>
            </asp:DetailsView>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add to Shopping Cart" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Go to Shopping cart" />
        </div>
    </form>
</body>
</html>
