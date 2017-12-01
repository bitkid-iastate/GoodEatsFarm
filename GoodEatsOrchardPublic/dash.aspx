<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="dash.aspx.cs" Inherits="GoodEatsOrchardPublic.dash" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center">
        <p>
            Jumbotron (On/Off):
    <asp:CheckBox ID="chkJumbo" runat="server" OnCheckedChanged="chkJumbo_Changed" AutoPostBack="True" />      
</p>
        <asp:TextBox ID="txtJumbo" style="resize:none" runat="server" Height="100px" Visible="False" Width="500px" TextMode="MultiLine"></asp:TextBox>
        
        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"  UseSubmitBehavior="False" />
</div>

    
</asp:Content>
