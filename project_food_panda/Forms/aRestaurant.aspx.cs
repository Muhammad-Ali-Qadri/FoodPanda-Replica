using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Drawing;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;
namespace project_food_panda.Forms
{
    public partial class aRestaurant : System.Web.UI.Page
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadgrid();
            }


        }

        public void loadgrid()
        {

            DataTable dt = new DataTable(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("fp_proj.displayrest", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.ExecuteNonQuery();
                da.Fill(dt); //Add the result  set  returned from SQLCommand to ds

                GridView1.DataSource = dt;//seting data source for this Grid
                GridView1.DataBind(); //bind the data source to this grid // fill the grid every time page loads
                da.Dispose();
                dt.Dispose();
            }

            catch (SqlException ex)
            {
                MessageBox.Show("SQL error" + ex,
                 "Error",
                 MessageBoxButtons.OK,
                 MessageBoxIcon.Error, MessageBoxDefaultButton.Button1);
            }
            finally
            {
                con.Close();
            }


        }

        protected void DeleteRestaurant(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            string RestaurantID = lnkRemove.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("fp_proj.deleterest", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@RestaurantID", RestaurantID);


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.ExecuteNonQuery();
                da.Dispose();
                loadgrid();
            }
            catch (Exception ex)
            {
                MessageBox.Show("SQL error" + ex,
                 "Error",
                 MessageBoxButtons.OK,
                 MessageBoxIcon.Error, MessageBoxDefaultButton.Button1);
            }
            finally
            {
                con.Close();
            }
        }
        protected void AddNewRestaurant(object sender, EventArgs e)
        {
            string RestaurantName = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insRestaurantName")).Text;
            string City = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insCity")).Text;
            string Town = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insTown")).Text;
            string Address = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insAddress")).Text;
            string StartTime = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insStartTime")).Text;
            string EndTIme = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insEndTIme")).Text;
            string DeliveryFee = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insDeliveryFee")).Text;
            string DeliveryTime = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insDeliveryTime")).Text;
            string MinimumOrderValue = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insMinimumOrderValue")).Text;

            if (Regex.IsMatch(RestaurantName, "^[a-zA-Z\x20]+$")
              && Regex.IsMatch(City, "^[a-zA-Z]+$")
              && Regex.IsMatch(Town, "^[a-zA-Z\x20]+$")
              && Regex.IsMatch(DeliveryFee, "^(([0-9]|[1-9][0-9]+)(.[0-9]{1,2})?|.[0-9]{1,2})+$")
              && Regex.IsMatch(DeliveryTime, "^[0-9]+$")
              && Regex.IsMatch(StartTime, "([0-9]{2}):([0-9]{2}):([0-9]{2})")
              && Regex.IsMatch(EndTIme, "([0-9]{2}):([0-9]{2}):([0-9]{2})")
              && Regex.IsMatch(MinimumOrderValue, "^(([0-9]|[1-9][0-9]+)(.[0-9]{1,2})?|.[0-9]{1,2})+$"))
            {
                SqlConnection con = new SqlConnection(connString);
                con.Open();
                SqlCommand cmd;

                try
                {
                    cmd = new SqlCommand("fp_proj.insertrest", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@RestaurantName", RestaurantName);
                    cmd.Parameters.AddWithValue("@Town", Town);
                    cmd.Parameters.AddWithValue("@City", City);
                    cmd.Parameters.AddWithValue("@Address", Address);
                    cmd.Parameters.AddWithValue("@StartTime", StartTime);
                    cmd.Parameters.AddWithValue("@EndTIme", EndTIme);
                    cmd.Parameters.AddWithValue("@DeliveryFee", DeliveryFee);
                    cmd.Parameters.AddWithValue("@DeliveryTime", DeliveryTime);
                    cmd.Parameters.AddWithValue("@MinimumOrderValue", MinimumOrderValue);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    cmd.ExecuteNonQuery();
                    da.Dispose();
                    loadgrid();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("SQL error" + ex,
                     "Error",
                     MessageBoxButtons.OK,
                     MessageBoxIcon.Error, MessageBoxDefaultButton.Button1);
                }
                finally
                {
                    con.Close();
                }

            }
            else
            {
                warningmsg("Input is not correct");
            }
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            loadgrid();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
        protected void EditRestaurant(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            loadgrid();

        }
        protected void UpdateRestaurant(object sender, GridViewUpdateEventArgs e)
        {
            string RestaurantID = ((System.Web.UI.WebControls.Label)GridView1.Rows[e.RowIndex].FindControl("lblRestaurantID")).Text;
            string RestaurantName = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtRestaurantName")).Text;
            string City = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCity")).Text;
            string Town = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtTown")).Text;
            string Address = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtAddress")).Text;
            string StartTime = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtStartTime")).Text;
            string EndTIme = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEndTIme")).Text;
            string DeliveryFee = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtDeliveryFee")).Text;
            string DeliveryTime = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtDeliveryTime")).Text;
            string MinimumOrderValue = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtMinimumOrderValue")).Text;
            if (Regex.IsMatch(RestaurantName, "^[a-zA-Z\x20]+$")
               && Regex.IsMatch(City, "^[a-zA-Z]+$")
               && Regex.IsMatch(Town, "^[a-zA-Z\x20]+$")
               && Regex.IsMatch(DeliveryFee, "^(([0-9]|[1-9][0-9]+)(.[0-9]{1,2})?|.[0-9]{1,2})+$")
               && Regex.IsMatch(DeliveryTime, "^[0-9]+$")
               && Regex.IsMatch(StartTime, "([0-9]{2}):([0-9]{2}):([0-9]{2})")
               && Regex.IsMatch(EndTIme, "([0-9]{2}):([0-9]{2}):([0-9]{2})")
               && Regex.IsMatch(MinimumOrderValue, "^(([0-9]|[1-9][0-9]+)(.[0-9]{1,2})?|.[0-9]{1,2})+$"))
            {
                SqlConnection con = new SqlConnection(connString);
                con.Open();
                SqlCommand cmd;

                try
                {
                    cmd = new SqlCommand("fp_proj.updatetrest", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@RestaurantID", RestaurantID);
                    cmd.Parameters.AddWithValue("@RestaurantName", RestaurantName);
                    cmd.Parameters.AddWithValue("@Town", Town);
                    cmd.Parameters.AddWithValue("@City", City);
                    cmd.Parameters.AddWithValue("@Address", Address);
                    cmd.Parameters.AddWithValue("@StartTime", StartTime);
                    cmd.Parameters.AddWithValue("@EndTIme", EndTIme);
                    cmd.Parameters.AddWithValue("@DeliveryFee", DeliveryFee);
                    cmd.Parameters.AddWithValue("@DeliveryTime", DeliveryTime);
                    cmd.Parameters.AddWithValue("@MinimumOrderValue", MinimumOrderValue);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    cmd.ExecuteNonQuery();
                    da.Dispose();
                    GridView1.EditIndex = -1;
                    loadgrid();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("SQL error" + ex,
                     "Error",
                     MessageBoxButtons.OK,
                     MessageBoxIcon.Error, MessageBoxDefaultButton.Button1);
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                warningmsg("input is not corect");
            }
        }
        protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            loadgrid();
        }
        public void warningmsg(string msg)
        {
            MessageBox.Show(msg,
            "Warning",
            MessageBoxButtons.OK,
            MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
        }
    }
}