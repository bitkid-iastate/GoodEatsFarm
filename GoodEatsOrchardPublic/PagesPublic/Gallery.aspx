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
       
           <img src="/Images/IMG_1204.jpg" date-title:"captioned" data-description="also caption"/>
        <img src="/Images/image33.JPG" />
       <p>caption here</p>
        <img src="/Images/image22v2.JPG" />
        <img src="/Images/2015%20Lexus%20RC%20350%20AWD%20%20F-Sport%20Package%20%20Lexus%20Sportiest%20Vehicle!!!%202.jpg" data-title:"car"/>

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
