<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="Shop125MP.checkout" %>

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

                    <div class="row 200%">

                        <div class="2u 12u(narrower)">
                        </div>
                        <div class="4u 12u(narrower)">
                            <div id="content">
                                <asp:Label runat="server" Font-Size="Larger" Font-Bold="True">Credit Card Payment</asp:Label>
                                <br />
                                <!-- Content -->
                                Name:<br />
                                <asp:TextBox runat="server" ID="txtName" />
                                Email Address:
                                <br />
                                <asp:TextBox runat="server" ID="txtEmail" />
                                Address line 1:
                                <br />
                                <asp:TextBox runat="server" ID="txtAd1" />
                                Address line 2:
                                <br />
                                <asp:TextBox runat="server" ID="txtAd2" /><br />
                                
                                <asp:Label runat="server" Font-Size="Large" Font-Italic="true">Accepted Cards:</asp:Label>
                                <asp:Image runat="server" ImageUrl="~/assets/img/accepted.png" width="300px"/><br />
                                
                            </div>
                        </div>
                        <div class="4u 12u(narrower)">
                            <div id="sidebar"><br />
                                Credit Card Type:<br />
                                <asp:DropDownList ID="ddlCCType" runat="server" Height="100%" Width="100%">
                                    <asp:ListItem>Visa</asp:ListItem>
                                    <asp:ListItem>Mastercard</asp:ListItem>
                                    <asp:ListItem>Discover</asp:ListItem>
                                    <asp:ListItem>American Express</asp:ListItem>
                                </asp:DropDownList><br /><br />
                                Credit Card Number:<br />
                                <asp:TextBox runat="server" ID="txtCCNum" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" MaxLength="16" />
                                Expiration Date (mm/yy):
                                <br />
                                <asp:TextBox runat="server" ID="txtCCEx" Width="40%" MaxLength="5"  />
                                Security Code: 
                                <br />
                                <asp:TextBox runat="server" ID="txtCCSec" Width="40%" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" MaxLength="4" /><br /><br />
                                <asp:Button runat="server" ID="btnConfirm" Text="Confirm" OnClick="btnConfirm_Click" /><br />
                            <asp:Label runat="server" ID="lblErr" Visible="true" ForeColor="#CC3300" />
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

