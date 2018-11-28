<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminadd.aspx.cs" Inherits="Shop125MP.adminadd"  validateRequest="false"  %>
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

                    <div class="row 200%">
                        <div class="2u 12u(narrower)">
                        </div>
                        <div class="4u 12u(narrower)">
                            <div id="content">
                                <asp:Label runat="server" Font-Size="Larger" Font-Bold="True">Add Item</asp:Label>
                                <br />
                                <!-- Content -->
                                Product ID:<br />
                                <asp:TextBox runat="server" ID="txtPID" Enabled="false" placeholder="Automatic"/>
                                Product Name:
                                <br />
                                <asp:TextBox runat="server" ID="txtPName" />
                                Product Category
                                <br />
                                <asp:TextBox runat="server" ID="txtCateg" />
                                Description
                                <br />
                                <asp:TextBox Height="150px" runat="server" TextMode="MultiLine" Style="resize: none" Wrap="true" ID="txtDesc" />
                                <br /><br />
                                
                                <asp:Button runat="server" ID="btnConfirm" Text="Add" OnClick="btnConfirm_Click" /><br />
                                <asp:Label runat="server" ID="lblErr" Visible="true" ForeColor="#CC3300" />
                            </div>
                        </div>
                        <div class="4u 12u(narrower)">
                            <div id="sidebar"><br />                                
                                Quantity
                                <br />
                                <asp:TextBox runat="server" ID="txtQuant" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"   Width="40%" Text="0" />
                                Featured? (1 - yes, 0 - no)<br />
                                <asp:TextBox runat="server" ID="txtFeat" text="0"  onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"/>
                                Price
                                <br />
                                <asp:TextBox runat="server" ID="txtPrice" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" />
                                Image Path
                                <br />
                                <asp:TextBox runat="server" ID="txtImgpath" text="assets/img/"/>
                                <br /><br />
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

