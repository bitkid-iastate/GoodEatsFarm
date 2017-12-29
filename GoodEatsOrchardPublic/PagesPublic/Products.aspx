<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="GoodEatsOrchardPublic.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex">
        <div class="fbox">
            <img class="fboxImg" width="300" height="150" src="../Images/Products/Fuji.jpg" />
            <a href="/PagesPublic/Fruits.aspx" class="fboxText">Fruits</a>
        </div>
        <div class="fbox"> 
            <img class="fboxImg" width="300" height="150" src="../Images/Products/GoldDelicious.jpg" />
            <a href="/PagesPublic/Vegetablez.aspx"class="fboxText">Vegtables</a>
        </div>
        <div class="fbox">
            <img class="fboxImg" width="300" height="150" src="../Images/Products/GrannySmith.jpg" />
            <a href="/PagesPublic/Eggz.aspx"class="fboxText">Eggs & Poultry</a>
        </div>
        <div class="fbox">
            <img class="fboxImg" width="300" height="150" src="../Images/Products/Gravensteins.jpg" />
            <a href="/PagesPublic/Flowerz.aspx" class="fboxText">Flowers</a>
        </div>
    </div>
</asp:Content>
