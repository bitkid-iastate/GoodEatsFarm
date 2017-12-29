<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="GoodEatsOrchardPublic.Contact1" %>

<%@ Register Assembly="BotDetect" Namespace="BotDetect.Web.UI"
    TagPrefix="BotDetect" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
    <br />

    <div class="center">
        <asp:Label ID="DisplayMessage" runat="server" Visible="false" ForeColor="#CC0000" Font-Size="X-Large" />
        <b id="DisplayMessage2"></b>
        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
            <p>
            </p>
            <p class="content-words">
                Please fill the following to send us a message.
                <br />
            <br />
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
                <br />
                <br />
                <asp:CheckBox ID="chkbxOptIntoMail" Text="&nbsp&nbsp Would you like to get GoodEats emails? (We only do this sparingly)" runat="server" />
            <br />
            <BotDetect:WebFormsCaptcha ID="ExampleCaptcha" runat="server" />
                <p>
                    <asp:TextBox ID="CaptchaCode" runat="server" />
                    <asp:Label ID="CaptchaErrorLabel" runat="server" />
                    <br />
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" Height="30px" OnClick="Button1_Click" Text="Send" ValidationGroup="save" Width="80px" />
                

            </p>
            
        </asp:Panel>

    </div>
    <br />
    
</asp:Content>
