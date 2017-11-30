<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="GoodEatsOrchardPublic.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex">
        <div>
            <a href="/PublicPages/Fruits.aspx" class="fbox">Fruits</a>
        </div>
        <div>
            <a href="/PublicPages/Vegetables.aspx"class="fbox">Vegtables</a>
        </div>
        <div>
            <a href="/PublicPages/Eggs.aspx"class="fbox">Eggs & Poultry</a>
        </div>
        <div>
            <a href="/PublicPages/Flowers.aspx" class="fbox">Flowers</a>
        </div>
    </div>
</asp:Content>
