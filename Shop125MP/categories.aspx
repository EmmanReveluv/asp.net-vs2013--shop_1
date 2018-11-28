<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="categories.aspx.cs" Inherits="Shop125MP.categories" %>

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
                        <li class="current">
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
					<div class="container">
						
						<div class="row">
							<section class="3u 12u(narrower)">
								<div class="box post">
									<a href="#" class="image left"><img src="assets/img/laptop-icon-8.png" alt="" /></a>
									<div class="inner"><br />
										<h3><a href="filter.aspx?cat=Laptop">Laptops</a></h3>
										</div>
								</div>
							</section>
							<section class="3u 12u(narrower)">
								<div class="box post">
									<a href="#" class="image left"><img src="assets/img/computer-5.png" alt="" /></a>
									<div class="inner"><br />
										<h3><a href="filter.aspx?cat=Desktop">Desktops</a></h3>
										</div>
								</div>
							</section>
						
							<section class="3u 12u(narrower)">
								<div class="box post">
									<a href="#" class="image left"><img src="assets/img/488.png" alt="" /></a>
									<div class="inner"><br />
										<h3><a href="filter.aspx?cat=Phone">Smartphones</a></h3>
										</div>
								</div>
							</section>
							<section class="3u 12u(narrower)">
								<div class="box post">
									<a href="#" class="image left"><img src="assets/img/headphone-7.png" alt="" /></a>
									<div class="inner"><br />
										<h3><a href="filter.aspx?cat=Perip">Peripherals/Accessories</a></h3>
										</div>
								</div>
							</section>
						</div>
					</div>
				</section>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:coe125ConnectionString %>" SelectCommand="getFeatured" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

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

