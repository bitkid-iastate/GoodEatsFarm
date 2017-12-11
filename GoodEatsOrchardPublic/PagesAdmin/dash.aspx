<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="dash.aspx.cs" Inherits="GoodEatsOrchardPublic.dash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashForm">
        Jumbotron (On/Off):
    <asp:CheckBox ID="chkJumbo" runat="server" OnCheckedChanged="chkJumbo_Changed" AutoPostBack="True" />
        <br />
        <asp:TextBox ID="txtJumbo" Style="resize: none" runat="server" Height="100px" Visible="False" Width="500px" TextMode="MultiLine"></asp:TextBox>

        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" UseSubmitBehavior="False" />
    </div>
    <br />
    <div class="dashForm">
        <asp:Panel ID="plNewProduct" runat="server">
            <asp:BulletedList ID="blErrors" runat="server" BulletStyle="Circle" Font-Bold="True" Font-Size="Large" ForeColor="#CC0000" Visible="False">
            </asp:BulletedList>
            <br />
            Add new product:
        <br />
            Category:
            <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True">
                <asp:ListItem Selected="True">none</asp:ListItem>
                <asp:ListItem Value="67a6ec19-a89b-43c9-8b69-a6711673c77e">Fruits</asp:ListItem>
                <asp:ListItem Value="7c63455d-8753-4288-a006-f6443fb9147c">Vegetables</asp:ListItem>
                <asp:ListItem Value="c4c2deef-ecf0-4cc3-ad5a-009ab0c49599">Flowers</asp:ListItem>
                <asp:ListItem Value="e4db916e-5427-42d0-8a94-6ced86bedabe">Eggs</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:RadioButtonList ID="chkbxCategory" runat="server" DataSourceID="LinqDataSource2" DataTextField="Name" DataValueField="CategoryID" RepeatDirection="Horizontal" Visible="False">
                <asp:ListItem Value="4c80b0af-7b83-4d26-95c4-9f23633c6085">Apple</asp:ListItem>
                <asp:ListItem Value="f0b07dd5-5a30-44e5-839d-5595849e6ed5">Pear</asp:ListItem>
                <asp:ListItem Value="4029a392-b5c0-4253-a8b9-e0262bab0fb2">Plum</asp:ListItem>
                <asp:ListItem Value="7843df41-904b-4a40-94e7-cba66c524bc5">Asian Pear</asp:ListItem>
            </asp:RadioButtonList>
            <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="GoodEatsOrchardPublic.GoodEatsFarmDataContext" EntityTypeName="" Select="new (CategoryID, Name, SuperCategoryID)" TableName="Categories" Where="SuperCategoryID == @SuperCategoryID">
                <WhereParameters>
                    <asp:Parameter DbType="Guid" DefaultValue="67a6ec19-a89b-43c9-8b69-a6711673c77e" Name="SuperCategoryID" />
                </WhereParameters>
            </asp:LinqDataSource>
            <br />
            Image:
            <asp:FileUpload ID="FileUpload1" runat="server" ViewStateMode="Enabled" />
            <br />
            Title:
            <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
            <br />
            Price:
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
            <br />
            Description:
            <asp:TextBox ID="txtDesc" runat="server" Height="75px" Style="resize: none" TextMode="MultiLine" Width="350px"></asp:TextBox>
            <br />
            <asp:Button ID="sbtProduct" runat="server" OnClick="sbtProduct_Click" Text="Submit Product" />
        </asp:Panel>
        <asp:Panel ID="plNewProdSuccess" runat="server" Visible="False">

            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </asp:Panel>

    </div>

</asp:Content>
