<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Admin_Products_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title class="text-center">View Product #<asp:Literal ID="ltID" runat="server" />Details</title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1 class="text-center">View Product #<asp:Literal ID="ltID2" runat="server" />
            Details</h1>
        <div class="col-lg-12">
            <div class="well clearfix">
                <form runat="server" class="form-horizontal">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label col-lg-4">Product Name</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtProductName" runat="server"
                                    class="form-control" autocomplete="off"
                                    MaxLength="100" required />
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
                                    MaxLength="450" TextMode="MultiLine" Rows="5" required />
                            </div>
                        </div>
                        <%-- IMAGE --%>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Image</label>
                        <div class="col-lg-8"> <%--col-lg-offset-9 col-lg-3--%>
                            <asp:FileUpload ID="FileImageUpload" runat="server" />
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
                                    MaxLength="18" type="money" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Is Featured?</label>
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlIsFeatured" runat="server"
                                    CssClass="form-control" required>
                                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Available</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtAvailable" runat="server"
                                    class="form-control" autocomplete="off"
                                    MaxLength="20" type="number" required />
                            </div>
                        </div>
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
                                <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-success pull-right" Text="Update" OnClick="btnUpdate_Click" />
                                <a href="Default.aspx" class="btn btn-default btn-lg">Back
                                </a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</body>
</html>
