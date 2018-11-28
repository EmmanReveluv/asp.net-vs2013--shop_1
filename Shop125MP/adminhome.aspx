<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminhome.aspx.cs" Inherits="Shop125MP.adminhome" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Rookie - Tech Store</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <%--  <link rel="stylesheet" href="assets/css/ie8.css" />
    <link rel="stylesheet" href="assets/css/ie9.css" />--%>
</head>

<body>
    <form runat="server">

        <div id="page-wrapper">

            <div id="header">
                <!-- Logo -->
                <h1><a id="logo">ROOKIE <em>TECH STORE</em></a></h1>

                <!-- Nav -->
                <nav id="nav">
                    <ul>
                        <li class="current">
                            <a href="adminhome.aspx">Inventory</a></li>
                        <li>
                            <a href="adminmessages.aspx">Inbox</a>
                        </li>
                        <li>
                            <asp:LinkButton ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click"></asp:LinkButton>
                        </li>

                    </ul>
                </nav>

            </div>

            <section class="wrapper style1">
                <div class="container">
                    <div id="content">
                        <!-- Content -->
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" CellSpacing="5" BorderWidth="1px" CellPadding="3" DataKeyNames="PID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:HyperLinkField HeaderText="ID" DataTextField="PID" DataNavigateUrlFields="PID" DataNavigateUrlFormatString="adminview.aspx?id={0}" />
                                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="PName" HeaderText="Product" SortExpression="PName" />
                                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="PPrice" HeaderText="Price" SortExpression="PPrice" />
                                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="PCateg" HeaderText="Category" SortExpression="PCateg" />
                                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="PFeat" HeaderText="Featured" SortExpression="PFeat" />
                                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="PImgPath" HeaderText="ImgPath" SortExpression="PImgPath" />
                                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="PQuantity" HeaderText="Quantity" SortExpression="PQuantity" ApplyFormatInEditMode="True" />
                                
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />

                        </asp:GridView>
                        <br />
                        <asp:Button runat="server" ID="btnAdd" Text="Add Item" OnClick="btnAdd_Click" />

                        <%--                        <asp:DataList ID="dataview1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="1" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <article>
                                         <div class="inner">
                                            
                                                <asp:HyperLink NavigateUrl='<%# Eval("PID", "~/viewproduct.aspx?Id={0}") %>' runat="server" Text='<%# Eval("PName") %>' />
                                            
                                                <b>PHP </b>
                                                <asp:Label ID="lblPrice" runat="server" Text=' <%# Eval("PPrice") %>' />
                                           
                                        </div>
                                    </div>
                                </article>
                            </ItemTemplate>

                        </asp:DataList>--%>
                    </div>
                </div>
            </section>

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:coe125ConnectionString %>" SelectCommand="viewCatalog" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </form>
    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.dropotron.min.js"></script>
    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/util.js"></script>
    <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    <script src="assets/js/main.js"></script>

</body>
</html>


