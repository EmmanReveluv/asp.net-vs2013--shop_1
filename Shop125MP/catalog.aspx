<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="catalog.aspx.cs" Inherits="Shop125MP.catalog" %>

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
                <h1><a  id="logo">ROOKIE <em>TECH STORE</em></a></h1>

                <!-- Nav -->
                <nav id="nav">
                    <ul>
                        <li>
                            <a href="home.aspx">Featured</a></li>
                        <li >
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
                        <li class="current">
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
            
            <section class="wrapper style1">
                <div class="container">
                    <div id="content">
                        <!-- Content -->
                        <asp:DataList ID="dataview1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="2" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <article>
                                    <div class="box post">
                                        <a class="image left"><asp:ImageButton  NavigateUrl='<%# Eval("PID", "~/viewproduct.aspx?Id={0}") %>' runat="server" src='<%# Eval("PImgPath") %>' Width="100%" ID="Img" OnClick="Img_Click"/><%--<img src='<%# Eval("PImgPath") %>' alt="" />--%></a>
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
           <%-- <section class="wrapper style3">
                <div class="container">
                    <h2>About us</h2>
                    <div class="row 200%">

                        <section class="4u 12u(narrower)">
                            <div class="box highlight">
                                <h3>Browse</h3>
                                <p>Explore our product catalog which contains the latest tech devices and accessories.</p>
                            </div>
                        </section>
                        <section class="4u 12u(narrower)">
                            <div class="box highlight">
                                <h3>Purchase</h3>
                                <p>Instantly purchase our products through credit card or PayPal™.</p>
                            </div>
                        </section>
                        <section class="4u 12u(narrower)">
                            <div class="box highlight">
                                <h3>Contact us</h3>
                                <p>
                                    Send us a message
                                    <asp:HyperLink runat="server">here.</asp:HyperLink>
                                </p>
                            </div>
                        </section>
                    </div>
                </div>
            </section>--%>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:coe125ConnectionString %>" SelectCommand="viewCatalog" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

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

