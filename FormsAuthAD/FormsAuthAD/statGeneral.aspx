<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="statGeneral.aspx.cs" Inherits="FormsAuthAD.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMain" runat="server">
    Создатель:
    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" 
        DataSourceID="oraUsers" DataTextField="NAME" DataValueField="ID">
        <asp:ListItem Value="" Text="Выберите пользователя" />
    </asp:DropDownList>
    &nbsp;
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
    &nbsp;&nbsp;
    <asp:Label ID="lblError" runat="server" Font-Size="10pt" ForeColor="#CC0000"></asp:Label>
    <asp:SqlDataSource ID="oraUsers" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString_eArchive %>" 
    ProviderName="<%$ ConnectionStrings:ConnectionString_eArchive.ProviderName %>" 
    SelectCommand="select u.id, u.ldap_account, u.name from smscenter.users u"></asp:SqlDataSource>
&nbsp;
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ID" DataSourceID="oraUsers">
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
            SortExpression="ID" />
        <asp:BoundField DataField="LDAP_ACCOUNT" HeaderText="LDAP_ACCOUNT" 
            SortExpression="LDAP_ACCOUNT" />
        <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
    </Columns>
</asp:GridView>
</asp:Content>
