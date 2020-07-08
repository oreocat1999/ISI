<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Change_Price.aspx.cs" Inherits="Change_Price" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Product ID:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Only integer allowed." ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Unit price:&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Only figures allowed." ForeColor="Red" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Change price" />
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Vender_Home.aspx">Back to home page</asp:HyperLink>
        </div>
    </form>
</body>
</html>
