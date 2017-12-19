<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="Fruits.aspx.cs" Inherits="GoodEatsOrchardPublic.Fruits" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="max-width: 800px; margin: auto;">
    <div class="flex">
        <div>
            <a href="/PagesPublic/Applez.aspx" class="fbox">Apples</a>
        </div>
        <div>
            <a href="/PagesPublic/Pearz.aspx"class="fbox">Pears</a>
        </div>
        <div>
            <a href="/PagesPublic/Plumz.aspx"class="fbox">Plums</a>
        </div>
        <div>
            <a href="/PagesPublic/AsianPearz.aspx"class="fbox">Asian Pears</a>
        </div>
    </div></div>
</asp:Content>
