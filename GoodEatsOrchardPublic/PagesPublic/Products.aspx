﻿<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="GoodEatsOrchardPublic.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex">
        <div>
            <a href="/PagesPublic/Fruits.aspx" class="fbox">Fruits</a>
        </div>
        <div>
            <a href="/PagesPublic/Vegetablez.aspx"class="fbox">Vegtables</a>
        </div>
        <div>
            <a href="/PagesPublic/Eggz.aspx"class="fbox">Eggs & Poultry</a>
        </div>
        <div>
            <a href="/PagesPublic/Flowerz.aspx" class="fbox">Flowers</a>
        </div>
    </div>
</asp:Content>
