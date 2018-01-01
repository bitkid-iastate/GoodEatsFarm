<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="GoodEatsOrchardPublic.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />

    <div class="flex">
        <div class="fbox">
            <img class="fboxImg" width="360" height="180" src="../Images/fruitIcon.png" />
            <a href="/PagesPublic/Fruits.aspx" class="fboxText">Fruits</a>
        </div>
        <div class="fbox"> 
            <img class="fboxImg" width="360" height="180" src="../Images/vegetablesIcon.png" />
            <a href="/PagesPublic/Vegetablez.aspx"class="fboxText">Vegtables</a>
        </div>
        <div class="fbox">
            <img class="fboxImg" width="360" height="180" src="../Images/eggsIcon.png" />
            <a href="/PagesPublic/Eggz.aspx"class="fboxText">Eggs & Poultry</a>
        </div>
        <div class="fbox">
            <img class="fboxImg" width="360" height="180" src="../Images/flowersIcon.png" />
            <a href="/PagesPublic/Flowerz.aspx" class="fboxText">Flowers</a>
        </div>
    </div>
</asp:Content>
