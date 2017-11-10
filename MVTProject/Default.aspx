<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- main-slider -->
		<ul id="demo1">
			<li>
				<img src="images/11.jpg" alt="" />
				<!--Slider Description example-->
				<div class="slide-desc">
					<h3>Buy Any Products Are Now On Line With Us</h3>
				</div>
			</li>
			<li>
				<img src="images/22.jpg" alt="" />
				  <div class="slide-desc">
					<h3>Whole Fashion Products Are Now On Line With Us</h3>
				</div>
			</li>
			
			<li>
				<img src="images/44.jpg" alt="" />
				<div class="slide-desc">
					<h3>Whole Style Products Are Now On Line With Us</h3>
				</div>
			</li>
		</ul>
	<!-- //main-slider -->
    <div class="newproducts-w3agile">
        <div class="container">
            <h3>New Products</h3>
            <div class="agile_top_brands_grids">
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
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
</asp:Content>

