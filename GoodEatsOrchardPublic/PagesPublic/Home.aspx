<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="GoodEatsOrchardPublic.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="/Scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/Mapster/jquery.imagemapster.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="Table2" runat="server" HorizontalAlign="Center">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Image ID="Image6" runat="server" Height="204px" ImageUrl="~/Images/Rotator/image1.jpg" Width="306px" />

            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Image ID="Image1" runat="server" Height="204px" ImageUrl="~/Images/Rotator/image22v2.jpg" Width="306px" />
            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Image ID="Image2" runat="server" Height="204px" ImageUrl="~/Images/Rotator/IMG_1276.JPG" Width="306px" />
            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Image ID="Image3" runat="server" Height="204px" ImageUrl="~/Images/Rotator/image33.jpg" Width="306px" />
            </asp:TableCell>

            <asp:TableCell runat="server">
                <asp:Image ID="Image5" runat="server" Height="204px" ImageUrl="~/Images/Rotator/image11v2.jpg" Width="306px" />
            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Image ID="Image4" runat="server" Height="204px" ImageUrl="~/Images/Rotator/image2.jpg" Width="306px" />

            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center" Width="900px">
        <asp:TableRow>
            <asp:TableCell runat="server"></asp:TableCell>
            <asp:TableCell><div class="content-words">&nbsp  &nbsp &nbsp<b class="big">&ldquo;</b><br />
            &nbsp  &nbsp &nbsp  &nbsp  &nbsp &nbsp  &nbsp  &nbsp &nbsp  &nbsp &nbsp  &nbsp Established in 2013, Good Eats Farm and Orchard is 
            <b>modest</b> and <b>family-operated</b>; nearly entirely maintained 
            by it's owners. And it's located in <b>walking distance from Lake Aqhuabi</b>! 
            Known for it's variety of <b>farm-fresh</b> fruits and vegetables, along with eggs from both free-range chickens and ducks, only lucky denizens of
            the Des Moines area (and visitors, of course)
            have been able to get a hold of their declicious products. Good Eats Farm and Orchard sells at local <b>farmer's markets</b>, and directly, by contacting one of the owners. 
            Check back here at this website, under the "News" or "Calender" pages, to find out which farmer's market they will be at next, and when! Or if you have an urgent need to satisfy your fresh
            food fix, just give them a call! &nbsp  &nbsp <br />
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b class="big">&rdquo;</b></div> 
          
            </asp:TableCell>

            <asp:TableCell runat="server"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    
    <asp:Table ID="Table4" runat="server" HorizontalAlign="Center">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <div id="msg" style:"z-index:1"> <strong>&#x25BC INTERACTIVE MAP &#x25BC</strong> </div>
                
            </asp:TableCell></asp:TableRow>
    </asp:Table>

    <asp:Table ID="Table3" runat="server" HorizontalAlign="Center">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <asp:Panel ID="Panel1" runat="server">
                </asp:Panel>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">   <img id="birdsEye" src="/Images/BirdsEye.JPG" alt="" style:"z-index:1" usemap="#Map"/>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <br />
    <br />

    <map name="Map" id="Map" style:"z-index:1">
        <area data-key="newOrchard" alt="" title="" href="#" shape="poly" coords="304,115,295,226,563,234,549,359,777,382,755,106" />
        <area data-key="barn" alt="" title="" href="#" shape="poly" coords="407,252,415,315,501,307,493,243" />
        <area data-key="street" alt="" title="" href="#" shape="poly" coords="177,3,209,3,157,469,169,523,187,577,211,632,237,670,188,687,156,619,128,533,121,468,128,375,132,328" />
        <area data-key="oldOrchard" alt="" title="" href="#" shape="poly" coords="261,428,275,418,283,417,450,413,477,432,510,457,537,483,565,524,565,572,535,603,424,700,392,703,360,690,331,662,297,630,275,601,240,524,238,494,250,446" />
    </map>

 <script type="text/javascript">
        var x = document.getElementById("birdsEye").src;
     $('img').mapster({ mapKey: 'data-key', showToolTip: 'true' });

     $('img').mapster('set_options', {
         areas: [{
             key: "newOrchard",
             toolTip: "The New Orchard: 200+ fruit trees!",
             isSelectable: false
         },
             {
                 key: "barn",
                 toolTip: "The Barn",
                 isSelectable: false
             },
             {
                 key: "oldOrchard",
                 toolTip: "The original orchard, gardens, and chicken run."
             },
             {
                 key: "street",
                 toolTip: "118th Ave.",
                 isSelectable: false
             }]
     });

    </script>



<script type="text/javascript" >
    function blink(selector){
        $(selector).fadeOut(2000, function(){
            $(this).fadeIn(2000, function(){
                blink(this);
            });
        });
    }
    $(function() {
        blink('#msg');
    });
</script>


</asp:Content>
