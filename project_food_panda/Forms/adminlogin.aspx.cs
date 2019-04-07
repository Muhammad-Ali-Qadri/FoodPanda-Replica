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
    public partial class adminlogin : System.Web.UI.Page
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
               

            }
        }

        protected void Button_aRestaurant_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/aRestaurant.aspx");

        }
        protected void Button_aDeals_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/aDeals.aspx");

        }
        protected void Button_aDealDescription_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/aDealDescription.aspx");

        }
        protected void Button_aFoodItems_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/aFoodItems.aspx");
        }
        protected void Button_aDelieverTown_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/aDelieverTown.aspx");
        }
        protected void Button_aUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/aUsers.aspx");
        }
        protected void Button_aOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/aOrder.aspx");
        }
        protected void Button_aOrderDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/aOrderDetails.aspx");
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