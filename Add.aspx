<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Admin_Products_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add a Product</title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1 class="text-center">Add a Product</h1>
        <div class="col-lg-12">
            <div class="well clearfix">
                <form runat="server" class="form-horizontal">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label col-lg-4">Product Name</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtProductName" runat="server"
                                    class="form-control" autocomplete="off"
                                    MaxLength="50" required />
                            </div>
                        </div>
                         <div class="form-group">
                            <label class="control-label col-lg-4">Category</label>
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlCategoryTypes" runat="server"
                                   CssClass="form-control" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Code</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtCode" runat="server"
                                    class="form-control" autocomplete="off"
                                    MaxLength="20" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Description</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"
                                    TextMode="MultiLine" Rows="5" required />
                            </div>
                        </div>
                        <%-- IMAGE --%>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Image</label>
                        <div class="col-lg-8">
                            <asp:FileUpload ID="FileImageUpload" runat="server" class="form-control" required />
                           <%-- <asp:Button ID="btnUpload" CssClass="btn btn-success pull-right" runat="server" Text="Upload"
                                OnClick="btnUpload_Click" />--%>
                        </div>
                    </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label col-lg-4">Price</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtPrice" runat="server"
                                    class="form-control" autocomplete="off"
                                    min="0.01" max="500000.00" step="0.01"
                                    type="number" required />
                            </div>
                        </div>
                         <div class="form-group">
                            <label class="control-label col-lg-4">Is Featured?</label>
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlIsFeatured" runat="server"
                                   CssClass="form-control" required >
                                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                    </asp:DropDownList>
                            </div>
                        </div>
                        <%--<div class="form-group">
                            <label class="control-label col-lg-4">Available</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtAvailable" runat="server"
                                    class="form-control" autocomplete="off"
                                    MaxLength="20" type="number" required />
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Critical Level</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtCritical" runat="server"
                                    class="form-control" autocomplete="off"
                                    MaxLength="20" type="number" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Maximum</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtMaximum" runat="server"
                                    class="form-control" autocomplete="off"
                                    MaxLength="20" type="number" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-4 col-lg-8">
                                <asp:Button ID="btnAdd" runat="server"
                                    class="btn btn-success pull-right"
                                    Text="Add" OnClick="btnAdd_Click" />
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</body>
</html>
