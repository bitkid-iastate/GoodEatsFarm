<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="GoodEatsOrchardPublic.About1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center" CssClass="content-words" Style=" margin:5px;">

        <asp:TableRow runat="server">
            <asp:TableCell HorizontalAlign="Center">
</asp:TableCell>
            
        </asp:TableRow>
        <asp:TableRow runat="server"><asp:TableCell>

       <asp:Image runat="server" Width="375" ImageUrl="~/Images/appleTree.jpg" class="aboutUs"></asp:Image> 
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
<%--           &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            With a growing interest in self-sustainability, Mike and Julee - two information technology professionals living and working in the Des Moines metro, decided
            to take their interests a step further. In 2013 they purchased 5.5 acres on which to build and plant a garden and orchard. And they
            would do it mostly with their own two hands (well, four hands). The project has not always been easy, but the goal has always 
            been clear: Create a greener lifestyle, and produce fresher ingredients using less chemicals. Though the couple are big proprieters of both cooking and eating good food, Good Eats Farm & Orchard is now producing more than they can
            eat. Mike and Julee now sell their produce to recoup some of the costs of growing them.
            <br />
            <br />
            Lorem ipsum dolor sit amet, netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.--%>
                                     </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    
    
   
   
</asp:Content>
