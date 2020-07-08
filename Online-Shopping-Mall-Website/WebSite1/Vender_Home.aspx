<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Vender_Home.aspx.cs" Inherits="Home" %>

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
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
            <br />
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Best_Selling.aspx">View Best Selling</asp:HyperLink>
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Go to order list" />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [productName], [category], [price], [Image], [productID], [color], [size] FROM [Product]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Product] WHERE ([productName] LIKE ('%' + ? + '%'))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TBPruductName" Name="?" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Product] WHERE ([productID] = ?)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TBproductID" Name="productID" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [productID], [productName], [category], [price], [Image], [color], [size] FROM [Product] WHERE ([category] = &quot;Skirt&quot;)"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [productID], [productName], [category], [price], [Image], [color], [size] FROM [Product] WHERE ([category] = &quot;T-shirt&quot;)"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [productID], [productName], [category], [price], [Image], [color], [size] FROM [Product] WHERE ([category] = &quot;Jeans&quot;)"></asp:SqlDataSource>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                <asp:ListItem Value="default">Show all</asp:ListItem>
                <asp:ListItem>Skirt</asp:ListItem>
                <asp:ListItem>T-shirt</asp:ListItem>
                <asp:ListItem>Jeans</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Filter" Height="29px" Width="54px" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Enter product name"></asp:Label>
            <br />
            <asp:TextBox ID="TBPruductName" runat="server" BackColor="White" Width="175px" Height="25px"></asp:TextBox>
&nbsp;<asp:Button ID="btnProductName" runat="server" Text="Search" OnClick="btnProductName_Click" />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Enter product ID"></asp:Label>
            <br />
            <asp:TextBox ID="TBproductID" runat="server" Width="173px"></asp:TextBox>
            &nbsp;
            <asp:Button ID="btnProductID" runat="server" OnClick="btnProductID_Click" Text="Search" />
            <br />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TBproductID" ErrorMessage="Only integer allowed" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Change_Price.aspx">Change price</asp:HyperLink>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="productID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="3" OnPageIndexChanging="GridView1_PageIndexChanging" OnSorting="GridView1_Sorting">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
                    <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:ImageField DataImageUrlField="Image" HeaderText="Image">
                    </asp:ImageField>
                    <asp:BoundField DataField="productID" HeaderText="productID" InsertVisible="False" ReadOnly="True" SortExpression="productID" />
                    <asp:BoundField DataField="color" HeaderText="color" SortExpression="color" />
                    <asp:BoundField DataField="size" HeaderText="size" SortExpression="size" />
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
