<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Purchase_Order_list.aspx.cs" Inherits="Purchase_Order_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Vender_Home.aspx">Back to Vender's Home page</asp:HyperLink>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Order].POnumber, [Order].purchaseDate, Customer.firstName, Customer.lastName, B.totalAmount, [Order].status
FROM (Customer INNER JOIN [Order] ON Customer.[customerID] = [Order].[customerID]) INNER JOIN (SELECT POnumber, sum(price) AS totalAmount FROM [Order_Details] GROUP BY POnumber)  AS B ON [Order].[POnumber] = B.[POnumber]
ORDER BY [Order].POnumber DESC;
"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT [Order].POnumber, [Order].purchaseDate, Customer.firstName, Customer.lastName, B.totalAmount, [Order].status
FROM (Customer INNER JOIN [Order] ON Customer.[customerID] = [Order].[customerID]) INNER JOIN (SELECT POnumber, sum(price) AS totalAmount FROM [Order_Details] GROUP BY POnumber)  AS B ON [Order].[POnumber] = B.[POnumber]
WHERE ([status] = ?)
ORDER BY [Order.purchaseDate];
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="status" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT [Order].POnumber, [Order].purchaseDate, Customer.firstName, Customer.lastName, B.totalAmount, [Order].status
FROM (Customer INNER JOIN [Order] ON Customer.[customerID] = [Order].[customerID]) INNER JOIN (SELECT POnumber, sum(price) AS totalAmount FROM [Order_Details] GROUP BY POnumber)  AS B ON [Order].[POnumber] = B.[POnumber]
WHERE ([Order].[POnumber] = ?)
ORDER BY [Order.purchaseDate];">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="POnumber" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            Enter A Specific P.O.number<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
            <br />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Only integer allowed" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            <br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="Pending">pending orders</asp:ListItem>
                <asp:ListItem Value="Hold">orders on hold</asp:ListItem>
                <asp:ListItem Value="Shipped">past orders</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Filter" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Display All" />
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="POnumber" HeaderText="POnumber" InsertVisible="False" SortExpression="POnumber" />
                <asp:BoundField DataField="purchaseDate" HeaderText="purchaseDate" SortExpression="purchaseDate" />
                <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                <asp:BoundField DataField="totalAmount" HeaderText="totalAmount" SortExpression="totalAmount" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                <asp:HyperLinkField DataNavigateUrlFields="POnumber" DataNavigateUrlFormatString="Purchase_order_processing.aspx?POnumber={0}" HeaderText="Purchase Order Details" Text="Purchase Order Details" />
            </Columns>
        </asp:GridView>
        <br />
    </form>
</body>
</html>
