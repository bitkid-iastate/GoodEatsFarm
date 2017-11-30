<%@ Page Title="" Language="C#" MasterPageFile="GEO.Master" AutoEventWireup="true" CodeBehind="Apples.aspx.cs" Inherits="GoodEatsOrchardPublic.Apples" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center" Width="900px">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"><asp:Image ID="Image1" runat="server" Height="204px" ImageUrl="~/Images/Johnagold2.JPG" Width="306px" /></asp:TableCell>
            <asp:TableCell runat="server"><p class="content-words">Johnagold<br />$1.50/lb<br />Good for eating fresh and baking. They ripen in September.</p></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"><asp:Image ID="Image2" runat="server" Height="204px" ImageUrl="~/Images/Liberty.JPG" Width="306px" /></asp:TableCell>
            <asp:TableCell runat="server"><p class="content-words">Liberty<br />$1.50/lb<br /> Liberty apples have a sweet and tart flavor which is good for eating fresh, cooking, and making cider. Ripens in September.</p></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"><asp:Image ID="Image3" runat="server" Height="204px" ImageUrl="~/Images/GoldDelicious.JPG" Width="306px" /></asp:TableCell>
            <asp:TableCell runat="server"><p class="content-words">Yellow/Golden Delicious<br />$1.50/lb<br />Sweet apples good for eating fresh or making cider. Ripen in September.</p></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"><asp:Image ID="Image4" runat="server" Height="204px" ImageUrl="~/Images/Gravensteins.JPG" Width="306px" /></asp:TableCell>
            <asp:TableCell runat="server"><p class="content-words">Gravensteins<br />$1.50/lb<br />Tart and slightly sweet. Gravensteins are good for eating fresh or making cider. Ripen in September.</p></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"><asp:Image ID="Image5" runat="server" Height="204px" ImageUrl="~/Images/Empire.JPG" Width="306px" /></asp:TableCell>
            <asp:TableCell runat="server"><p class="content-words">Empire<br />$1.50/lb<br />Tart and slightly sweet. Good for eating, baking, or making cider. Ripen in september.</p></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"><asp:Image ID="Image6" runat="server" Height="204px" ImageUrl="~/Images/Fuji.JPG" Width="306px" /></asp:TableCell>
            <asp:TableCell runat="server"><p class="content-words">Fuji<br />$1.50/lb<br />Sweet apples good for eating fresh or making cider. Ripen mid-October.</p></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"><asp:Image ID="Image7" runat="server" Height="204px" ImageUrl="~/Images/GrannySmith.JPG" Width="306px" /></asp:TableCell>
            <asp:TableCell runat="server"><p class="content-words">Granny Smith<br />$1.50/lb<br />Granny Smiths are tart and good for baking. They ripen between the end of October to early November.</p></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"></asp:TableCell>
            <asp:TableCell runat="server"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"></asp:TableCell>
            <asp:TableCell runat="server"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"></asp:TableCell>
            <asp:TableCell runat="server"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
