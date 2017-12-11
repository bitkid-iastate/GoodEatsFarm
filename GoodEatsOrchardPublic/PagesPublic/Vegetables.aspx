<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="Vegetables.aspx.cs" Inherits="GoodEatsOrchardPublic.Vegetables" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center" Width="900px">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"><asp:Image ID="Image2" runat="server" Height="204px" ImageUrl="~/Images/Products/IMG_2665.JPG" Width="306px" />
</asp:TableCell>
            <asp:TableCell runat="server"><p class="content-words"> German Hardneck ($3/lb) : <br /> Fewer, but larger clovers per bulb with a complex flavor. The plants produce a fibrous stalk that send up an edible flower scape in the spring. Harvest scapes when they appear to promote better bulb development. These generally do better in areas with colder winters.</p></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"><asp:Image ID="Image3" runat="server" Height="204px" ImageUrl="~/Images/Products/IMG_2676.JPG" Width="306px" />
</asp:TableCell>
            <asp:TableCell runat="server"><p class="content-words">Music (Hardneck) <br />
                $3/lb <br />
                Music is a hardneck garlic with more complex flavor than the softwick garlic found in grocery stores. It has big cloves and stores well.<p /></asp:TableCell>
        </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"><asp:Image ID="Image1" runat="server" Height="204px" ImageUrl="~/Images/Products/thaiPeppers.JPG" Width="306px" /></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"><asp:Image ID="Image4" runat="server" Height="204px" ImageUrl="~/Images/Products/thaiBasil.JPG" Width="306px" /></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
    </asp:Table>
</asp:Content>
