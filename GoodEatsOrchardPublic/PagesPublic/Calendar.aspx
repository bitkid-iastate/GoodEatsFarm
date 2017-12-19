<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="GoodEatsOrchardPublic.Calendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <br />
   
    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">
                <iframe src="https://calendar.google.com/calendar/embed?src=bbbdg62t19jp3j91l28m72msrc%40group.calendar.google.com&ctz=America/Chicago" style="border: 0" width="900" height="600"></iframe>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>
