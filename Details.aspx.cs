using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// Declare the namespaces WAKAKAKA
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_Products_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack)
        {
            GetCategoryTypes();
        }
        //GetData(int.Parse(Request.QueryString["ID"].ToString()));
        if (Request.QueryString["ID"] != null) // query string is existing
        {
            int productID = 0; // initial value
            bool validID = int.TryParse(Request.QueryString["ID"].ToString(), out productID);

            if (validID)
            {
                if (!IsPostBack)
                {
                    GetData(productID);
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
        else // query string is not existing
        {
            Response.Redirect("Default.aspx");
        }
    }

    void GetData(int ID)
    {
        using (SqlConnection con = new SqlConnection(Wiggle.GetConnection()))
        {
            con.Open();
            string SQL = @"SELECT Name, CatID, Code, Description, Price, IsFeatured, Available, Criticallevel, Maximum FROM Products WHERE ProductID=@ProductID";

            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                cmd.Parameters.AddWithValue("@ProductID", ID);
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.HasRows) // record is existing
                    {
                        while (dr.Read())
                        {
                            ltID.Text = ID.ToString();
                            ltID2.Text = ID.ToString();
                            txtProductName.Text = dr["Name"].ToString();
                            ddlCategoryTypes.SelectedValue = dr["CatID"].ToString();
                            txtCode.Text = dr["Code"].ToString();
                            txtDescription.Text = dr["Description"].ToString();
                            txtPrice.Text = dr["Price"].ToString();
                            ddlIsFeatured.SelectedValue = dr["IsFeatured"].ToString();
                            txtAvailable.Text = dr["Available"].ToString();
                            txtCritical.Text = dr["Criticallevel"].ToString();
                            txtMaximum.Text = dr["Maximum"].ToString();
                        }
                    }
                    else // record is not existing
                    {
                        Response.Redirect("Default.aspx");
                    }
                }
            }
        }
    }

    void GetCategoryTypes()
    {
        using (SqlConnection con = new SqlConnection(Wiggle.GetConnection()))
        {
            con.Open();
            string SQL = @"SELECT CatID, Category FROM Categories";

            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    ddlCategoryTypes.DataSource = dr;
                    ddlCategoryTypes.DataTextField = "Category";
                    ddlCategoryTypes.DataValueField = "CatID";
                    ddlCategoryTypes.DataBind();

                    ddlCategoryTypes.Items.Insert(0, new ListItem("Select one...", ""));
                }
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (FileImageUpload.PostedFile != null)
        {
            string ImageName = Path.GetFileName(FileImageUpload.PostedFile.FileName);

            //Save files to disk
            FileImageUpload.SaveAs(Server.MapPath("img/" + ImageName));
            // Instantiation
            using (SqlConnection con = new SqlConnection(Wiggle.GetConnection()))
            {
                con.Open();
                string SQL = @"UPDATE Products SET Name=@Name, CatID=@CatID,
            Code=@Code, Description=@Description, Image=@Image, Price=@Price, IsFeatured=@IsFeatured, Available=@Available, Criticallevel=@Criticallevel, Maximum=@Maximum, Status=@Status, 
            DateModified=@DateModified WHERE ProductID=@ProductID";

                // parameterized query
                // CODE(correct): collective noun CODES(incorrect)
                // GET(correct) GETS (incorrect)
                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@Name", txtProductName.Text);
                    cmd.Parameters.AddWithValue("@CatID", ddlCategoryTypes.SelectedValue);
                    cmd.Parameters.AddWithValue("@Code", txtCode.Text);
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@Image", ImageName);
                    cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
                    cmd.Parameters.AddWithValue("@IsFeatured", ddlIsFeatured.Text);
                    cmd.Parameters.AddWithValue("@Available", txtAvailable.Text);
                    cmd.Parameters.AddWithValue("@Criticallevel", txtCritical.Text);
                    cmd.Parameters.AddWithValue("@Maximum", txtMaximum.Text);
                    cmd.Parameters.AddWithValue("@Status", "Active");
                    //cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);
                    cmd.Parameters.AddWithValue("@DateModified", DateTime.Now);
                    cmd.Parameters.AddWithValue("@ProductID", ltID.Text);
                    //"@SupplierID", ltID2.Text OR "@SupplierID", Request.QueryString["ID"].ToString() OR "@SupplierID", ltID.Text
                    cmd.ExecuteNonQuery();


                    Response.Redirect("Default.aspx");
                }

            }
        }
    }
}