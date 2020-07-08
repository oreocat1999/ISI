<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Change_Password.aspx.cs" Inherits="Change_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            First Name:
            <asp:TextBox ID="tbfName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbfName" ErrorMessage="required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Last Name:
            <asp:TextBox ID="tblName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tblName" ErrorMessage="required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Original Password:
            <asp:TextBox ID="tborPwd" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tborPwd" Display="Dynamic" ErrorMessage="required." ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tborPwd" ErrorMessage="At least 6 characters, include at least 1 digit and i capital letter." ForeColor="Red" ValidationExpression="(?=.*\d)(?=.*[A-Z])\w{6,}" Display="Dynamic"></asp:RegularExpressionValidator>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            New Password:<asp:TextBox ID="tbnewPwd" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbnewPwd" Display="Dynamic" ErrorMessage="required." ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbnewPwd" ErrorMessage="At least 6 characters, include at least 1 digit and i capital letter." ForeColor="Red" ValidationExpression="(?=.*\d)(?=.*[A-Z])\w{6,}" Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="tborPwd" ControlToValidate="tbnewPwd" Display="Dynamic" ErrorMessage="New password should be different from the original password" ForeColor="Red" Operator="NotEqual"></asp:CompareValidator>
            <br />
&nbsp;Re-enter Password:<asp:TextBox ID="renewPwd" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="renewPwd" Display="Dynamic" ErrorMessage="required." ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbnewPwd" ControlToValidate="renewPwd" Display="Dynamic" ErrorMessage="Different from the new password." ForeColor="Red"></asp:CompareValidator>
            <br />
            <asp:Button ID="btSubmit" runat="server" OnClick="btSubmit_Click" Text="Submit" />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Back to the home page</asp:HyperLink>
            </div>
    </form>
</body>
</html>
