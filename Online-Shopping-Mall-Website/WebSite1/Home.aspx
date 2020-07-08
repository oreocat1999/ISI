<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbWelcome" runat="server" ForeColor="Blue" Text="Label" Visible="False"></asp:Label>
            <asp:Button ID="btlogin" runat="server" onclick="Button1_Click" Text="Login" style="width: 47px" />
            <asp:Button ID="btlogout" runat="server" Text="Logout" OnClick="btlogout_Click" Visible="False" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Notification.aspx">Notification</asp:HyperLink>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Change_Password.aspx">Change Password</asp:HyperLink>
            <br />
            <br />
            <asp:Button ID="btShopCart" runat="server" OnClick="btShopCart_Click" Text="Shopping Cart" />
            <br />
            <br />
            <asp:Button ID="ptbutton" runat="server" OnClick="Button2_Click" Text="Purchase Tracking" Width="154px" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [productName], [category], [price], [Image], [productID] FROM [Product]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [productID], [productName], [category], [price], [Image] FROM [Product] WHERE ([category] = &quot;Skirt&quot;)">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [productID], [productName], [category], [price], [Image] FROM [Product] WHERE ([category] = &quot;T-shirt&quot;)"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [productID], [productName], [category], [price], [Image] FROM [Product] WHERE ([category] = &quot;Jeans&quot;)"></asp:SqlDataSource>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                <asp:ListItem Value="default">Show all</asp:ListItem>
                <asp:ListItem>Skirt</asp:ListItem>
                <asp:ListItem>T-shirt</asp:ListItem>
                <asp:ListItem>Jeans</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Filter" style="width: 43px" />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="productID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="3" OnPageIndexChanging="GridView1_PageIndexChanging" OnSorting="GridView1_Sorting">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
                    <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:ImageField DataImageUrlField="Image" HeaderText="Image">
                    </asp:ImageField>
                    <asp:BoundField DataField="productID" HeaderText="productID" InsertVisible="False" ReadOnly="True" SortExpression="productID" Visible="False" />
                    <asp:HyperLinkField DataNavigateUrlFields="productID" DataNavigateUrlFormatString="Product_Details.aspx?productID={0}" HeaderText="Product details" Text="Product details" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerSettings FirstPageText="First" Mode="NumericFirstLast" PageButtonCount="2" LastPageText="Last" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <br />
        </div>
    </form>
</body>
</html>
