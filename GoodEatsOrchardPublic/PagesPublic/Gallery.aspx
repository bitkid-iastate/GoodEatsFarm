<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="GoodEatsOrchardPublic.Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-1.10.2.min.js"></script>
    <script src="/galleria/galleria-1.5.7.min.js"></script>
    <style>
        .galleria {
            display: block;
            margin-left: auto;
            margin-right: auto;
            max-width: 950px;
            height: 525px;
            background: white;}

        
    </style>
    

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<br />
     
    <div class="galleria">
        <asp:Literal ID="litGallery" runat="server"></asp:Literal>
</div>
    <script>
        (function () {
            Galleria.loadTheme('/galleria/themes/classic/galleria.classic.min.js');
            
            
        Galleria.run('.galleria', {
            dataConfig: function (img) {
                return {
                    description: $(img).next('p').html()
                }
            }
            });
        }());
    </script>




</asp:Content>
