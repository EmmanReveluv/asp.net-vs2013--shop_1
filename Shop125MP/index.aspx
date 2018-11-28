<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Shop125MP.index" %>

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
                        <li >
                            <asp:LinkButton ID="btnCart" runat="server" Text="Cart (0)" OnClick="btnCart_Click"></asp:LinkButton>
                        </li>
                        <li class="current">
                            <asp:LinkButton ID="btnLogout" runat="server" Text="Login" OnClick="btnLogout_Click"></asp:LinkButton>
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


                                <h2>Login to your account</h2>
                                <asp:Label ID="lblError" runat="server"/>
                                
                                <asp:TextBox ID="txtUname" runat="server" placeholder="Username"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtPassword" runat="server" type="password" placeholder="Password"></asp:TextBox>
                                <br />
                                <asp:Button ID="loginBtn" runat="server" Text="Login" BackColor="#33B5E5" ForeColor="White" OnClick="loginBtn_Click1" />


                            </div>
                        </div>
                        <div class="4u 12u(narrower)">
                            <div id="sidebar">
                                <h2>Create an account</h2>                                
                                <asp:Label ID="lblErrorReg" runat="server" Visible="false" ForeColor="#CC3300" />
                                <asp:TextBox ID="txtUnameNew" runat="server" placeholder="Username" OnTextChanged="txtUnameNew_TextChanged"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtPasswordNew" runat="server" placeholder="Password" type="password"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtPasswordConfirm" runat="server" placeholder="Confirm Password" type="password"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtEmail" runat="server" placeholder="E-Mail"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtPhone" runat="server" placeholder="Phone Number" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>
                                <br />
                                <asp:Button ID="regBTN" runat="server" Text="Register" OnClick="regBTN_Click" BackColor="#33B5E5" ForeColor="White" />

                                                             
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


