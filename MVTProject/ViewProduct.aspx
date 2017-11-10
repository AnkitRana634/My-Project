<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="ViewProduct.aspx.cs" Inherits="ViewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="productcss/js/jquery.flexslider.js"></script>
    <link href="productcss/css/flexslider.css" rel="stylesheet" media="screen" />
    <script src="productcss/js/imagezoom.js"></script>
    <style>
        .btn {
            width: auto;
            height: 50px;
            border-radius: 5px;
            font: bold;
            font-size: large;
        }

        #detail {
            width: 600px;
            margin: 10px 20px;
            text-align: left;
        }

        .title {
            font: bold;
            font-size: large;
            color: grey;
            padding: 5px 5px;
        }

        .data {
            padding: 5px 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:FormView ID="FormView1" runat="server">
        <ItemTemplate>
            <div class="products">
                <div class="container">
                    <div class="agileinfo_single">

                        <div class="col-md-4">
                            <div class="single-left ">
                                <div class="grid images_3_of_2">
                                    <div class="flexslider">

                                        <ul class="slides">
                                            <li data-thumb="ProductImg/<%#Eval("imgthumb") %>">
                                                <div class="thumb-image">
                                                    <img src="ProductImg/<%#Eval("imgthumb") %>" data-imagezoom="true" class="img-responsive">
                                                </div>
                                            </li>
                                            <li data-thumb="ProductImg/<%#Eval("imgfront") %>">
                                                <div class="thumb-image">
                                                    <img src="ProductImg/<%#Eval("imgfront") %>" data-imagezoom="true" class="img-responsive">
                                                </div>
                                            </li>
                                            <li data-thumb="ProductImg/<%#Eval("imgback") %>">
                                                <div class="thumb-image">
                                                    <img src="ProductImg/<%#Eval("imgback") %>" data-imagezoom="true" class="img-responsive">
                                                </div>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8 agileinfo_single_right">
                            <h2><%#Eval("Pname") %></h2>
                            <div class="rating1">
                                <span class="starRating">
                                    <input id="rating5" type="radio" name="rating" value="5">
                                    <label for="rating5">5</label>
                                    <input id="rating4" type="radio" name="rating" value="4">
                                    <label for="rating4">4</label>
                                    <input id="rating3" type="radio" name="rating" value="3" checked="">
                                    <label for="rating3">3</label>
                                    <input id="rating2" type="radio" name="rating" value="2">
                                    <label for="rating2">2</label>
                                    <input id="rating1" type="radio" name="rating" value="1">
                                    <label for="rating1">1</label>
                                </span>
                                &nbsp;
                            </div>
                            <div class="w3agile_description">
                                <h4>Description :</h4>
                                <p><%#Eval("desc") %></p>
                            </div>
                            <div class="snipcart-item block">
                                <div class="snipcart-thumb agileinfo_single_right_snipcart">
                                    <h4 class="m-sing">₹ <%#Eval("price") %><span></span></h4>
                                    <br />
                                    <br />

                                    <asp:Button ID="btnBuy" CssClass="btn" runat="server" Text="Buy Now" BackColor="#1B9405" ForeColor="White" />&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnAddCart" CssClass="btn" runat="server" Text="Add To Cart" BackColor="Red" ForeColor="White" OnClick="btnAddCart_Click" />
                            
                                    
                                </div>
                                <div class="snipcart-details agileinfo_single_right_details">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#collapse1" aria-expanded="true" aria-controls="collapse1">
                                            
                                            Detailed Description
                                        </a>
                                    </h4>
                                    <div id="collapse1" class="panel-collapse collapse" role="tabpanel">

                                        <table border="1" id="detail">
                                            <tr>
                                                <td class="title">Size</td>
                                                <td class="data"><%#Eval("size") %></td>
                                            </tr>
                                            <tr>
                                                <td class="title">Quantity</td>
                                                <td class="data"><%#Eval("qty") %></td>
                                            </tr>
                                            <tr>
                                                <td class="title">Material</td>
                                                <td class="data"><%#Eval("material") %></td>
                                            </tr>
                                            <tr>
                                                <td class="title">Color</td>
                                                <td class="data"><%#Eval("color") %></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <%--</div>--%>
        </ItemTemplate>
    </asp:FormView>
    <div class="newproducts-w3agile">
        <div class="container">
            <h3>New Products</h3>
            <div class="agile_top_brands_grids">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="col-md-3 top_brand_left-1">
                            <div class="hover14 column">
                                <div class="agile_top_brand_left_grid">
                                    <div class="agile_top_brand_left_grid_pos">
                                        <img src="images/offer.png" alt=" " class="img-responsive">
                                    </div>

                                    <div class="agile_top_brand_left_grid1">
                                        <figure>
                                            <div class="snipcart-item block">
                                                <div class="snipcart-thumb">
                                                    <a href="ViewProduct.aspx?id=<%#Eval("Id") %> ">
                                                        <img src="ProductImg/<%#Eval("imgthumb") %>" width="80px" height="90px" /></a>
                                                    <p><%#Eval("Pname") %></p>
                                                    <div class="stars">
                                                        <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star gray-star" aria-hidden="true"></i>
                                                    </div>
                                                    <h4>₹ <%#Eval("price") %> <span></span></h4>
                                                </div>
                                                <div class="snipcart-details top_brand_home_details">
                                                    <asp:LinkButton ID="AddCart" OnCommand="AddCart_Command" Text="Add To Cart" CssClass="btn" CommandArgument='<%#Eval("Id") %>' runat="server" ></asp:LinkButton>

                                                </div>
                                            </div>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <script>
        // Can also be used with $(document).ready()
        $(window).load(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
        });
    </script>
</asp:Content>

