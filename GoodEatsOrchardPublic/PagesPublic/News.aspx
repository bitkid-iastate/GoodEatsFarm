<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="GoodEatsOrchardPublic.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function modalize(x) {
            var modal = document.getElementById('myModal');
            var modalImg = document.getElementById("img01");
            modal.style.display = "block";
            modalImg.src = x.src;
        }
        function closeModal() {
            var modal = document.getElementById('myModal');
            modal.style.display = "none";
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <asp:Panel ID="plNews" runat="server">
</asp:Panel>
    <br />

<%--    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center" Width="900px">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
    <div class="big">&nbsp&nbsp&nbsp&nbsp&nbsp &nbsp  Our news is on <img src="/Images/facebook.svg" height="70" width="70" />acebook!</div></asp:TableCell>
        </asp:TableRow>
    </asp:Table>--%>
    <div id="myModal" class="modal">
        <span class="close" onclick="closeModal()">&times;</span>
        <img class="modal-content" id="img01" />
    </div>
    <div id="news">
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    </div>


</asp:Content>

