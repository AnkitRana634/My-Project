<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- breadcrumbs -->
    <div class="col-md-12">
        <div class="breadcrumbs">
            <div class="container">
                <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                    <li><a href="AdminHome.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                    <li class="active"><span class="fa fa-cart-arrow-down" aria-hidden="true"></span>My Cart</li>
                </ol>
            </div>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <div class="checkout">
        <div class="container">
            <div class="checkout-right">
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                
                <asp:Repeater ID="Repeater1" runat="server">
                    
                        
                            <HeaderTemplate>
                                <table class="timetable_sub">
                                    <thead>
                                        <tr>
                                            <th>Sr No.</th>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Product Name</th>

                                            <th>Price</th>
                                            <th>Remove</th>
                                        </tr>
                                    </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr class="rem1">
                                    <td class="invert">1</td>
                                    <td class="invert-image"><a href="single.html">
                                        <img src="<%#Eval("imgthumb") %>" alt=" " class="img-responsive" width="80px" height="100px" /></a></td>
                                    <td class="invert">
                                        <div class="quantity">
                                            <div class="quantity-select">
                                                <asp:TextBox ID="TextBox1" runat="server" text='<%#Eval("qty") %>' ></asp:TextBox>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="invert"><b><%#Eval("Pname") %></b><br /><%#Eval("description") %></td>

                                    <td class="invert"><%#Eval("Price") %></td>
                                    <td class="invert">
                                        <div class="rem">
                                            <div class="close1"></div>
                                        </div>
                                        <script>$(document).ready(function (c) {
                                                $('.close1').on('click', function (c) {
                                                    $('.rem1').fadeOut('slow', function (c) {
                                                        $('.rem1').remove();
                                                    });
                                                });
                                            });
                                        </script>
                                    </td>
                                </tr>

                                </table>

                                <br />
                            </ItemTemplate>
                      
                </asp:Repeater>
            </div>
            <div class="checkout-left">
                <div class="checkout-left-basket">
                    <h4>Continue to basket</h4>
                    <ul>
                        <li>Product1 <i>-</i> <span>$15.00 </span></li>
                        <li>Product2 <i>-</i> <span>$25.00 </span></li>
                        <li>Product3 <i>-</i> <span>$29.00 </span></li>
                        <li>Total Service Charges <i>-</i> <span>$15.00</span></li>
                        <li>Total <i>-</i> <span>$84.00</span></li>
                    </ul>
                </div>
                <div class="checkout-right-basket">
                    <a href="single.html"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>Continue Shopping</a>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>

    <%--<table class="timetable_sub">
					<thead>
						<tr>
							<th>Sr No.</th>	
							<th>Product</th>
							<th>Quantity</th>
							<th>Product Name</th>
						
							<th>Price</th>
							<th>Remove</th>
						</tr>
					</thead>
					<tr class="rem1">
						<td class="invert">1</td>
						<td class="invert-image"><a href="single.html"><img src="images/1.png" alt=" " class="img-responsive" /></a></td>
						<td class="invert">
							 <div class="quantity"> 
								<div class="quantity-select">                           
                                    <asp:TextBox ID="txtQty" runat="server" TextMode="Number"></asp:TextBox>
								</div>
							</div>
						</td>
						<td class="invert">Tata Salt</td>
						
						<td class="invert">$290.00</td>
						<td class="invert">
							<div class="rem">
								<div class="close1"> </div>
							</div>
							<script>$(document).ready(function(c) {
								$('.close1').on('click', function(c){
									$('.rem1').fadeOut('slow', function(c){
										$('.rem1').remove();
									});
									});	  
								});
						   </script>
						</td>
					</tr>
					
				</table>--%>
</asp:Content>

