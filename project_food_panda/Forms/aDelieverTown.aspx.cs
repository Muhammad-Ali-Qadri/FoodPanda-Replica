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
    public partial class aDelieverTown : System.Web.UI.Page
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
                cmd = new SqlCommand("fp_proj.displayDelieverTown", con);  //instantiate SQL command 
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
        protected void DeleteTown(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            string[] commandArgs = lnkRemove.CommandArgument.ToString().Split(new char[] { ',' });
            string restaurantid = commandArgs[0];
            string town = commandArgs[1];
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("fp_proj.deleteDelieverTown", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@restaurantid", restaurantid);
                cmd.Parameters.AddWithValue("@town", town);


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
        protected void AddNewTown(object sender, EventArgs e)
        {
            string restaurantid = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insRestaurantID")).Text;
            string town = ((System.Web.UI.WebControls.TextBox)GridView1.FooterRow.FindControl("insTown")).Text;

            if (Regex.IsMatch(restaurantid, "^[0-9]+$")
                && Regex.IsMatch(town, "^[a-zA-Z\x20]+$"))
            {
                SqlConnection con = new SqlConnection(connString);
                con.Open();
                SqlCommand cmd;

                try
                {
                    cmd = new SqlCommand("fp_proj.insertDelieverTown", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@restaurantid", restaurantid);
                    cmd.Parameters.AddWithValue("@town", town);



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
        public void warningmsg(string msg)
        {
            MessageBox.Show(msg,
            "Warning",
            MessageBoxButtons.OK,
            MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
        }
    }
}