using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// Declare the namespaces WAKAKAKA!
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Admin_Products_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetCategoryTypes();
        }
    }

    /// <summary>
    /// Allows the user to display list of category types
    /// from the table types to the dropdownlist control
    /// </summary>
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

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //if (FileImageUpload.PostedFile != null)
        //{
            //string ImageName = Path.GetFileName(FileImageUpload.PostedFile.FileName);

            //Save files to disk
           // FileImageUpload.SaveAs(Server.MapPath("img/" + ImageName));
            using (SqlConnection con = new SqlConnection(Wiggle.GetConnection()))
            {
                con.Open();
                string SQL = @"INSERT INTO Products VALUES (@Name, @CatID, 
            @Code, @Description, @Image, @Price, @IsFeatured, 
            @Available, @Criticallevel, @Maximum, @Status, @DateAdded, @DateModified)";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@Name", txtProductName.Text);
                    cmd.Parameters.AddWithValue("@CatID", ddlCategoryTypes.SelectedValue);
                    cmd.Parameters.AddWithValue("@Code", txtCode.Text);
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text);

                    string fileExt = Path.GetExtension(FileImageUpload.FileName);
                    string id = Guid.NewGuid().ToString();
                    cmd.Parameters.AddWithValue("@Image", id + fileExt);
                    FileImageUpload.SaveAs(Server.MapPath("~/img/" + id + fileExt));
                    cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
                    cmd.Parameters.AddWithValue("@IsFeatured", ddlIsFeatured.SelectedValue);
                    //cmd.Parameters.AddWithValue("@Available", txtAvailable.Text);
                    cmd.Parameters.AddWithValue("@Criticallevel", txtCritical.Text);
                    cmd.Parameters.AddWithValue("@Maximum", txtMaximum.Text);
                    cmd.Parameters.AddWithValue("@Status", "Active");
                    cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);
                    cmd.Parameters.AddWithValue("@DateModified", DBNull.Value);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("Default.aspx");
                }
            }
        //}
    }
}