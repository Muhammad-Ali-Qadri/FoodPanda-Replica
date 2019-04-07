using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using System.ComponentModel.DataAnnotations;

namespace project_food_panda.Forms
{
    public partial class Login1 : System.Web.UI.Page
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmd_login_Click(object sender, EventArgs e)
        {
            if (new EmailAddressAttribute().IsValid(txt_email.Text))
            {
                login();
            }
            else
            {
                Response.Write("<script> alert('Invalid email or Password') </script>");
            }
        }

        public void login()
        {
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("fp_proj.checklogin", con);  //instantiate SQL command
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command

                cmd.Parameters.AddWithValue("@email", txt_email.Text);
                cmd.Parameters.AddWithValue("@password", txt_password.Text);
                cmd.Parameters.AddWithValue("@type", chose_type.SelectedValue.ToString());
                chose_type.SelectedIndex.ToString();
                cmd.Parameters.Add("@check", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@userid", SqlDbType.Int).Direction = ParameterDirection.Output;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.ExecuteNonQuery();


                int output = (int)cmd.Parameters["@check"].Value;

                if (output == 1)
                {
                    if (chose_type.SelectedValue.ToString() == "0")
                    {
                        int userid = (int)cmd.Parameters["@userid"].Value;
                        Session["userid"] = userid;
                        Session["id"] = txt_email.Text;         //For any user
                        Session["logintype"] = "User";
                        Response.Redirect("~/Default.aspx");
                    }
                    else if (chose_type.SelectedValue.ToString() == "1")
                    {
                        Session["id"] = txt_email.Text;         //For any admin
                        Session["logintype"] = "Admin";
                        Response.Redirect("~/Forms/adminlogin.aspx");
                    }
                }
                else if (output == 0)
                {
                    Response.Write("<script> alert('Incorect email or Password') </script>");
                }
            }
            catch (SqlException ex)
            {

               Response.Write("<script> alert('SQL Error: " + ex.Message.ToString() + "') </script>");
            }

            finally
            {
                con.Close();
            }
        }
    }
}