<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewproduct.aspx.cs" Inherits="Shop125MP.viewproduct" %>

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
                    <div class="row 200%">
                        <div class="4u 12u(narrower)">
                            <div id="sidebar">

                                <!-- Content -->

                                <article>
                                    <header>
                                        <h2>
                                            <asp:Label ID="lblPname" runat="server"></asp:Label></h2>
                                        <p>
                                            <asp:Label ID="lblPcateg" runat="server"></asp:Label>
                                        </p>
                                    </header>
                                    <asp:Image ID="Pimg" runat="server" size="100%" />



                                </article>

                            </div>
                        </div>
                        <div class="4u 12u(narrower) important(narrower)">
                            <div id="content">

                                <!-- Content -->

                                <article>
                                    <h1>Product Description</h1>
                                    <p>
                                        <asp:Label ID="lblPdesc" runat="server"></asp:Label>
                                    </p>
                                </article>

                            </div>
                        </div>
                        <div class="4u 12u(narrower)">
                            <div id="sidebar2">

                                <!-- Sidebar -->

                                <section>
                                    Price:
                                    <br />
                                    <h3>PHP
                                        <asp:Label ID="lblPprice" runat="server"></asp:Label></h3>
                                    <asp:Label runat="server" Text="Item out of stock" ID="lblNoStock" Visible="false" ForeColor="#CC3300"></asp:Label>
                                    <footer>
                                        <a class="button">
                                            <asp:Button runat="server" Text="Add to Cart" ID="btnAddCart" OnClick="btnAddCart_Click" /></a>
                                            
                                    </footer>
                                </section>



                            </div>
                        </div>

                    </div>
            
                    <a name="comment"></a>
                    <h3>Rate and comment</h3>
                        
                    <asp:TextBox ID="txtComment" Height="150px" runat="server" TextMode="MultiLine" Style="resize: none" Wrap="true"></asp:TextBox>
                    <br />
                    <div class="row 200%">
                    <div class="7u 12u(narrower)">
                    &nbsp Rate Item: <asp:DropDownList ID="ddlRating" runat="server"  Width="40" Height="40px">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    </asp:DropDownList>
                        <i><asp:Label runat="server" ID="lblErr" Visible="False" ForeColor="#CC3300"></asp:Label></i>
                        </div>
                    <div class="5u 12u(narrower)">                        
                        <i><asp:Label ID="lblSign" runat="server"></asp:Label></i> &nbsp&nbsp
                    <asp:Button runat="server" Text="Post" ID="btnPost" OnClick="btnPost_Click"/>
                       </div>
                        </div>
                    <br />
                    <h3>Customer Review & Rating:</h3>
                      <asp:DataList ID="dataview1" runat="server" DataSourceID="SqlDataSource2" RepeatColumns="1" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <article>
                                    <p><asp:Label runat="server" text='<%# Eval("uname") %>' Font-Bold="True" />&nbsp &nbsp<asp:Label runat="server" Text='<%# Eval("date") %>' Font-Size="Medium" ForeColor="#CCCCCC"></asp:Label>
                                    <br />
                                        <asp:Label runat="server" Text="Rating: " Font-Size="Large" />
                                        <asp:Label runat="server" text='<%#Eval("rating")%>' Font-Size="Large" />
                                        <asp:Label runat="server" text="out of 5" Font-Size="Large"/>
                                        <br />
                                        <asp:Label runat="server" text='<%# Eval("comment") %>' Font-Size="Medium" />
                                        </p>
                                    
                                </article>
                            </ItemTemplate>

                        </asp:DataList>
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

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:coe125ConnectionString %>" SelectCommand="getComments" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter Name="pid" QueryStringField="id" Type="Int32" />
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

