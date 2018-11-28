<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="filter.aspx.cs" Inherits="Shop125MP.filter" %>

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
                        <li>
                            <a href="home.aspx">Featured</a></li>
                        <li  class="current">
                            <a href="categories.aspx">Categories</a>
                            <ul>
                                <li>
                                    <a href="filter.aspx?cat=Laptop">Laptop</a></li>
                                <li>
                                    <a href="filter.aspx?cat=Desktop">Desktop</a></li>
                                <li>
                                    <a href="filter.aspx?cat=Phone">Smartphone</a></li>
                                <li>
                                    <a href="filter.aspx?cat=Perip">Peripherals</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="catalog.aspx">Product Catalog</a>


                        </li>
                        <li>
                            <asp:LinkButton ID="btnCart" runat="server" Text="Cart (0)" OnClick="btnCart_Click"></asp:LinkButton>
                       </li>
                        <li>
                            <asp:LinkButton ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click"></asp:LinkButton>
                        </li>

                    </ul>
                </nav>

            </div>
            <!-- Gigantic Heading -->
            <%--            <section class="wrapper style2">
                <div class="container">
                    <header class="major">
                        <h2>Featured Items</h2>
                    </header>
                </div>
            </section>--%>
            
            <section class="wrapper style1">
                <asp:Label runat="server" ID="lblCateg" Visible="false" />
                <div class="container">
                    <div id="content">
                        <!-- Content -->
                        <asp:DataList ID="dataview1" DataSourceID="SqlDataSource1" runat="server" RepeatColumns="2" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <article>
                                    <div class="box post">
                                        <a class="image left"><asp:ImageButton  NavigateUrl='<%# Eval("PID", "~/viewproduct.aspx?Id={0}") %>' runat="server" src='<%# Eval("PImgPath") %>' Width="100%" ID="Img"/><%--<img src='<%# Eval("PImgPath") %>' alt="" />--%></a>
                                        <div class="inner">
                                            <h3>
                                                <asp:HyperLink NavigateUrl='<%# Eval("PID", "~/viewproduct.aspx?Id={0}") %>' runat="server" Text='<%# Eval("PName") %>' /></h3>
                                            <p>
                                                <b>PHP </b><asp:Label ID="lblPrice" runat="server" Text=' <%# Eval("PPrice") %>' />
                                            </p>
                                        </div>
                                    </div>
                                </article>
                            </ItemTemplate>

                        </asp:DataList>
                    </div>
                </div>
            </section>


            <!-- Highlights -->
            <%--<img src='<%# Eval("PImgPath") %>' alt="" />--%>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:coe125ConnectionString %>" SelectCommand="SELECT * FROM [products] WHERE ([PCateg] = @PCateg)">
                <SelectParameters>
                    <asp:Parameter Name="PCateg" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>

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

