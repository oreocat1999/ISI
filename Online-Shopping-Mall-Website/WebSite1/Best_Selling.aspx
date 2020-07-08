<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Best_Selling.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Vender_Home.aspx">Back to Vender&#39;s Home Page</asp:HyperLink>
            <br />
            <br />
            Reporting Period:<asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="49px">30</asp:TextBox>
&nbsp;days<br />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Only positive integer allowed" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Report by Quantities" Width="171px" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Report by Sales Amount" Width="171px" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Display All" />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Order_Details].productID, SUM([Order_Details].quantity) AS TotalQuantity 
FROM [Order_Details] 
INNER JOIN [Order] ON [Order_Details].POnumber = [Order].POnumber  
WHERE ([Order].purchaseDate &gt; ?) 
GROUP BY [Order_Details].productID
ORDER BY SUM([Order_Details].quantity) DESC;">
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="reportDate" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Order_Details].productID, SUM([Order_Details].subTotal) AS TotalSalesAmount 
FROM [Order_Details] 
INNER JOIN [Order] ON [Order_Details].POnumber = [Order].POnumber  
WHERE ([Order].purchaseDate &gt; ?) 
GROUP BY [Order_Details].productID
ORDER BY SUM([Order_Details].subTotal) DESC;">
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="reportDate" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="productID" HeaderText="productID" SortExpression="productID" />
                    <asp:BoundField DataField="TotalQuantity" HeaderText="TotalQuantity" SortExpression="TotalQuantity" />
                </Columns>
            </asp:GridView>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="productID" HeaderText="productID" SortExpression="productID" />
                    <asp:BoundField DataField="TotalSalesAmount" HeaderText="TotalSalesAmount" SortExpression="TotalSalesAmount" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
