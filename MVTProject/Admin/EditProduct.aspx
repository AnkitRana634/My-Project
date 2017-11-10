<%@ Page Title="" Language="C#" MasterPageFile="AdminMaster.master" AutoEventWireup="true" CodeFile="EditProduct.aspx.cs" Inherits="EditProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <!-- breadcrumbs -->
    <div class="col-md-10" >
        <div class="breadcrumbs">
            <div class="container">
                <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                    <li><a href="AdminHome.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                    <li class="active">Edit Product</li>
                </ol>
            </div>
        </div>
    </div>
    <!-- //breadcrumbs -->

    <!-- Sub Category Edit form -->
    <div class="col-md-10" style="background-color:lightgray">
        <div class="login">
            <div class="form-group">
                <h2>Edit Product</h2><br /><br />
                <div class="row">
                    <div class="col-sm-4 form-group">

                        <label>Choose Parent Category</label>
                        <asp:DropDownList ID="DDLPCat" Width="80%" CssClass="form-control" runat="server" OnSelectedIndexChanged="DDLPCat_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>

                    </div>

                    <div class="col-sm-4 form-group">

                        <label>Choose Sub Category</label>
                        <asp:DropDownList ID="DDLSCat" Width="80%" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLSCat_SelectedIndexChanged"></asp:DropDownList>

                    </div>
                    <div class="col-sm-4 form-group">

                        <label>Choose Product</label>
                        <asp:DropDownList ID="DDLProduct" Width="80%" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLProduct_SelectedIndexChanged"></asp:DropDownList>

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 form-group ">

                        <label>Product Name</label><br />
                        <asp:TextBox ID="txtPname" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-sm-6 form-group">

                        <label>Price</label><br />
                        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 form-group">

                        <label>Size</label><br />
                        <asp:TextBox ID="txtSize" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-sm-6 form-group">

                        <label>Quantity</label><br />
                        <asp:TextBox ID="txtQty" runat="server"></asp:TextBox>

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 form-group">

                        <label>Material</label><br />
                        <asp:TextBox ID="txtMaterial" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-sm-6 form-group">

                        <label>Color</label><br />
                        <asp:TextBox ID="txtColor" runat="server"></asp:TextBox>

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 form-group">

                        <label>Description</label><br />
                        <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Width="50%"></asp:TextBox>

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4 form-group">
                        <label>Image Thumb</label><br />
                        <asp:FileUpload ID="FileUpload1" runat="server" /><br />
                        <asp:Image ID="Image1" runat="server" />
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                    </div>
                    <div class="col-sm-4 form-group">
                        <label>Image Front</label><br />
                        <asp:FileUpload ID="FileUpload2" runat="server" /><br />
                        <asp:Image ID="Image2" runat="server" />
                        <asp:HiddenField ID="HiddenField2" runat="server" />
                    </div>
                    <div class="col-sm-4 form-group">
                        <label>Image Back</label><br />
                        <asp:FileUpload ID="FileUpload3" runat="server" /><br />
                        <asp:Image ID="Image3" runat="server" />
                        <asp:HiddenField ID="HiddenField3" runat="server" />
                    </div>
                    <div class="row">
                        <div class="col-sm-12 form-group">
                            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-sm-12  ">
                            <div class="login-form-grids   " style="background-color:lightgray">
                            <asp:Button ID="btnUpdate" runat="server"  Text="Update Product" OnClick="btnUpdate_Click" />
                                </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <asp:GridView ID="GridView1" runat="server" Width="99%" AutoGenerateColumns="False"  CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateDeleteButton="True">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" />
                                <asp:BoundField DataField="pcatname" HeaderText="Parent Category" />
                                <asp:BoundField DataField="Subcatname" HeaderText="Sub Category" />
                                <asp:BoundField DataField="pname" HeaderText="Product Name" />
                                <asp:BoundField DataField="price" HeaderText="Price" />
                                <asp:BoundField DataField="qty" HeaderText="Quantity" />
                                <asp:ImageField HeaderText="Product Image" DataImageUrlField="imthumb" DataImageUrlFormatString="ProductImg/{0}">
                                    <ControlStyle Width="50px" Height="60px" />
                                </asp:ImageField>
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

