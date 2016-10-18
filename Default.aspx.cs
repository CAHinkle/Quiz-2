using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// Declare the namespaces WAKAKAKA
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Products_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetProducts();
        }

    }
    /// <summary>
    /// Allows the user to display list of products from
    /// a listview control.
    /// Write something here.
    /// </summary>
    void GetProducts()
    {
        using (SqlConnection con = new SqlConnection(Wiggle.GetConnection()))
        {
            con.Open();
            string SQL = @"SELECT Products.ProductID, Products.Name, Categories.CatID, " +
            "Products.Code, Products.Description, Products.Image, Products.Price, " +
            "Products.IsFeatured, Products.DateAdded, Products.DateModified, Products.Status " +
            "FROM Products INNER JOIN Categories ON Products.CatID = Categories.CatID";
            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Products");

                    lvProducts.DataSource = ds;
                    lvProducts.DataBind();
                    con.Close();
                }
            }
        }
    }
    /// <summary>
    /// Allows the user to display list of products
    /// to a listview based from a keyword
    /// </summary>
    /// <param name="keyword"></param>
    void GetProducts(string keyword)
    {
        using (SqlConnection con = new SqlConnection(Wiggle.GetConnection()))
        {
            con.Open();
            string SQL = @"SELECT ProductID, Name, CatID, Code, Description, Image, Price, IsFeatured, DateAdded, DateModified FROM Products 
            WHERE ProductID LIKE @keyword OR Name LIKE @keyword OR CatID LIKE @keyword OR Code LIKE @keyword OR Description LIKE @keyword OR Image LIKE @keyword OR Price LIKE @keyword OR IsFeatured LIKE @keyword";
            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                cmd.Parameters.AddWithValue("@keyword", "%" + keyword + "%");
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Products");

                    lvProducts.DataSource = ds;
                    lvProducts.DataBind();
                }


            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

        if (txtKeyword.Text == "")
        {
            GetProducts();
        }
        else
        {
            GetProducts(txtKeyword.Text);
        }
    }

    protected void lvProducts_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpProducts.SetPageProperties(e.StartRowIndex,
            e.MaximumRows, false);
        if (txtKeyword.Text == "")
        {
            GetProducts();
        }
        else
        {
            GetProducts(txtKeyword.Text);
        }
    }
}