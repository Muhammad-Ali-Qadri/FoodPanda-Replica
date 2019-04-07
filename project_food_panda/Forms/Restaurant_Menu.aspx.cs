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
    public partial class Restaurant_Menu : System.Web.UI.Page
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        public static DataTable order_food = new DataTable();
        public static DataTable order_deals = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                get_restaurant_info();
                init_order_tables(ref order_food);
                init_order_tables(ref order_deals);
                cmd_deals_Click(sender, e);
                rep_food.Dispose();
                rep_deals.Dispose();    
                rep_deals.DataSource = order_deals;
                rep_deals.DataBind();
                rep_food.DataSource = order_food;
                rep_food.DataBind();
                
               // rep_deals.Dispose();
                //rep_food.Dispose();
            }

        }

        protected void cmd_deals_Click(object sender, EventArgs e)
        {
            div_deals.Style["visibility"] = "visible";
            div_items.Style["visibility"] = "hidden";
            div_reviews.Style["visibility"] = "hidden";
            div_info.Style["visibility"] = "hidden";
            cmd_deals.Style["background-color"] = "whitesmoke";
            cmd_items.Style["background-color"] = "white";
            cmd_reviews.Style["background-color"] = "white";
            cmd_info.Style["background-color"] = "white";
            get_restaurnat_details("fp_proj.get_deals", ref rep_menu_deals);

        }
        protected void cmd_items_Click(object sender, EventArgs e)
        {
            div_deals.Style["visibility"] = "hidden";
            div_items.Style["visibility"] = "visible";
            div_reviews.Style["visibility"] = "hidden";
            div_info.Style["visibility"] = "hidden";

            cmd_deals.Style["background-color"] = "white";
            cmd_items.Style["background-color"] = "whitesmoke";
            cmd_reviews.Style["background-color"] = "white";
            cmd_info.Style["background-color"] = "white";
            get_restaurnat_details("fp_proj.get_food", ref rep_menu_items);
        }
        protected void cmd_reviews_Click(object sender, EventArgs e)
        {
            div_deals.Style["visibility"] = "hidden";
            div_items.Style["visibility"] = "hidden";
            div_reviews.Style["visibility"] = "visible";
            div_info.Style["visibility"] = "hidden";
            cmd_deals.Style["background-color"] = "white";
            cmd_items.Style["background-color"] = "white";
            cmd_reviews.Style["background-color"] = "whitesmoke";
            cmd_info.Style["background-color"] = "white";
            get_restaurnat_details("fp_proj.get_reviews", ref rep_menu_reviews);
        }
        protected void cmd_info_Click(object sender, EventArgs e)
        {
            div_deals.Style["visibility"] = "hidden";
            div_items.Style["visibility"] = "hidden";
            div_reviews.Style["visibility"] = "hidden";
            div_info.Style["visibility"] = "visible";
            cmd_deals.Style["background-color"] = "white";
            cmd_items.Style["background-color"] = "white";
            cmd_reviews.Style["background-color"] = "white";
            cmd_info.Style["background-color"] = "whitesmoke";
            get_restaurant_info();
        }

        protected void cmd_change_location_two_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        public void get_restaurnat_details(string sqlcmd, ref Repeater rep)
        {
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open();
            SqlCommand cmd;
            DataTable temp = new DataTable();
            try
            {
                cmd = new SqlCommand(sqlcmd, con);  //instantiate SQL command
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command

                cmd.Parameters.AddWithValue("@restID", Session["RestaurantID"].ToString());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(temp);
                cmd.ExecuteNonQuery();

                cmd.Dispose();
                da.Dispose();

                rep.DataSource = temp;
                rep.DataBind();
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

        public void get_restaurant_info()
        {
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open();
            SqlCommand cmd;
            DataTable temp = new DataTable();
            try
            {
                cmd = new SqlCommand("fp_proj.get_restaurant_info", con);  //instantiate SQL command
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command

                cmd.Parameters.AddWithValue("@restID", Session["RestaurantID"].ToString());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(temp);
                cmd.ExecuteNonQuery();

                cmd.Dispose();
                da.Dispose();
                foreach(DataRow row in temp.Rows)
                {
                    lbl_delieverly_time.Text = lbl_menu_info_delivery_time.Text = row["DeliveryTime"].ToString();
                    lbl_menu_info_address.Text = row["Address"].ToString();
                    lbl_menu_info_city.Text = row["City"].ToString();
                    lbl_delivery_fee.Text = lbl_menu_info_delivery_fee.Text = row["DeliveryFee"].ToString();
                    lbl_menu_info_delivery_hours1.Text = row["StartTime"].ToString();
                    lbl_menu_info_delivery_hours2.Text = row["EndTime"].ToString();
                    lbl_menu_info_minimun_order.Text = row["MinimumOrderValue"].ToString();
                    lbl_restaurant_area.Text = lbl_menu_info_town.Text = row["Town"].ToString();
                    lbl_restaurant_name.Text = row["Name"].ToString();
                    lbl_restaurant_area.Text = row["Town"].ToString();
                    
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

        protected void rep_menu_items_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Add_Order(ref source, ref e, ref order_food, ref rep_food);
            calculate_total();
        }
        
        protected void rep_food_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Change_Order(ref source, ref e, ref order_food, ref rep_food);
            calculate_total();
        }

        protected void rep_menu_deals_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Add_Order(ref source, ref e, ref order_deals, ref rep_deals);
            calculate_total();
        }
        protected void rep_deals_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Change_Order(ref source, ref e, ref order_deals, ref rep_deals);
            calculate_total();
        }

        protected void rep_menu_reviews_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if(e.CommandName.ToString() == "AddReview")
            {
                Control FooterTemplate = rep_menu_reviews.Controls[rep_menu_reviews.Controls.Count - 1].Controls[0];
                Label lbl_review_warning = FooterTemplate.FindControl("lbl_review_warning") as Label;
                TextBox txt_review_add = FooterTemplate.FindControl("txt_review_add") as TextBox;

                if (Session["id"] == null)
                {
                    Response.Write("<script> alert('You must login to enter review!') </script>");
                    txt_review_add.Text = "";
                    return;
                }
                else
                {
                   
                    lbl_review_warning.Style["visibility"] = "hidden";
                    
                    
                    if (txt_review_add.Text == "")
                    {
                        lbl_review_warning.Style["visibility"] = "visible";
                        lbl_review_warning.Text = "*Enter comments to add review.";
                    }
                    else if(!Regex.IsMatch(txt_review_add.Text, "^[0-9a-zA-Z\x20+-?!]+$"))
                    {
                        lbl_review_warning.Style["visibility"] = "visible";
                        lbl_review_warning.Text = "*Enter correct text";
                        txt_review_add.Text = "";
                    }
                    else if(txt_review_add.Text.Length > 200)
                    {
                        lbl_review_warning.Style["visibility"] = "visible";
                        lbl_review_warning.Text = "*Length should not be greater than 200 characters";
                        txt_review_add.Text = "";
                    }
                    else
                    {
                        add_review();
                        txt_review_add.Text = "";
                        get_restaurnat_details("fp_proj.get_reviews", ref rep_menu_reviews);
                    }
                }
            }
        }

        public void init_order_tables(ref DataTable table)
        {
            table.Reset();
            if (table.Columns.Count == 0)
            {
                DataColumn col = new DataColumn();
                col.DataType = System.Type.GetType("System.Int32");
                col.ColumnName = "ID";
                table.Columns.Add(col);

                col = new DataColumn();
                col.DataType = System.Type.GetType("System.String");
                col.ColumnName = "Name";
                table.Columns.Add(col);

                col = new DataColumn();
                col.DataType = System.Type.GetType("System.Int32");
                col.ColumnName = "Price";
                table.Columns.Add(col);

                col = new DataColumn();
                col.DataType = System.Type.GetType("System.Int32");
                col.ColumnName = "Quantity";
                table.Columns.Add(col);
            }
        }

        public void Add_Order(ref object source, ref RepeaterCommandEventArgs e, ref DataTable table, ref Repeater rep)
        {
            if (e.CommandName == "AddFood")
            {

                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });

                foreach (DataRow r in table.Rows)
                {
                    if (r["ID"].ToString() == commandArgs[0])
                    {
                        int temp = int.Parse(r["Quantity"].ToString());
                        temp++;
                        r["Quantity"] = temp.ToString();
                        rep.DataSource = table;
                        rep.DataBind();
                        return;
                    }
                }

                DataRow row = table.NewRow();
                row["ID"] = int.Parse(commandArgs[0]);
                row["Name"] = commandArgs[1];
                row["Price"] = int.Parse(commandArgs[2]);
                row["Quantity"] = "1";
                table.Rows.Add(row);

                rep.DataSource = table;
                rep.DataBind();

            }
        }

        public void Change_Order(ref object source, ref RepeaterCommandEventArgs e, ref DataTable table, ref Repeater rep)
        {
            if (e.CommandName == "Add_Quantity")
            {
                foreach (DataRow r in table.Rows)
                {
                    if (r["ID"].ToString() == e.CommandArgument.ToString())
                    {
                        int temp = int.Parse(r["Quantity"].ToString());
                        temp++;
                        r["Quantity"] = temp.ToString();
                        rep.DataSource = table;
                        rep.DataBind();
                    }
                }
            }
            else if (e.CommandName == "Sub_Quantity")
            {
                foreach (DataRow r in table.Rows)
                {
                    if (r["ID"].ToString() == e.CommandArgument.ToString())
                    {
                        int temp = int.Parse(r["Quantity"].ToString());
                        temp--;
                        if (temp == 0)
                        {
                            r.Delete();
                            rep.DataSource = table;
                            rep.DataBind();
                            return;
                        }
                        else
                        {
                            r["Quantity"] = temp.ToString();
                        }
                        rep.DataSource = table;
                        rep.DataBind();
                    }
                }
            }
            else if (e.CommandName == "Remove")
            {
                foreach (DataRow r in table.Rows)
                {
                    if (r["ID"].ToString() == e.CommandArgument.ToString())
                    {
                        r.Delete();
                        rep.DataSource = table;
                        rep.DataBind();
                        return;
                    }
                }
            }
        }

        public void calculate_total()
        {
            float total = 0;
            foreach(DataRow row in order_food.Rows)
            {
                total = total + int.Parse(row["Quantity"].ToString()) * int.Parse(row["Price"].ToString());
            }   

            foreach(DataRow row in order_deals.Rows)
            {
                total = total + int.Parse(row["Quantity"].ToString()) * int.Parse(row["Price"].ToString());
            }
            lbl_subtotal.Text = total.ToString();
            float deliveryfee = float.Parse(lbl_delivery_fee.Text);
            lbl_total.Text = (total + deliveryfee).ToString();
        }

        protected void cmd_next_Click(object sender, EventArgs e)
        {
            if(order_deals.Rows.Count == 0 && order_food.Rows.Count == 0)
            {
                Response.Write("<script> confirm('Chose any item to proceed to checkout ! ') </script>");
            }
            else
            {
                Session["subtotal"] = lbl_subtotal.Text;
                Session["total"] = lbl_total.Text;
                Session["order_food"] = order_food.Copy();
                Session["order_deals"] = order_deals.Copy();
                order_deals.Reset();
                order_food.Reset();
                rep_food.Dispose();
                rep_deals.Dispose();
                Response.Redirect("~/Forms/Checkout.aspx");
                
            }
        }

        public void add_review()
        {
            Control FooterTemplate = rep_menu_reviews.Controls[rep_menu_reviews.Controls.Count - 1].Controls[0];
            TextBox txt_review_add = FooterTemplate.FindControl("txt_review_add") as TextBox;
            DropDownList list_select_rating = FooterTemplate.FindControl("list_select_rating") as DropDownList;


            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open();
            SqlCommand cmd;
        
            try
            {
                cmd = new SqlCommand("fp_proj.add_review_update_rating", con);  //instantiate SQL command
                cmd.CommandType = CommandType.StoredProcedure; //set type of sqL Command

                cmd.Parameters.AddWithValue("@restID", int.Parse(Session["RestaurantID"].ToString()));
                cmd.Parameters.AddWithValue("@userID", int.Parse(Session["userid"].ToString()));
                cmd.Parameters.AddWithValue("@Description", txt_review_add.Text.ToString());
                cmd.Parameters.AddWithValue("@rating", int.Parse(list_select_rating.SelectedValue.ToString()));

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                
                cmd.ExecuteNonQuery();

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