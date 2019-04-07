using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;


namespace project_food_panda.Forms
{
    public partial class Checkout : System.Web.UI.Page
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        public static DataTable order_food = new DataTable();
        public static DataTable order_deals = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                order_deals = (DataTable)Session["order_deals"];
                order_food = (DataTable)Session["order_food"];
                lbl_total.Text = Session["total"].ToString();
                if (Session["id"] != null)
                {
                    filluser();
                }
            }
        }
        protected void filluser()
        {
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("fp_proj.filluser", con);  //instantiate SQL command
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command

                cmd.Parameters.AddWithValue("@id", Session["id"].ToString());
                cmd.Parameters.Add("@fname", SqlDbType.VarChar, 50).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@lname", SqlDbType.VarChar, 50).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@phone", SqlDbType.VarChar,50).Direction = ParameterDirection.Output;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.ExecuteNonQuery();
                
                string fname = cmd.Parameters["@fname"].Value.ToString();
                string lname = cmd.Parameters["@lname"].Value.ToString();
                string phone = cmd.Parameters["@phone"].Value.ToString();

                txt_firstname.Text = fname;
                txt_lastname.Text = lname;
                txt_phoneno.Text = phone;
                
                cmd.Dispose();
                da.Dispose();
            }
            catch (SqlException ex)
            {

                Response.Write("<script> alert('SQL Error: " + ex + "') </script>");
            }

            finally
            {
                con.Close();
            }

        }
        protected void cmd_buy_Click(object sender, EventArgs e)
        {
            int p = 1;
            lbl_delivery_warning.Style["visibility"] = "hidden";
            lbl_firstname_warning.Style["visibility"] = "hidden";
            lbl_lastname_warning.Style["visibility"] = "hidden";
            lbl_phoneno_warning.Style["visibility"] = "hidden";

            if (!Regex.IsMatch(txt_phoneno.Text, "^[0-9]+$") || (txt_phoneno.Text.Length != 10))
            {
                lbl_phoneno_warning.Style["visibility"] = "visible";
                lbl_phoneno_warning.Text = "Enter correct number";
                p = 0;
            }
            if (!Regex.IsMatch(txt_firstname.Text, "^[a-zA-Z\x20]+$"))
            {
                lbl_firstname_warning.Style["visibility"] = "visible";
                lbl_firstname_warning.Text = "Enter correct name";
                p = 0;
            }
            if (!Regex.IsMatch(txt_lastname.Text, "^[a-zA-Z\x20]+$"))
            {
                lbl_lastname_warning.Style["visibility"] = "visible";
                lbl_lastname_warning.Text = "Enter correct name";
                p = 0;
            }
            if (!Regex.IsMatch(txt_delivery_address.Text, "^[0-9a-zA-Z\x20,-]+$"))
            {
                lbl_firstname_warning.Style["visibility"] = "visible";
                lbl_firstname_warning.Text = "Enter correct address";
                p = 0;
            }
            if(p == 1)
            {
                add_order();
                Response.Write("<script> confirm('Order placed ! ') </script>");

                if(Session["id"] == null)
                {
                    Session.Abandon();
                }
                else
                {
                    string userid = Session["userid"].ToString();
                    string logintype = Session["logintype"].ToString();
                    string id = Session["id"].ToString();

                    Session.Abandon();

                    Session["userid"] = userid;
                    Session["logintype"] = "User";
                    Session["id"] = id;
                }
                Response.Redirect("~/Default.aspx");
            }
        }
        protected void  add_order_details(int orderid, int isdeal, DataTable mytable)
        {
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open();
            SqlCommand cmd;
            try
            {
                foreach (DataRow row in mytable.Rows)
                {
                    cmd = new SqlCommand("fp_proj.insorderdetails", con);  //instantiate SQL command
                    cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@orderid", orderid);
                    cmd.Parameters.AddWithValue("@itemid", int.Parse(row["ID"].ToString()));
                    cmd.Parameters.AddWithValue("@quantity", int.Parse(row["Quantity"].ToString()));
                    cmd.Parameters.AddWithValue("@subtotal", (int.Parse(row["Quantity"].ToString()) * int.Parse(row["Price"].ToString())));
                    cmd.Parameters.AddWithValue("@isdeal", isdeal);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    cmd.ExecuteNonQuery();
                    da.Dispose();
                    cmd.Dispose();
                }

            }
            catch (SqlException ex)
            {

                Response.Write("<script> alert('SQL Error: " + ex + "') </script>");
            }

            finally
            {
                con.Close();
            }
        }

        public void add_order()
        {
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("fp_proj.insorder", con);  //instantiate SQL command
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command

                if (Session["userid"] != null)
                {
                    cmd.Parameters.AddWithValue("@userid", int.Parse(Session["userid"].ToString()));
                }
                else
                {
                    cmd.Parameters.AddWithValue("@userid", DBNull.Value);
                }
                cmd.Parameters.AddWithValue("@restaurantid", int.Parse(Session["RestaurantID"].ToString()));
                cmd.Parameters.AddWithValue("@fname", txt_firstname.Text);
                cmd.Parameters.AddWithValue("@lname", txt_lastname.Text);
                cmd.Parameters.AddWithValue("@phone", txt_phoneno.Text.ToString());
                cmd.Parameters.AddWithValue("@address", txt_delivery_address.Text);
                cmd.Parameters.AddWithValue("@bill", lbl_total.Text);
                cmd.Parameters.Add("@orderid", SqlDbType.Int).Direction = ParameterDirection.Output;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.ExecuteNonQuery();


                int orderid = int.Parse(cmd.Parameters["@orderid"].Value.ToString());
                add_order_details(orderid, 0, order_food);
                add_order_details(orderid, 1, order_deals);
                cmd.Dispose();
                da.Dispose();

            }
            catch (SqlException ex)
            {

                Response.Write("<script> alert('SQL Error: " + ex + "') </script>");
            }

            finally
            {
                con.Close();
            }
        }
    }
}