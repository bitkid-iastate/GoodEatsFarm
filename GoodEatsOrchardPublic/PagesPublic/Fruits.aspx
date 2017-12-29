<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="Fruits.aspx.cs" Inherits="GoodEatsOrchardPublic.Fruits" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="flex">
        <div class="fbox">
            <img class="fboxImg" width="300" height="150" src="../Images/Products/Fuji.jpg" />
            <a href="/PagesPublic/Applez.aspx" class="fboxText">Apples</a>
        </div>
        <div class="fbox">
            <img class="fboxImg" width="300" height="150" src="../Images/Products/Fuji.jpg" />
            <a href="/PagesPublic/Pearz.aspx"class="fboxText">Pears</a>
        </div>
        <div class="fbox">
            <img class="fboxImg" width="300" height="150" src="../Images/Products/Fuji.jpg" />
            <a href="/PagesPublic/Plumz.aspx"class="fboxText">Plums</a>
        </div>
        <div class="fbox">
            <img class="fboxImg" width="300" height="150" src="../Images/Products/Fuji.jpg" />
            <a href="/PagesPublic/AsianPearz.aspx"class="fboxText">Asian Pears</a>
        </div>
    </div>
</asp:Content>
