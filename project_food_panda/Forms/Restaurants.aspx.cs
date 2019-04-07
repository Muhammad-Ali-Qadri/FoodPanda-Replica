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
    public partial class Restaurants : System.Web.UI.Page
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        private static DataTable restaurants = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                
                return;
            }
            else
            {
                restaurants.Clear();
                rep_restaurant.Dispose();
                startproc();   
            }
        }

        public void startproc()
        {
            lbl_area.Text = Session["area"].ToString();
            lbl_city.Text = Session["city"].ToString();
            exec_sqlcmd("fp_proj.All_Restaurants", false);
            check_filter();
        }

        protected void button_change_location_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        public void exec_sqlcmd(string sqlstring, bool isCuisine, string cuisine = "", int checkno = 0)
        {
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open();
            SqlCommand cmd;
            DataTable temp = new DataTable();
            try
            {
                cmd = new SqlCommand(sqlstring, con);  //instantiate SQL command
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command

                cmd.Parameters.AddWithValue("@city_in", Session["city"].ToString());
                cmd.Parameters.AddWithValue("@area_in", Session["area"].ToString());

                if (isCuisine)
                {
                    cmd.Parameters.AddWithValue("@cuisine_in", cuisine);
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(temp);
                cmd.ExecuteNonQuery();

                cmd.Dispose();
                da.Dispose();

                int count = 0;
                foreach (DataRow row in temp.Rows)
                {
                    count++;
                }
                if (count > 0)
                {

                    restaurants.Merge(temp, true);
                    DataTable temp2 = new DataTable();
                    temp2 = restaurants.Clone();
                    int i = 0;
                    foreach(DataRow row in restaurants.Rows)
                    {
                        i = 0;
                        foreach (DataRow row2 in temp2.Rows)
                        {   
                            if(row["ID"].ToString() == row2["ID"].ToString())
                            {
                                i = 1;
                            }
                        }
                        if(i == 0)
                        {
                            temp2.ImportRow(row);
                           
                        }
                    }
                    restaurants = temp2.Copy();
                    rep_restaurant.DataSource = restaurants;
                    rep_restaurant.DataBind();
                    lbl_restaurant_count.Text = count.ToString();
                    sp_deliver.Style["display"] = "block";
                    lbl_restaurant_count.Style["display"] = "block";
                    lbl_order.Text = "Order From";
                    lbl_rest.Style["display"] = "block";
                    div_list.Style["display"] = "block";

                }
                else
                {
                    if(checkno > 1 && restaurants.Rows.Count > 0)
                    {
                        return;
                    }
                    sp_deliver.Style["display"] = "none";
                    lbl_restaurant_count.Style["display"] = "none";
                    lbl_rest.Style["display"] = "none";
                    lbl_order.Text = "No Restaurant Found.";
                    div_list.Style["display"] = "none";
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

        protected void chk_cuisines_filter_SelectedIndexChanged(object sender, EventArgs e)
        {
            check_filter();
        }

        protected void chk_restaurant_filter_list_SelectedIndexChanged(object sender, EventArgs e)
        {
            check_filter();
        }

        protected void ddlist_Sort_SelectedIndexChanged(object sender, EventArgs e)
        {
            check_filter();
        }

        protected void rep_restaurant_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if(e.CommandName == "OpenMenu")
            {
                Session["RestaurantID"] = e.CommandArgument.ToString();
                string test = Session["RestaurantID"].ToString();
                Response.Redirect("~/Forms/Restaurant_Menu.aspx");
            }
        }
        public void check_filter()
        {
            bool check = false;
            int checkno = 0;
            restaurants.Clear();
            foreach (ListItem item in chk_cuisines_filter.Items)
            {
                if (item.Selected)
                {
                    check = true;
                    if (item.Value == "0")
                    {
                        checkno++;
                        exec_sqlcmd("fp_proj.filter_Cuisine_proc", true, "Fast Food", checkno);
                    }
                    if (item.Value == "1")
                    {
                        checkno++;
                        exec_sqlcmd("fp_proj.filter_Cuisine_proc", true, "Pakistani", checkno);
                    }
                    if (item.Value == "2")
                    {
                        checkno++;
                        exec_sqlcmd("fp_proj.filter_Cuisine_proc", true, "Pizza", checkno);
                    }
                    if (item.Value == "3")
                    {
                        checkno++;
                        exec_sqlcmd("fp_proj.filter_Cuisine_proc", true, "BBQ & Grill", checkno);
                    }
                    if (item.Value == "4")
                    {
                        checkno++;
                        exec_sqlcmd("fp_proj.filter_Cuisine_proc", true, "Chinese", checkno);
                    }
                    if (item.Value == "5")
                    {
                        checkno++;
                        exec_sqlcmd("fp_proj.filter_Cuisine_proc", true, "Burger", checkno);
                    }
                    if (item.Value == "6")
                    {
                        checkno++;
                        exec_sqlcmd("fp_proj.filter_Cuisine_proc", true, "Cafe", checkno);
                    }
                    if (item.Value == "7")
                    {
                        checkno++;
                        exec_sqlcmd("fp_proj.filter_Cuisine_proc", true, "Continental", checkno);
                    }
                    if (item.Value == "8")
                    {
                        checkno++;
                        exec_sqlcmd("fp_proj.filter_Cuisine_proc", true, "Dessert", checkno);
                    }
                    if (item.Value == "9")
                    {
                        checkno++;
                        exec_sqlcmd("fp_proj.filter_Cuisine_proc", true, "Italian", checkno);
                    }
                    if (item.Value == "10")
                    {
                        checkno++;
                        exec_sqlcmd("fp_proj.filter_Cuisine_proc", true, "Sandwitch", checkno);
                    }
                    if (item.Value == "11")
                    {
                        checkno++;
                        exec_sqlcmd("fp_proj.filter_Cuisine_proc", true, "Steak", checkno);
                    }
                }
            }
            foreach (ListItem item in chk_restaurant_filter_list.Items)
            {
                if (item.Selected)
                {
                    check = true;
                    if (item.Value == "0")
                    {
                        checkno++;
                        exec_sqlcmd("fp_proj.filter_free_deliveries", false);
                    }
                    if (item.Value == "1")
                    {
                        checkno++;
                        exec_sqlcmd("fp_proj.filter_deals", false);
                    }
                }
            }
            if (!check)
            {
                exec_sqlcmd("fp_proj.All_Restaurants", false);
            }
            sortby();
        }

        public void sortby()
        {
            if(restaurants.Columns.Count > 0)
            {
                if (ddlist_Sort.SelectedValue == "0")
                {
                    restaurants.DefaultView.Sort = "Rating desc";
                    restaurants = restaurants.DefaultView.ToTable();
                }
                else if (ddlist_Sort.SelectedValue == "1")
                {
                    restaurants.DefaultView.Sort = "MinValue desc";
                    restaurants = restaurants.DefaultView.ToTable();
                }
                else if (ddlist_Sort.SelectedValue == "2")
                {
                    restaurants.DefaultView.Sort = "DeliveryFee desc";
                    restaurants = restaurants.DefaultView.ToTable();
                }
                else if (ddlist_Sort.SelectedValue == "3")
                {
                    restaurants.DefaultView.Sort = "Time asc";
                    restaurants = restaurants.DefaultView.ToTable();
                }
                rep_restaurant.DataSource = restaurants;
                rep_restaurant.DataBind();
            }
        }

       
    }

}