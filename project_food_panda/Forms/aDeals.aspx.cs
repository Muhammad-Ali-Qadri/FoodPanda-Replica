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
    public partial class aDeals : System.Web.UI.Page
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
                cmd = new SqlCommand("fp_proj.displayDeals", con);  //instantiate SQL command 
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
        protected void DeleteDeals(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            string dealid = lnkRemove.CommandArgument.ToString();

            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("fp_proj.deleteDeals", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@dealid", dealid);


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
        protected void AddNewDeals(object sender, EventArgs e)
        {


            string Restaurantid = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insRestaurantID")).Text;
            string Dealname = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insDealName")).Text;
            string dealprice = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insDealPrice")).Text;
            string description = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insDescription")).Text;

            if (Regex.IsMatch(Restaurantid, "^[0-9]+$")
                && Regex.IsMatch(Dealname, "^[a-zA-Z\x20]+$")
                && Regex.IsMatch(dealprice, "^(([0-9]|[1-9][0-9]+)(.[0-9]{1,2})?|.[0-9]{1,2})+$"))
            {
                SqlConnection con = new SqlConnection(connString);
                con.Open();
                SqlCommand cmd;

                try
                {
                    cmd = new SqlCommand("fp_proj.insertDeals", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Restaurantid", Restaurantid);
                    cmd.Parameters.AddWithValue("@Dealname", Dealname);
                    cmd.Parameters.AddWithValue("@dealprice", dealprice);
                    cmd.Parameters.AddWithValue("@description", description);

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
        protected void EditDeals(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            loadgrid();

        }
        protected void UpdateDeals(object sender, GridViewUpdateEventArgs e)
        {

            string dealid = ((System.Web.UI.WebControls.Label)GridView1.Rows[e.RowIndex].FindControl("lblDealID")).Text;
            string Restaurantid = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtRestaurantID")).Text;
            string Dealname = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtDealName")).Text;
            string dealprice = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtDealPrice")).Text;
            string description = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].FindControl("txtDescription")).Text;

            if (Regex.IsMatch(Restaurantid, "^[0-9]+$")
                && Regex.IsMatch(Dealname, "^[a-zA-Z\x20]+$")
                && Regex.IsMatch(dealprice, "^(([0-9]|[1-9][0-9]+)(.[0-9]{1,2})?|.[0-9]{1,2})+$"))
            {
                SqlConnection con = new SqlConnection(connString);
                con.Open();
                SqlCommand cmd;

                try
                {
                    cmd = new SqlCommand("fp_proj.updateDeals", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@dealid", dealid);
                    cmd.Parameters.AddWithValue("@Restaurantid", Restaurantid);
                    cmd.Parameters.AddWithValue("@Dealname", Dealname);
                    cmd.Parameters.AddWithValue("@dealprice", dealprice);
                    cmd.Parameters.AddWithValue("@description", description);


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
        protected void CancelEditDeals(object sender, GridViewCancelEditEventArgs e)
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