<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Products_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%--<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server"
        <i class="fa fa-cutlery"></i>View Products
    </asp:Content>--%>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1 class="text-center">View Products</h1>
        <div class="col-lg-12">
            <div class="well">
                <%--<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">--%>
                <form runat="server" class="form-horizontal">
                    <asp:Panel ID="pnlProducts" runat="server"
                        DefaultButton="btnSearch">
                        <div class="col-lg-3 pull-right">
                        <div class="input-group">
                            <asp:TextBox ID="txtKeyword" runat="server" class="form-control" placeholder="Keyword..." />
                            <span class="input-group-btn">
                                <asp:LinkButton ID="btnSearch" runat="server" class="btn btn-info" OnClick="btnSearch_Click">
                                    <i class="fa fa-search"></i>
                                </asp:LinkButton>
                            </span>
                        </div>
                    </div>
                    <div class="row">
                        <br /> <br />

                    </div>
                    <table class="table table-hover">
                       <%-- <div class="col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Search By:</span>
                                <asp:DropDownList ID="ddlTypes" runat="server" class="form-control"
                                    OnSelectedIndexChanged="ddlTypes_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem>Keyword</asp:ListItem>
                                    <asp:ListItem>Status</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div id="keyword" runat="server" class="col-lg-4" visible="true">
                            <div class="input-group">
                                <asp:TextBox ID="txtSearch" runat="server" class="form-control" placeholder="Keyword..."
                                    OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" />
                                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                            </div>
                        </div>
                        <div id="status" runat="server" class="col-lg-4" visible="false">
                            <asp:DropDownList ID="ddlStatus" runat="server" class="form-control">
                                <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>Inactive</asp:ListItem>
                                <asp:ListItem>Blocked</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <br /> <br />--%>
                        <thead>
                            <th>#</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Description</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Is Featured?</th>
                            <th>Date Added</th>
                            <th>Date Modified</th>
                            <th>Actions</th>
                        </thead>
                        <tbody>
                            <asp:ListView ID="lvProducts" runat="server"
                                OnPagePropertiesChanging="lvProducts_PagePropertiesChanging">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%-- script tag --%>
                                            <%# Eval("ProductID") %>
                                        </td>
                                        <td><%# Eval("Name") %></td>
                                        <td><%# Eval("CatID") %></td>
                                        <td><%# Eval("Description") %></td>
                                        <td>
                                            <img runat="server" src='<%# string.Concat("~/img/products/", Eval("Image")) %>'
                                                class="img-responsive" width="100" />
                                        </td>
                                        <td><%# Eval("Price", "{0: #,###.00}") %></td>
                                        <td><%# Eval("IsFeatured") %></td>
                                        <td><%# Eval("DateAdded", "{0:MMM dd, yyyy}") %></td>
                                        <!-- MMMM MMM MM dd d, yyyy yy HH hh:MM mm tt -->
                                        <td><%# Eval("DateModified", "{0: MMMM dd, yyyy}") %></td>
                                        <td>
                                            <a href='Details.aspx?ID=<%# Eval("ProductID") %>'
                                                class="btn btn-xs btn-info">
                                                <i class="fa fa-diamond"></i>
                                            </a>
                                            <a href='Delete.aspx?ID=<%# Eval("ProductID") %>'
                                                class="btn btn-xs btn-danger"
                                                onclick='return confirm("Are you sure?");'>
                                                <i class="fa fa-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <tr>
                                        <td colspan="8">
                                            <h2 class="text-center">
                                                No records found!
                                            </h2>
                                        </td>
                                    </tr>
                                </EmptyDataTemplate>
                            </asp:ListView>
                        </tbody>
                    </table>
                        <hr />
                        <asp:DataPager ID="dpProducts" runat="server" PageSize="4"
                            PagedControlID="lvProducts">
                            <Fields>
                                <asp:NumericPagerField ButtonType="Button"
                                    CurrentPageLabelCssClass="btn btn-info"
                                    NumericButtonCssClass="btn"
                                    NextPreviousButtonCssClass="btn"/>
                            </Fields>
                        </asp:DataPager>
                    </asp:Panel>
                </form>
             <%--</asp:Content>--%>
            </div>
        </div>
    </div>
</body>
</html>