<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="logon.aspx.cs" Inherits="FormsAuthAD.Logon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style1
    {
        width: 103%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <div align="left">
    
        <table style="width: 50%; font-size: 10pt;">
            <tr>
                <td align="right" class="style1" style="width: 100px">
                    <asp:Label ID="Label1" runat="server" Text="Domain:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDomainName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style1" style="width: 100px">
                    <asp:Label ID="Label2" runat="server" Text="User:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style1" style="width: 100px">
                    <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style1" style="width: 100px">
                    &nbsp;</td>
                <td align="left">
                    <br />
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="btnLogon" runat="server" onclick="btnLogon_Click" 
                        Text="Log On" />
                </td>
            </tr>
        </table>
    
    </div>
</asp:Content>

