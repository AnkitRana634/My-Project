<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="product_list_view.aspx.cs" Inherits="testviewproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- main-slider -->
    <div class="row">
        <ul id="demo1">
            <li>
                <img src="images/11.jpg" alt="" />
                <!--Slider Description example-->
                <div class="slide-desc">
                    <h3>Buy Rice Products Are Now On Line With Us</h3>
                </div>
            </li>
            <li>
                <img src="images/22.jpg" alt="" />
                <div class="slide-desc">
                    <h3>Whole Spices Products Are Now On Line With Us</h3>
                </div>
            </li>

            <li>
                <img src="images/44.jpg" alt="" />
                <div class="slide-desc">
                    <h3>Whole Spices Products Are Now On Line With Us</h3>
                </div>
            </li>
        </ul>
    </div>
    <!-- //main-slider -->
    <div class="row">
        <div class="col-md-2 sidebar">
            <div class="panel title">
                <div class="panel-heading ">
                    <h3>Filters&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon  glyphicon-filter" style="text-align: right" aria-hidden="true"></span></h3>
                </div>
            </div>

            <div class="panel-group">
                <div class="panel panel-default">

                    <h4 class="panel-title">
                        <a data-toggle="collapse" href="#collapse1">Sort By Price</a>
                    </h4>
                    <br />

                    <div id="collapse1" class="panel-collapse collapse">
                        <div style="height: 40px">
                            <asp:TextBox ID="txtMin" runat="server" Width="60px"></asp:TextBox>
                            To
                            <asp:TextBox ID="txtMax" Width="60px" runat="server"></asp:TextBox></div>
                        <div style="height: 40px">
                            <asp:CheckBox ID="CheckBox1" runat="server" />&nbsp;Lower To higher</div>
                        <div style="height: 40px">
                            <asp:CheckBox ID="CheckBox2" runat="server" />&nbsp;Higher To Lower</div>
                    </div>

                    <h4 class="panel-title">
                        <a data-toggle="collapse" href="#collapse2">Sort By Size</a>
                    </h4>
                    <br />

                    <div id="collapse2" class="panel-collapse collapse">
                        <div style="height: 40px">
                            <asp:CheckBox ID="CheckBox3" runat="server" />&nbsp;Small</div>
                        <div style="height: 40px">
                            <asp:CheckBox ID="CheckBox4" runat="server" />&nbsp;Medium</div>
                        <div style="height: 40px">
                            <asp:CheckBox ID="CheckBox5" runat="server" />&nbsp;Large</div>
                    </div>



                </div>
            </div>

        </div>

        	
	<!-- //main-slider -->
    <div class="newproducts-w3agile">
        <div class="container">
           <%-- <h3>New Products</h3>--%>
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
                                                        <img src="ProductImg/<%#Eval("imgthumb") %>" width="80px" height="90px"/></a>
                                                    <p><%#Eval("Pname") %></p>
                                                    <div class="stars">
                                                        <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star gray-star" aria-hidden="true"></i>
                                                    </div>
                                                    <h4> ₹ <%#Eval("price") %> <span></span></h4>
                                                </div>
                                                <div class="snipcart-details top_brand_home_details">
                                                    <asp:Button ID="Button1" runat="server" Text="Add To Cart" cssclass="button"/>
                                                    
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

    </div>
     <%--<script>
        // Can also be used with $(document).ready()
        $(window).load(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
        });
    </script>--%>
</asp:Content>

