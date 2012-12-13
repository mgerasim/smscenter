<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Домашняя страница
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: ViewData["Message"] %></h2>
    <h2><%: ViewData["Name"] %></h2>
    <p>
        Для получения дополнительных сведений о ASP.NET MVC посетите веб-сайт <a href="http://asp.net/mvc" title="Веб-сайт ASP.NET MVC">http://asp.net/mvc</a>.
    </p>
    <% using (Html.BeginForm("Send", "Home"))
       {  %>
        <div>Phone: <%= Html.TextBox("message.Phone")%></div><br />
        <div><%= Html.DropDownList("item", (IEnumerable<SelectListItem>)ViewData["items"])%>  </div><br />
        <div>Message: <%= Html.TextArea("message.Message", "", 10, 20, 0)%></div><br />
        <input type="submit" />
        <% } %>
   <h2><%: ViewData["Error"] %></h2>
</asp:Content>
