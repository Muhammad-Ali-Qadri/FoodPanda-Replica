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
    public partial class aDealDescription : System.Web.UI.Page
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                loadgrid2();
            }


        }
        public void loadgrid2()
        {

            DataTable dt = new DataTable(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("fp_proj.displayDealDescription", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.ExecuteNonQuery();
                da.Fill(dt); //Add the result  set  returned from SQLCommand to ds

                GridView2.DataSource = dt;//seting data source for this Grid
                GridView2.DataBind(); //bind the data source to this grid // fill the grid every time page loads
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
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            loadgrid2();
            GridView2.PageIndex = e.NewPageIndex;
            GridView2.DataBind();
        }
        protected void DeleteDealDescription(object sender, EventArgs e)
        {


            LinkButton lnkRemove = (LinkButton)sender;
            string[] commandArgs = lnkRemove.CommandArgument.ToString().Split(new char[] { ',' });
            string itemid = commandArgs[0];
            string dealid = commandArgs[1];
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("fp_proj.deleteDealDescription", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@dealid", dealid);
                cmd.Parameters.AddWithValue("@itemid", itemid);


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.ExecuteNonQuery();
                da.Dispose();
                loadgrid2();
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
        protected void AddNewDealDescription(object sender, EventArgs e)
        {

            string dealid = ((System.Web.UI.WebControls.TextBox)GridView2.FooterRow.FindControl("insDealID")).Text;
            string itemid = ((System.Web.UI.WebControls.TextBox)GridView2.FooterRow.FindControl("insItemID")).Text;
            string quantity = ((System.Web.UI.WebControls.TextBox)GridView2.FooterRow.FindControl("insQuantity")).Text;


            if (Regex.IsMatch(quantity, "^[0-9]+$")
                && Regex.IsMatch(itemid, "^[0-9]+$")
                && Regex.IsMatch(dealid, "^[0-9]+$"))
            {
                SqlConnection con = new SqlConnection(connString);
                con.Open();
                SqlCommand cmd;

                try
                {
                    cmd = new SqlCommand("fp_proj.insertDealDescription", con);
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@quantity", quantity);
                    cmd.Parameters.AddWithValue("@itemid", itemid);
                    cmd.Parameters.AddWithValue("@dealid", dealid);
                    cmd.Parameters.Add("@result", SqlDbType.Int).Direction = ParameterDirection.Output;


                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    cmd.ExecuteNonQuery();

                    int result = (int)cmd.Parameters["@result"].Value;
                    if (result == 1)
                    {
                        da.Dispose();
                        loadgrid2();
                    }
                    else
                    {
                        da.Dispose();
                        warningmsg("Input is not correct");
                    }

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

        protected void EditDealDescription(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            loadgrid2();

        }
        protected void UpdateDealDescription(object sender, GridViewUpdateEventArgs e)
        {
            string dealid = ((System.Web.UI.WebControls.Label)GridView2.Rows[e.RowIndex].FindControl("lblDealID")).Text;
            string itemid = ((System.Web.UI.WebControls.Label)GridView2.Rows[e.RowIndex].FindControl("lblItemID")).Text;
            string quantity = ((System.Web.UI.WebControls.TextBox)GridView2.Rows[e.RowIndex].FindControl("txtQuantity")).Text;


            if (Regex.IsMatch(quantity, "^[0-9]+$"))
            {
                SqlConnection con = new SqlConnection(connString);
                con.Open();
                SqlCommand cmd;

                try
                {
                    cmd = new SqlCommand("fp_proj.updateDealDescription", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@dealid", dealid);
                    cmd.Parameters.AddWithValue("@itemid", itemid);
                    cmd.Parameters.AddWithValue("@quantity", quantity);


                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    cmd.ExecuteNonQuery();
                    da.Dispose();
                    GridView2.EditIndex = -1;
                    loadgrid2();
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
        protected void CancelEditDealDescription(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            loadgrid2();
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