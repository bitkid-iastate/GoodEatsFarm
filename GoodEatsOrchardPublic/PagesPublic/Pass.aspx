<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="Pass.aspx.cs" Inherits="GoodEatsOrchardPublic.PublicPages.Pass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="center">
            <p>
                <asp:Label ID="lblWrong" runat="server" Text="Incorrect password" Visible="False" ForeColor="Red"></asp:Label>
            </p>
            <p>
                <asp:Label ID="lblAlreadyIn" runat="server" Text="You are already logged in." Visible="False" ForeColor="Red"></asp:Label>
            </p>
            <asp:Panel ID="Panel1" runat="server" Visible="False">
        <p>
            
            Enter the password:
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
            <asp:TextBox ID="TextBox1" runat="server" Width="240px" Text="password" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
        </p>
            <p>
                <asp:Button ID="btnSubmit" runat="server" Text="Sumbit" OnCommand="btnSubmit_Command" />
            </p>

            </asp:Panel>

    </div>
</asp:Content>
