using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

namespace project_food_panda.Forms
{
    public partial class Login : System.Web.UI.Page
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmd_signup_Click(object sender, EventArgs e)
        {
            int p = 1;
            lbl_warning.Style["visibility"] = "hidden";
            lbl_firstname.Style["visibility"] = "hidden";
            lbl_lastname.Style["visibility"] = "hidden";
            lbl_email.Style["visibility"] = "hidden";
            lbl_password.Style["visibility"] = "hidden";
            lbl_phoneno.Style["visibility"] = "hidden";
            lbl_reenterpassword.Style["visibility"] = "hidden";

            if (!Regex.IsMatch(txt_firstname.Text, "^[a-zA-Z\x20]+$"))
            {
                lbl_firstname.Style["visibility"] = "visible";
                lbl_firstname.Text = "Enter correct first name";
                p = 0;
            }

            if (!Regex.IsMatch(txt_lastname.Text, "^[a-zA-Z\x20]+$"))
            {
                lbl_lastname.Style["visibility"] = "visible";
                lbl_lastname.Text = "Enter correct last name";
                p = 0;
            }
            if (!Regex.IsMatch(txt_phoneno.Text, "^[0-9]+$") || (txt_phoneno.Text.Length !=10))
            {
                lbl_phoneno.Style["visibility"] = "visible";
                lbl_phoneno.Text = "Enter correct number";
                p = 0;
            }

            if (!(new EmailAddressAttribute().IsValid(txt_email.Text)))
            {
                lbl_email.Style["visibility"] = "visible";
                lbl_email.Text = "Enter correct email";
                p = 0;
            }

            if (txt_password.Text.Length < 4)
            {
                lbl_password.Style["visibility"] = "visible";
                lbl_password.Text = "Password must be greater than 4 characters";
                p = 0;

            }


            if (txt_password.Text.Length >= 4 && txt_password.Text != txt_reenterpassword.Text)
            {
                lbl_reenterpassword.Style["visibility"] = "visible";
                lbl_reenterpassword.Text = "Password must match";
                p = 0;
            }

            if (chkbox_terms.Checked != true)
            {
                lbl_warning.Style["visibility"] = "true";
                lbl_warning.Text = "Must accept terms and conditions";
                p = 0;
            }
            if (p == 1)
            {
                adduser();
            }
            else
            {
                txt_password.Text = "";
                txt_reenterpassword.Text = "";
            }

        }      

        public void adduser()
        {
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("fp_proj.adduser", con);  //instantiate SQL command
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command

                cmd.Parameters.AddWithValue("@firstname", txt_firstname.Text);
                cmd.Parameters.AddWithValue("@lastname", txt_lastname.Text);
                cmd.Parameters.AddWithValue("@phoneno", txt_phoneno.Text);
                cmd.Parameters.AddWithValue("@email", txt_email.Text);
                cmd.Parameters.AddWithValue("@password", txt_password.Text);
                cmd.Parameters.Add("@isvalid", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@userid", SqlDbType.Int).Direction = ParameterDirection.Output;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.ExecuteNonQuery();

                
                int output = (int)cmd.Parameters["@isvalid"].Value;

                if (output == 1)
                {
                    int userid = (int)cmd.Parameters["@userid"].Value;
                    Session["userid"] = userid;
                    Response.Write("<script> confirm('Sign up Successful ! ') </script>");
                    Session["logintype"] = "User";
                    Session["id"] = txt_email.Text;
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    Response.Write("<script> alert('The email already exists!') </script>");
                    txt_firstname.Text = "";
                    txt_lastname.Text = "";
                    txt_phoneno.Text = "";
                    txt_email.Text = "";
                    txt_password.Text = "";
                    txt_reenterpassword.Text = "";
                }
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