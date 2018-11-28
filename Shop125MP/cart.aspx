<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Shop125MP.cart" %>

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
                        <li class="current">
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
                    <div class="row 100%">
                        <div class="2u 12u(narrower)">
                        </div>
                        <div class="5u 12u(narrower)">
                            <div id="content">
                                <!-- Content -->
                                <asp:Label ID="lblCheck" runat="server" Visible="false" ForeColor="#009933" Text="Checkout Success" />
                                <h3><asp:Label runat="server" ID="lblHead" Text="Cart items/prices: " /></h3>

                                <asp:ListView ID="ListView1" runat="server">
                                    <ItemTemplate>
                                        <table style="table-layout: fixed">
                                            <tr>
                                                <td >
                                                    <asp:HyperLink runat="server" NavigateUrl='<%# Eval("cid", "~/cart.aspx?delete={0}") %>' text="X  " ForeColor="#CC3300" />
                                                    <asp:Label runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                                </td>
                                                <td style="text-align: right">
                                                    <asp:Label runat="server" Text='<%# Eval("price", "PHP {0}") %>' Font-Bold="True"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                        <div class="4u 12u(narrower)">
                            <div id="sidebar">
                                <br />
                                <br />
                                <asp:Label runat="server" ID="lblPrice" text="Total Price:"></asp:Label>
                                <br />
                                <asp:Label ID="lblTotal" runat="server" Font-Size="Larger" Font-Bold="True" />
                                <br />
                                <br />
                                <asp:Button runat="server" Text="Checkout" ID="btnCheckout" OnClick="btnCheckout_Click" /><br />
                                <br />
                                <asp:ImageButton runat="server" ImageUrl="~/assets/img/pp.png" Width="200px" ID="ImbPaypal" OnClick="ImbPaypal_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

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

