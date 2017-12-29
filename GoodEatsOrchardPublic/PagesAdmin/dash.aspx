<%@ Page Title="" Language="C#" MasterPageFile="~/GEO.Master" AutoEventWireup="true" CodeBehind="dash.aspx.cs" Inherits="GoodEatsOrchardPublic.dash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function previewFile() {
            var preview = document.querySelector('#<%=Avatar.ClientID %>');
            var file = document.querySelector('#<%=avatarUpload.ClientID %>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }
    </script>
    <script type="text/javascript">
        function previewFile2() {
            var preview = document.querySelector('#<%=imgNewsSample.ClientID %>');
            var file = document.querySelector('#<%=flNewsSample.ClientID %>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }
    </script>
    <script type="text/javascript">
        function previewFile3() {
            var preview = document.querySelector('#<%=rotatorImg.ClientID %>');
            var file = document.querySelector('#<%=rotatorFile.ClientID %>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div style="display: block; width: 874px; margin: auto">
        <asp:Button ID="btnView1" runat="server" Text="Dashboard" Style="display: block; float: left" OnClick="btnView1_Click" Font-Bold="True" Font-Size="Large" />
        <asp:Button ID="btnView5" runat="server" Text="Homepage" Style="display: block; float: left" OnClick="btnView5_Click" Font-Bold="True" Font-Size="Large" />
        <asp:Button ID="btnView4" runat="server" Text="Farm News" Style="display: block; float: left" OnClick="btnView4_Click" Font-Bold="True" Font-Size="Large" />
        <asp:Button ID="btnView6" runat="server" Text="About Us" Style="display: block; float: left" OnClick="btnView6_Click" Font-Bold="True" Font-Size="Large" />
        <asp:Button ID="btnView2" runat="server" Text="Products" Style="display: block; float: left" OnClick="btnView2_Click" Font-Bold="True" Font-Size="Large" />
        <asp:Button ID="btnView3" runat="server" Text="Gallery" Style="display: block; float: left" OnClick="btnView3_Click" Font-Bold="True" Font-Size="Large" />
        <asp:Button ID="btnView7" runat="server" Text="Background" Style="display: block; float: left" Font-Bold="True" Font-Size="Large" OnClick="btnView7_Click" />

    </div>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <div class="dashForm">
                <p class="content-words">Number of visits:<br />
                </p>
                <asp:Label ID="lblVisits" runat="server" ForeColor="#333333" Font-Bold="True" Font-Italic="True" Font-Size="X-Large"></asp:Label>
            </div>
            <div class="dashForm">
                Jumbotron (On/Off):
    <asp:CheckBox ID="chkJumbo" runat="server" OnCheckedChanged="chkJumbo_Changed" AutoPostBack="True" />
                <br />
                <asp:TextBox ID="txtJumbo" Style="resize: none" runat="server" Height="100px" Visible="False" Width="500px" TextMode="MultiLine"></asp:TextBox>

                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" UseSubmitBehavior="False" />
            </div>

        </asp:View>
        <asp:View ID="View2" runat="server">
            <div class="dashForm">
                <asp:Panel ID="plNewProduct" runat="server">
                    <asp:BulletedList ID="blErrors" runat="server" BulletStyle="Circle" Font-Bold="True" Font-Size="Large" ForeColor="#CC0000" Visible="False">
                    </asp:BulletedList>
                    <p class="content-words">Add new product:<br />
                    </p>
                    Category:
            <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
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

                    <asp:Label ID="Label1" runat="server" Text="Your new product was successfully added to the database!" Font-Bold="True" Font-Size="Larger"></asp:Label>
                    <asp:Button ID="newProduct" runat="server" Text="Add Another" OnClick="newProduct_Click" />
                </asp:Panel>
            </div>
            <asp:Panel ID="plProductsView" runat="server">
                <div class="dashForm">
                    <p class="content-words">Edit Existing Products<br />
                    </p>
                    Category:
            <asp:DropDownList ID="ddlCategory2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategory2_SelectedIndexChanged">
                <asp:ListItem Selected="True">none</asp:ListItem>
                <asp:ListItem Value="67a6ec19-a89b-43c9-8b69-a6711673c77e">Fruits</asp:ListItem>
                <asp:ListItem Value="7c63455d-8753-4288-a006-f6443fb9147c">Vegetables</asp:ListItem>
                <asp:ListItem Value="c4c2deef-ecf0-4cc3-ad5a-009ab0c49599">Flowers</asp:ListItem>
                <asp:ListItem Value="e4db916e-5427-42d0-8a94-6ced86bedabe">Eggs</asp:ListItem>
            </asp:DropDownList>
                    <br />
                    <asp:RadioButtonList ID="chkbxCategory2" runat="server" DataSourceID="LinqDataSource2" DataTextField="Name" DataValueField="CategoryID" RepeatDirection="Horizontal" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="chkbxCategory2_SelectedIndexChanged">
                        <asp:ListItem Value="4c80b0af-7b83-4d26-95c4-9f23633c6085">Apple</asp:ListItem>
                        <asp:ListItem Value="f0b07dd5-5a30-44e5-839d-5595849e6ed5">Pear</asp:ListItem>
                        <asp:ListItem Value="4029a392-b5c0-4253-a8b9-e0262bab0fb2">Plum</asp:ListItem>
                        <asp:ListItem Value="7843df41-904b-4a40-94e7-cba66c524bc5">Asian Pear</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="GoodEatsOrchardPublic.GoodEatsFarmDataContext" EntityTypeName="" Select="new (CategoryID, Name, SuperCategoryID)" TableName="Categories" Where="SuperCategoryID == @SuperCategoryID">
                        <WhereParameters>
                            <asp:Parameter DbType="Guid" DefaultValue="67a6ec19-a89b-43c9-8b69-a6711673c77e" Name="SuperCategoryID" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <br />
                    <asp:GridView ID="gvProducts" runat="server" DataKeyNames="ProductID" AutoGenerateColumns="False" Width="750px">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnProdEdit" runat="server" Text="Edit" OnClick="btnProdEdit_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnProdDelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this product?');" AlternateText="Delete" Text="Delete" OnClick="btnProdDelete_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="Product" SortExpression="Name" />
                            <asp:BoundField DataField="PriceInfo" HeaderText="Price Info" SortExpression="PriceInfo" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="OrderIndex" HeaderText="Order Index" SortExpression="OrderIndex" />
                        </Columns>
                    </asp:GridView>
                </div>
            </asp:Panel>
            <asp:Panel ID="plEditProduct" runat="server" Visible="False">
                <div class="dashForm">
                    <div class="center">
                        <asp:ListBox ID="lblErr2" runat="server" ForeColor="Red" Visible="False"></asp:ListBox>

                    </div>
                    <br />

                    <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="lblProdID" runat="server" Visible="False"></asp:Label>
                    <br />
                    <asp:RadioButtonList ID="chkbxImage" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="chkbxImage_SelectedIndexChanged">
                        <asp:ListItem Selected="True">Use Existing Photo</asp:ListItem>
                        <asp:ListItem>Upload New Photo</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                    <asp:DropDownList ID="ddlImages" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlImages_SelectedIndexChanged" Width="300px">
                        <asp:ListItem Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Image ID="imgSample" runat="server" Width="350px" BorderColor="Black" BorderStyle="Solid" />
                    <asp:FileUpload ID="FileUpload2" runat="server" Visible="False" />
                    <br />
                    <br />
                    Title :
                    <asp:TextBox ID="txtTitle2" runat="server" Width="240px"></asp:TextBox>
                    <br />
                    Price info :<asp:TextBox ID="txtPrice2" runat="server" Width="240px"></asp:TextBox>
                    <br />
                    Description :<br />



                    <asp:TextBox ID="txtDesc2" runat="server" Height="75px" Style="resize: none" TextMode="MultiLine" Width="350px"></asp:TextBox>
                    <br />
                    <asp:DropDownList ID="ddlOrderIndex" runat="server">
                        <asp:ListItem Value="0">TOP</asp:ListItem>
                        <asp:ListItem Value="100">Bottom</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Button ID="btnProdUpdate" runat="server" Text="Update" OnClick="btnProdUpdate_Click" />
                    <asp:Button ID="btnProdUpd8Cancel" runat="server" Text="Cancel" OnClick="btnProdUpd8Cancel_Click" />
                </div>
            </asp:Panel>

            <br />
            <asp:Panel ID="plUpdatProdSucc" runat="server">
                <div class="dashForm">
                    <p class="content-words">
                        <asp:Label ID="Label2" runat="server" Text="Your product was succesfully updated!"></asp:Label>
                    </p>
                </div>
            </asp:Panel>





        </asp:View>
        <asp:View ID="View3" runat="server">
            <div class="dashForm">
                <asp:Panel ID="plNewGalleryImage" runat="server">
                    <asp:BulletedList ID="BulletedList1" runat="server"></asp:BulletedList>

                    <%--javascript image preview source code --%>

                    <input id="avatarUpload" type="file" name="file" onchange="previewFile()" runat="server" />
                    <%--<asp:FileUpload ID="avatarUpload" runat="server" />--%>
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnGalleryImage" />
                    <asp:Image ID="Avatar" runat="server" ImageUrl="~/Images/NoUser.jpg" Width="225px" />

                    <br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="plGalleryImageSucc" runat="server">
                    Success!!!
                    <asp:Button ID="btnAnotherGalleryImg" runat="server" Text="Add another" OnClick="btnAnotherGalleryImg_Click" />
                </asp:Panel>
                <asp:GridView ID="gvGallery" runat="server" AutoGenerateColumns="False" DataKeyNames="FileName" OnRowDataBound="gvGallery_RowDataBound">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnDeleteImage" OnClientClick="return confirm('Are you sure you want to PERMANENTLY delete this image? Deleting this image will remove it from the server, and you will not be able to get it back.');" runat="server" OnClick="btnDeleteImage_Click" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="imgGalleryThumb" runat="server" BorderStyle="Outset" Width="200px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <div class="dashForm">
                <asp:Button ID="btnArticleAdd" runat="server" Text="New" OnClick="btnArticleAdd_Click" />
                <asp:BulletedList ID="blNewsErr" runat="server" Visible="False">
                </asp:BulletedList>
                <asp:Panel ID="plJournal" runat="server">

                    <asp:Panel ID="plNewsInsertSuccess" runat="server" Visible="False">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Larger" Text="Success!"></asp:Label>
                    </asp:Panel>

                    <input id="flNewsSample" type="file" name="file" onchange="previewFile2()" runat="server" />
                    <%--<asp:FileUpload ID="avatarUpload" runat="server" />--%>
                    <asp:Button ID="btnLoadNewsPic" runat="server" Text="Upload" OnClick="btnLoadNewsPic_Click" />
                    <asp:Image ID="imgNewsSample" runat="server" ImageUrl="~/Images/NoUser.jpg" Width="225px" />

                    <br />
                    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                    <asp:DataList ID="dlArtPicsPreview" runat="server" RepeatDirection="Horizontal" DataKeyField="fileName" OnItemDataBound="dlArtPicsPreview_ItemDataBound">
                        <ItemTemplate>
                            <div class="button-container">
                                <asp:Image ID="imgArtPicStage" runat="server" CssClass="button-image" />
                                <asp:Button ID="btnRemoveArtPic" runat="server" Text="REMOVE" OnClick="btnRemoveArtPic_Click" CssClass="button-text" />
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:TextBox ID="txtArtContent" runat="server" Rows="7" TextMode="MultiLine" Width="600px"></asp:TextBox>

                    <asp:Button ID="btnSbtNewArticle" runat="server" OnClick="btnSbtNewArticle_Click" Style="height: 26px" Text="Submit" />

                </asp:Panel>
                <asp:Panel ID="plNews" runat="server">
                    <asp:GridView ID="gvNews" runat="server" AutoGenerateColumns="False" DataKeyNames="NewsID">
                        <Columns>
                            <asp:BoundField DataField="NewsDate" HeaderText="Time &amp; Date" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnNewsEdit" runat="server" OnClick="btnNewsEdit_Click" Text="Edit" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnNewsDelete" runat="server" OnClick="btnNewsDelete_Click" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this? THERE IS NO GOING BACK.');"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </div>
        </asp:View>

        <asp:View ID="View5" runat="server">
            <div class="dashForm">
                <asp:Panel ID="plHomeContent" runat="server">
                    <asp:TextBox ID="txtHomeContent" runat="server" Height="238px" TextMode="MultiLine" Width="729px"></asp:TextBox>
                    <asp:Button ID="btnHomeCntSbt" runat="server" Text="Update" OnClick="btnHomeCntSbt_Click" />
                </asp:Panel>
                <asp:Panel ID="plRotatorAddImage" runat="server">
                    <p class="content-words">Add a new picture to the home page:<br />
                    </p>
                    <asp:BulletedList ID="blRotatorAddImageErr" runat="server"></asp:BulletedList>

                    <%--javascript image preview source code --%>

                    <input id="rotatorFile" type="file" name="file" onchange="previewFile3()" runat="server" />
                    <%--<asp:FileUpload ID="avatarUpload" runat="server" />--%>
                    <asp:Button ID="rotatorSbmt" runat="server" Text="Upload" OnClick="rotatorSbmt_Click" />
                    <asp:Image ID="rotatorImg" runat="server" Width="225px" minwidth="225px" minheight="225px" />

                    <br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="plRotatorImgAddSucc" runat="server">
                    Success!!!
                    <asp:Button ID="btnRotatorAddAnother" runat="server" Text="Add another" />
                </asp:Panel>
                <asp:GridView ID="gvRotatorImgs" runat="server" AutoGenerateColumns="False" DataKeyNames="FileName" OnRowDataBound="gvRotatorImgs_RowDataBound">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnDeleteRotatorImage" OnClientClick="return confirm('Are you sure you want to PERMANENTLY delete this image? Deleting this image will remove it from the server, and you will not be able to get it back.');" runat="server" Text="Delete" OnClick="btnDeleteRotatorImage_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="rotatorImgThumb" runat="server" BorderStyle="Outset" Width="200px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </asp:View>
        <asp:View ID="View6" runat="server">
            <asp:TextBox ID="txtAboutUs" runat="server" Height="400px" TextMode="MultiLine" Width="900px"></asp:TextBox>
            <asp:Button ID="btnAboutUsSbt" runat="server" Text="Update" OnClick="btnAboutUsSbt_Click" />
        </asp:View>
    </asp:MultiView>


</asp:Content>
