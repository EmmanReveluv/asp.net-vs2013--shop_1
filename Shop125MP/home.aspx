<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Shop125MP.home" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Rookie - Tech Store</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <%--    <link rel="stylesheet" href="assets/css/ie8.css" />
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
                            <a href="home.aspx">Featured</a></li>
                        <li>
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
            <!-- Banner -->
            <section id="banner">
                <header>
                    <h2>COE125 MP <em>eCommerce Web Application </em></h2>
                    <a href="catalog.aspx" class="button">Explore</a>
                </header>
            </section>

            <!-- featured items -->
            <section class="wrapper style1">
                <div class="container">
                    <h3>Featured Items:</h3>
                    <asp:DataList ID="dataview1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal">
                        <ItemTemplate>

                            <div class="box post">
                                <a class="image left">
                                    <asp:ImageButton NavigateUrl='<%# Eval("PID", "~/viewproduct.aspx?Id={0}") %>' runat="server" src='<%# Eval("PImgPath") %>' Width="100%" ID="Img" /><%--<img src='<%# Eval("PImgPath") %>' alt="" />--%></a>
                                <div class="inner">
                                    <h3>
                                        <asp:HyperLink NavigateUrl='<%# Eval("PID", "~/viewproduct.aspx?Id={0}") %>' runat="server" Text='<%# Eval("PName") %>' /></h3>
                                    <p>
                                        <b>PHP </b>
                                        <asp:Label ID="lblPrice" runat="server" Text=' <%# Eval("PPrice") %>' />
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>

                <!-- Highlights -->
                <div class="container">
                    <h2>About us</h2>
                    <div class="row">
                        <section class="6u 12u(narrower)">
                            <h3>Rookie Tech Store  <em>guarantees the following:</em></h3>
                            <p>
                                <em>• Fast user account creation<br />
                                    <br />
                                    • Easy catalog browsing      
                                <br />
                                    <br />
                                    • Create product reviews                                     
                                <br />
                                    <br />
                                    • Fast and easy checkout</em>
                            </p>


                        </section>
                        <section class="6u 12u(narrower)">
                            <h1>GROUP 3 <em> COLLEAGUE LEAGUE</em> </h1>
                            <h1>Group Members:</h1>
                            <p>
                                Almirañez, Denise Daine C.      <br />                      
                                Andres,Johann Sebastian A.<br />
                                Tan, Hannah Kay R.<br /><br /><em>
                                HTML5 Template used: <a href="https://html5up.net/arcana">Arcana by HTML5 UP</a><br />
                                Icons used: <a href="http://www.freeiconspng.com">http://www.freeiconspng.com</a><br />
                                Product images, price and description taken from: <a href="https://dynaquestpc.com/">DynaquestPC</a></em>
                            </p>

                        </section>
                    </div>
                    <div class="row 200%">

                        <section class="4u 12u(narrower)">
                            <div class="box highlight">
                                <%--<i class="icon major fa-paper-plane"></i>--%>
                                <img src="assets/img/browse.png" width="125" />
                                <h3>Browse</h3>
                                <p>Explore our product catalog which contains the latest tech devices and accessories.</p>
                            </div>
                        </section>
                        <section class="4u 12u(narrower)">
                            <div class="box highlight">
                                <%--<i class="icon major fa-pencil"></i>--%>                                
                                <img src="assets/img/pay.png" width="125" />
                                <h3>Purchase</h3>
                                <p>Instantly purchase our products through credit card or PayPal™.</p>
                            </div>
                        </section>
                        <section class="4u 12u(narrower)">
                            <div class="box highlight">
                                <%--<i class="icon major fa-wrench"></i>--%>
                                
                                <img src="assets/img/contact.png" width="125" />
                                <h3>Contact us</h3>
                                <p>
                                    Send us a feedback
                                    <a href="#contact"> here.</a>
                                </p>
                            </div>
                        </section>
                    </div>
                </div>
                <div id="footer">
                    <div class="container">
                        <div class="row">

                            <section class="12u 12u(narrower)">
                                <a name="contact"></a>
                                <h1>Feedback Form <em> <asp:Label runat="server" ID="lblError" Visible="false" ForeColor="#cc3300" Font-Italic="True" Font-Size="Medium" /></em></h1>

                                <div class="row 50%">
                                    <div class="6u 12u(mobilep)">
                                        <asp:TextBox ID="txtName" runat="server" placeholder="Name" />
                                    </div>
                                    <div class="6u 12u(mobilep)">
                                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" />
                                    </div>
                                </div>
                                <div class="row 50%">
                                    <div class="12u">
                                        <asp:TextBox ID="txtMessage" Height="150px" runat="server" TextMode="MultiLine" Style="resize: none" Wrap="true" placeholder="Message"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row 50%">
                                    <div class="12u">
                                        <ul class="actions">
                                            <li>
                                                <asp:Button runat="server" Text="Send Message" ID="btnMessage" OnClick="btnMessage_Click"  />
                                                
                                        </ul>
                                    </div>
                                </div>

                            </section>
                        </div>
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

