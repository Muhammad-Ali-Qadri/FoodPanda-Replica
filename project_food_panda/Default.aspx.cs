using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;
namespace project_food_panda
{
    public partial class _Default : Page
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        int first = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }
            if (Session["logintype"] != null)
            {
                if (Session["logintype"].ToString() == "User")
                {
    
                }
                else
                {
                    Response.Redirect("~/Forms/adminlogin.aspx");
                }
            }
            if (first == 0)
            {
                LoadRestauran_city();
                LoadRestauran_town();
                first = -1;
            }
            
        }

        
        protected void cmd_seehow_Click(object sender, EventArgs e)
        {

            if (div1.Style["display"] == "none")
            {
                div1.Style["display"] = "block";
            }
            else if (div1.Style["display"] == "block")
            {
                div1.Style["display"] = "none";
            }


        }

        protected void list_area_selectedindexchange(object sender, EventArgs e)
        {
            LoadRestauran_town();
        }

        public void LoadRestauran_city()
        {

            DataTable restaurants = new DataTable();
            SqlConnection con = new SqlConnection(connString);

            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("fp_proj.load_city", con);  //instantiate SQL command
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.ExecuteNonQuery();

                da.Fill(restaurants);

                list_city.DataSource = restaurants;
                list_city.DataTextField = "City";
                list_city.DataValueField = "City";
                list_city.DataBind();

                cmd.Dispose();
                da.Dispose();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('SQL Error: " + ex + "') </script>");
            }
            con.Close();
        }


        public void LoadRestauran_town()
        {

            DataTable areas = new DataTable();
            SqlConnection con = new SqlConnection(connString);

            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("fp_proj.load_area", con);  //instantiate SQL command
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command

                cmd.Parameters.AddWithValue("@city", list_city.SelectedValue);
                string test = cmd.Parameters["@city"].Value.ToString();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.ExecuteNonQuery();

                da.Fill(areas);

                list_area.DataSource = areas;
                list_area.DataTextField = "Town";
                list_area.DataValueField = "Town";
                list_area.DataBind();

                cmd.Dispose();
                da.Dispose();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('SQL Error: " + ex + "') </script>");
            }
            con.Close();
        }

        protected void cmd_search_Click(object sender, EventArgs e)
        {
            Session["city"] = list_city.SelectedValue.ToString();
            Session["area"] = list_area.SelectedValue.ToString();
            Response.Redirect("~/Forms/Restaurants.aspx");
        }
    }
}