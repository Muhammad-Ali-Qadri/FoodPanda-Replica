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
    public partial class aFoodItems : System.Web.UI.Page
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
                cmd = new SqlCommand("fp_proj.displayFoodItems", con);  //instantiate SQL command 
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
        protected void DeleteFood(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            string itemid = lnkRemove.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("fp_proj.deleteFoodItems", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@itemid", itemid);


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
        protected void AddNewFood(object sender, EventArgs e)
        {
            string Restaurantid = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insRestaurantID")).Text;
            string Itemname = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insItemName")).Text;
            string Item_des = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insItem_Desc")).Text;
            string Cuisine = ((System.Web.UI.WebControls.DropDownList)GridView1.FooterRow.FindControl("insCuisine")).SelectedItem.Text;
            string price = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insPrice")).Text;

            if (Regex.IsMatch(Restaurantid, "^[0-9]+$")
                && Regex.IsMatch(Itemname, "^[a-zA-Z\x20]+$")
                && Regex.IsMatch(Item_des, "^[a-zA-Z\x20]+$")
                && Regex.IsMatch(price, "^(([0-9]|[1-9][0-9]+)(.[0-9]{1,2})?|.[0-9]{1,2})+$"))
            {
                SqlConnection con = new SqlConnection(connString);
                con.Open();
                SqlCommand cmd;

                try
                {
                    cmd = new SqlCommand("fp_proj.insertFoodItems", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Restaurantid", Restaurantid);
                    cmd.Parameters.AddWithValue("@Itemname", Itemname);
                    cmd.Parameters.AddWithValue("@Item_des", Item_des);
                    cmd.Parameters.AddWithValue("@Cuisine", Cuisine);
                    cmd.Parameters.AddWithValue("@price", price);


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
        protected void EditFood(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            loadgrid();

        }
        protected void UpdateFood(object sender, GridViewUpdateEventArgs e)
        {
            string itemid = ((System.Web.UI.WebControls.Label)GridView1.Rows[e.RowIndex].FindControl("lblItemID")).Text;
            string Restaurantid = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtRestaurantID")).Text;
            string Itemname = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtItemName")).Text;
            string Item_des = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtItem_Desc")).Text;
            string Cuisine = ((System.Web.UI.WebControls.DropDownList)GridView1.Rows[e.RowIndex].FindControl("txtCuisine")).SelectedItem.Text;
            string price = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPrice")).Text;

            if (Regex.IsMatch(Restaurantid, "^[0-9]+$")
                && Regex.IsMatch(Itemname, "^[a-zA-Z\x20]+$")
                && Regex.IsMatch(Item_des, "^[a-zA-Z\x20]+$")
                && Regex.IsMatch(price, "^(([0-9]|[1-9][0-9]+)(.[0-9]{1,2})?|.[0-9]{1,2})+$"))
            {
                SqlConnection con = new SqlConnection(connString);
                con.Open();
                SqlCommand cmd;

                try
                {
                    cmd = new SqlCommand("fp_proj.updateFoodItems", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@itemid", itemid);
                    cmd.Parameters.AddWithValue("@Restaurantid", Restaurantid);
                    cmd.Parameters.AddWithValue("@Itemname", Itemname);
                    cmd.Parameters.AddWithValue("@Item_des", Item_des);
                    cmd.Parameters.AddWithValue("@Cuisine", Cuisine);
                    cmd.Parameters.AddWithValue("@price", price);



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
        protected void CancelEditFood(object sender, GridViewCancelEditEventArgs e)
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