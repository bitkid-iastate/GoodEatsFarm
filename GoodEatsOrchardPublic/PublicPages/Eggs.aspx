<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="Eggs.aspx.cs" Inherits="GoodEatsOrchardPublic.Eggs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center" Width="900px">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"><asp:Image ID="Image2" runat="server" Height="204px" ImageUrl="~/Images/chkEggs.JPG" Width="306px" />
</asp:TableCell>
            <asp:TableCell runat="server"><p class="content-words">Chicken Eggs
                <br /> 
                $3/dozen
                <br />
                Our layer chickens are pasture raised and live in a happy and healthy environment at our farm. Our eggs are from Isa Brown, Road Island Red, Amber Link, Fog Horn, Buff Orpington, and Black Australope variety.
                                          </p></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"><asp:Image ID="Image1" runat="server" Height="204px" ImageUrl="~/Images/duckEggs.JPG" Width="306px" />
</asp:TableCell>
            <asp:TableCell runat="server"><p class="content-words">Duck Eggs<br /> $5/dozen:<br />
                Our ducks are also pasture raised and live in a happy and healthy environment at our farm. We raise Khaki Campbell and Pekin ducks for eggs.
                Compared to chicken eggs, duck eggs are richer with more albumen, which makes cakes and other pastries fluffier. People who cannot eat chicken eggs due to allergies can often eat duck eggs instead.
                                          </p></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"><asp:Image ID="Image3" runat="server" Height="204px" ImageUrl="~/Images/liveDucks.JPG" Width="306px" /></asp:TableCell>
            <asp:TableCell runat="server"><p class="content-words">Live Ducks <br />
                $15/bird<br />
                We sell live ducks. (Pekin and Muscovy)
                                          </p></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
