<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="GoodEatsOrchardPublic.Contact1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <script type="text/javascript">
        function drag(ev) {
            /* Here is specified what should be dragged. */
            /* This data will be dropped at the place where the mouse button is released */
            /* Here, we want to drag the element itself, so we set it's ID. */
            ev.dataTransfer.setData("text", document.getElementById(ev.target.id).textContent);
        }
        function drop(ev) {
            ev.preventDefault();
            var data = ev.dataTransfer.getData("text");
            ev.target.appendChild(document.getElementById(data));
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <!-- <div>
    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center" BorderColor="Black" Height="300px" Width="300px">
        <asp:TableRow runat="server" VerticalAlign="Middle">
            <asp:TableCell runat="server" VerticalAlign="Middle"><p class="content-words"> Phone Number :</p></asp:TableCell>
            <asp:TableCell runat="server" HorizontalAlign="Right" VerticalAlign="Middle"><p id="phone" draggable="true" ondragstart="drag(event)" class="content-words">(515) 491-0269</p></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server" VerticalAlign="Middle">
            <asp:TableCell runat="server" VerticalAlign="Middle"><p class="content-words"> Address :</p></asp:TableCell>
            <asp:TableCell runat="server" HorizontalAlign="Right" VerticalAlign="Middle"><p id="address" draggable="true" ondragstart="drag(event)" class="content-words">16967 118th Avenue <br />
Indianola, Iowa 50125</p></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</div> -->
    <div class="center">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
    <p>
        Please Fill the Following to Send Mail.</p>
    <p>
        Your name:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"

            ControlToValidate="YourName" ValidationGroup="save" /><br />
        <asp:TextBox ID="YourName" runat="server" Width="250px" /><br />
        Your email address:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"

            ControlToValidate="YourEmail" ValidationGroup="save" /><br />
        <asp:TextBox ID="YourEmail" runat="server" Width="250px" />
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator23"

            SetFocusOnError="true" Text="Example: username@gmail.com" ControlToValidate="YourEmail"

            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"

            ValidationGroup="save" /><br />
        Subject:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"

            ControlToValidate="YourSubject" ValidationGroup="save" /><br />
        <asp:TextBox ID="YourSubject" runat="server" Width="400px" /><br />
        Your Question:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"

            ControlToValidate="Comments" ValidationGroup="save" /><br />
        <asp:TextBox ID="Comments" runat="server" 

                TextMode="MultiLine" Rows="10" Width="400px" />
    </p>
        <div class="g-recaptcha" data-sitekey="6Ld_3joUAAAAAGhi-8rWt8x5dQchpiyWT_4xlAQi"></div>
    <p>
        <asp:Button ID="btnSubmit" runat="server" Text="Send" 

                    OnClick="Button1_Click" ValidationGroup="save" />
    </p>
</asp:Panel>
 
<p>
    <asp:Label ID="DisplayMessage" runat="server" Visible="false" />
</p>  </div>
</asp:Content>
