<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="MailList.aspx.cs" Inherits="GoodEatsOrchardPublic.MailList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <br />
        <br />
        <br />
        <div class="center">
            <p class="content-words">
                Join our mailing list and get periodic e-mail flyers with news about events and products from Good Eats Farm & Orchard!
            </p>


            <asp:Table ID="Table1" runat="server">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server"><p class="content-words"> What should we call you?</p> </asp:TableCell>

                    <asp:TableCell runat="server">
                        <asp:TextBox ID="TextBox1" runat="server" Width="240px"></asp:TextBox><asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" ControlToValidate="TextBox1" runat="server" ErrorMessage="Name Required"></asp:RequiredFieldValidator></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server"><p class="content-words">What's your e-mail address?</p></asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="TextBox2" runat="server" Width="240px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="E-mail Required" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ErrorMessage="Invalid E-mail Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TextBox2"></asp:RegularExpressionValidator>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server"><p class="content-words">Can we have your phone number?</p></asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="TextBox3" runat="server" Width="240px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ErrorMessage="Invalid Phone Number" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" ControlToValidate="TextBox3"></asp:RegularExpressionValidator>
</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />

            <asp:Button ID="btnSbt" runat="server" Text="Submit" Height="35px" Width="100px" OnClick="btnSbt_Click" />

            <br />

        </div>
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" Visible="False">
        <br />
        <br />
        <br />
        <br />
        <div class="center">
            <div class="content-words">
                We got your information. Thank you!!
            </div>
        </div>
    </asp:Panel>
</asp:Content>
