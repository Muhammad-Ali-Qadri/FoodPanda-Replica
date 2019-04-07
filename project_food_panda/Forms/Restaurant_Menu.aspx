<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Restaurant_Menu.aspx.cs" Inherits="project_food_panda.Forms.Restaurant_Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 1349px; height: 311px;">
        <img src="/Images/restaurants.jpg" style="width: 1349px; height: 307px; opacity: .4;" />
        <a id="res_name" runat="server" href="#">

            <div style="position: absolute; left: 335px; top: 92px; width: 644px; height: 103px; background-color: whitesmoke; opacity: .7">
                <span style="position: relative; font-size: 37px; color: orangered; left: 77px; top: 17px; width: 473px; height: 61px;">&nbsp;

                    <asp:Label ID="lbl_restaurant_name" runat="server" Text="Gourmet cola" Style="position: absolute; left: 65px; top: 5px; width: 262px; height: 55px;"> &nbsp; - &nbsp;</asp:Label>

                    <asp:Label ID="lbl_restaurant_area" runat="server" Text="Faisal Town" Style="position: absolute; left: 258px; top: 5px; width: 218px;"></asp:Label>

                </span>
            </div>

        </a>
        &nbsp;
        <div style="background-color: whitesmoke; opacity: .8; z-index: 1; position: absolute; left: 5px; top: 311px; width: 1349px; height: 50px;">

            <asp:Button ID="cmd_change_location_two" runat="server" Text="Change Location" Style="border-color: orangered; position: absolute; box-sizing: border-box; font-size: 10px; font-weight: 600; font-family: sans-serif; text-align: center; padding: 6px 12px; border-radius: 2px; color: orangered; left: 541px; top: 10px; width: 213px; height: 34px; font-size: 14px" OnClick="cmd_change_location_two_Click" />
        </div>
    </div>

   <%-- <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>--%>

            <div style="width: 1349px; height: 1423px; background-color: gainsboro; margin-right: 3px; top: 3px; opacity: .7; left: 1px; position: relative;">
                <asp:Button ID="cmd_next" runat="server" Style="position: absolute; left: 1105px; top: 20px; width: 223px; height: 30px;" Text="Next" BackColor="#33CC33" BorderColor="#33CC33" ForeColor="White" OnClick="cmd_next_Click" />

                <div style="background-color: white; position: absolute; top: 59px; color: Black; font-style: normal; color: #C0C0C0; font-size: small; left: 1104px; width: 224px; height: 63px;">
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Estimated delivery time<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="font-size: 20px; color: black">
                <asp:Label ID="lbl_delieverly_time" runat="server" Style="position: absolute; left: 58px; top: 35px; right: 132px; height: 21px;" Text="100"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Minutes</span>

                </div>

                <div style="position: absolute; left: 858px; top: 61px; width: 230px; height: 61px; background-color: white">

                    <span style="position: relative; color: orangered; font-size: 15px;">&nbsp;&nbsp; Subtotal: Rs.
                <asp:Label ID="lbl_subtotal" runat="server" Text="0"></asp:Label>
                    </span>
                    <br />

                    <span style="position: relative; color: aqua; font-size: 15px;">&nbsp;&nbsp; Delivery Fee: Rs.
                <asp:Label ID="lbl_delivery_fee" runat="server" Text=""></asp:Label>
                    </span>
                    <br />
                    <span style="position: relative; color: black; font-size: 15px;">&nbsp;&nbsp; Total: Rs.
                <asp:Label ID="lbl_total" runat="server" Text="0"></asp:Label>
                    </span>


                </div>

                <div style="overflow: auto; position: relative; background-color: white; left: 857px; top: 148px; width: 230px; height: 302px;">

                    <span style="margin-left: 40px; font-weight: 700; font-size: large">&nbsp;&nbsp;Ordered Items
                    </span>
                    <div style="margin-left: 40px">
                        &nbsp;
                <hr style="height: -42px; position: absolute; left: 247px; top: 13px; width: 219px;" />
                        <hr style="height: -42px; position: absolute; left: 1px; top: 12px; width: 227px;" />
                    </div>
                    <br />
                    <br />
                    <br />

                    <asp:Repeater ID="rep_food" runat="server" OnItemCommand="rep_food_ItemCommand">
                        <HeaderTemplate>
                            <ul id="list_items" style="list-style-type: none; position: absolute; top: 50px; width: 230px; left: -39px;">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li style="left: 2px; top: 1px;">

                                <span style="color: darkgrey; font-size: 15px; height: 24px; visibility: hidden;">
                                    <asp:Label ID="Lbl_item_id" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                </span>


                                <span style="color: darkgrey; font-size: 15px; height: 24px;">
                                    <asp:Label ID="Lbl_item_quantity" runat="server" Text=""><%# Eval("Quantity") %>x  </asp:Label>
                                </span>

                                <span style="color: darkgrey; font-size: 15px; height: 24px;">
                                    <asp:Label ID="lbl_item_name" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </span>
                                <br />
                                <span style="color: darkgrey; font-size: 15px; height: 24px; width: 230px; padding-left: 50px">Price: Rs.
                            <asp:Label ID="lbl_item_price" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                    <br />
                                </span>
                                <span style="">
                                    <asp:Button ID="cmd_increase_item_quantity" runat="server" Text="+" CommandName="Add_Quantity" CommandArgument='<%# Eval("ID") %>' Style="position: absolute; left: 60px; height: 20px; background-color: orangered; color: white; border-color: orangered" />
                                    <asp:Button ID="cmd_decrease_item_quantity" runat="server" Text="-" CommandName="Sub_Quantity" CommandArgument='<%# Eval("ID") %>' Style="position: absolute; left: 85px; height: 20px; background-color: orangered; color: white; border-color: orangered" />
                                    <asp:Button ID="cmd_remove_item" runat="server" Text="X" CommandName="Remove" CommandArgument='<%# Eval("ID") %>' Style="position: absolute; left: 108px; height: 20px; background-color: orangered; color: white; border-color: orangered" />

                                </span>
                                <hr style="width: 200px; height: -60px;" />
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>


                </div>

                <div style="overflow: auto; position: relative; background-color: white; left: 1103px; top: -153px; width: 230px; height: 302px;">

                    <span style="margin-left: 40px; font-weight: 700; font-size: large">&nbsp;&nbsp;Ordered Deals
                    </span>
                    <div style="margin-left: 40px">
                        &nbsp;
                <hr style="height: -42px; position: absolute; left: 247px; top: 13px; width: 219px;" />
                        <hr style="height: -42px; position: absolute; left: 1px; top: 12px; width: 227px;" />
                    </div>
                    <br />
                    <br />
                    <br />

                    <asp:Repeater ID="rep_deals" runat="server" OnItemCommand="rep_deals_ItemCommand">
                        <HeaderTemplate>
                            <ul id="list_deals" style="list-style-type: none; position: absolute; top: 50px; width: 230px; left: -39px;">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li style="left: 2px; top: 1px;">

                                <span style="color: darkgrey; font-size: 15px; height: 24px; visibility: hidden;">
                                    <asp:Label ID="Lbl_deals_id" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                </span>


                                <span style="color: darkgrey; font-size: 15px; height: 24px;">
                                    <asp:Label ID="Lbl_deals_quantity" runat="server" Text=""><%# Eval("Quantity") %>x  </asp:Label>
                                </span>

                                <span style="color: darkgrey; font-size: 15px; height: 24px;">
                                    <asp:Label ID="lbl_deals_name" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </span>
                                <br />
                                <span style="color: darkgrey; font-size: 15px; height: 24px; width: 230px; padding-left: 50px">Price: Rs.
                            <asp:Label ID="lbl_item_price" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                    <br />
                                </span>
                                <span style="">
                                    <asp:Button ID="cmd_increase_deals_quantity" runat="server" Text="+" CommandName="Add_Quantity" CommandArgument='<%# Eval("ID") %>' Style="position: absolute; left: 60px; height: 20px; background-color: orangered; color: white; border-color: orangered" />
                                    <asp:Button ID="cmd_decrease_deals_quantity" runat="server" Text="-" CommandName="Sub_Quantity" CommandArgument='<%# Eval("ID") %>' Style="position: absolute; left: 85px; height: 20px; background-color: orangered; color: white; border-color: orangered" />
                                    <asp:Button ID="cmd_remove_deals" runat="server" Text="X" CommandName="Remove" CommandArgument='<%# Eval("ID") %>' Style="position: absolute; left: 108px; height: 20px; background-color: orangered; color: white; border-color: orangered" />

                                </span>
                                <hr style="width: 200px; height: -60px;" />
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>


                </div>

                <div style="position: absolute; background-color: white; left: 27px; top: 61px; height: 59px; width: 784px;">
                    <asp:Button ID="cmd_deals" runat="server" Height="58px" Text="Deals" Width="78px" Style="background-color: white; color: gray" BorderColor="White" BorderWidth="0px" OnClick="cmd_deals_Click" />
                    <asp:Button ID="cmd_items" runat="server" Height="58px" Text="Items" Width="78px" Style="background-color: white; color: gray" BorderColor="White" BorderWidth="0px" OnClick="cmd_items_Click" />
                    <asp:Button ID="cmd_reviews" runat="server" Height="58px" Text="Reviews" Width="78px" Style="background-color: white; color: gray" BorderColor="White" BorderWidth="0px" OnClick="cmd_reviews_Click" />
                    <asp:Button ID="cmd_info" runat="server" Height="58px" Text="Info" Width="78px" Style="background-color: white; color: gray" BorderColor="White" BorderWidth="0px" OnClick="cmd_info_Click" />
                </div>

                <div id="div_info" style="padding-left: 10px; position: absolute; background-color: white; left: 28px; top: 123px; width: 782px; height: 239px; visibility: hidden" runat="server">
                    <br />
                    <span style="font-size: 15px; font-weight: 700;">Delivery Fee: Rs&nbsp
                           <asp:Label ID="lbl_menu_info_delivery_fee" runat="server" Text="100"></asp:Label>
                    </span>
                    <br />
                    <br />
                    <span style="font-size: 15px; font-weight: 700;">Minimum Order: Rs&nbsp
                           <asp:Label ID="lbl_menu_info_minimun_order" runat="server" Text="1500"></asp:Label>
                    </span>
                    <br />
                    <br />
                    <span style="font-size: 15px; font-weight: 700;">Delivery Time:&nbsp
                           <asp:Label ID="lbl_menu_info_delivery_time" runat="server" Text="50"></asp:Label>
                        &nbsp Min
                    </span>
                    <br />
                    <br />
                    <span style="font-size: 15px; font-weight: 700;">Delivery hours:&nbsp
                           <asp:Label ID="lbl_menu_info_delivery_hours1" runat="server" Text="30:34:10"></asp:Label>
                        &nbsp to &nbsp
                            <asp:Label ID="lbl_menu_info_delivery_hours2" runat="server" Text="30:34:10"></asp:Label>
                    </span>
                    <br />
                    <br />

                    <span style="font-size: 15px; font-weight: 700;">Address:&nbsp
                           <asp:Label ID="lbl_menu_info_address" runat="server" Text="address"></asp:Label>
                        &nbsp , &nbsp
                            <asp:Label ID="lbl_menu_info_town" runat="server" Text="Town"></asp:Label>
                        &nbsp , &nbsp
                             <asp:Label ID="lbl_menu_info_city" runat="server" Text="City"></asp:Label>
                    </span>

                    <hr />

                </div>

                <div id="div_items" style="position: relative; overflow: auto; background-color: white; left: 28px; top: -481px; width: 783px; height: 654px; visibility: hidden" runat="server">

                    <asp:Repeater ID="rep_menu_items" runat="server" OnItemCommand="rep_menu_items_ItemCommand">
                        <HeaderTemplate>
                            <ul id="list_menu_items" style="list-style-type: none; position: absolute; width: 784px; left: -39px;">
                                <br />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <span>
                                    <asp:Label ID="lbl_menu_items_id" runat="server" Text='<%# Eval("ID") %>' Style="visibility: hidden;"></asp:Label>
                                </span>

                                <span>
                                    <asp:Label ID="lbl_menu_items_name" runat="server" Text='<%# Eval("Name") %>' Style="color: orangered; font-weight: 300; font-size: 20px;"></asp:Label>
                                </span>


                                <span>
                                    <asp:Button ID="cmd_menu_items_add" runat="server" Text="+" CommandName="AddFood" CommandArgument='<%# Eval("ID")+","+ Eval("Name")+","+ Eval("Price")%>' Style="color: white; background-color: cornflowerblue; border-color: cornflowerblue; margin-left: 700px;" />
                                </span>

                                <br />
                                <span>
                                    <asp:Label ID="lbl_menu_items_descrption" runat="server" Text='<%# Eval("Description") %>' Style="font-size: small; margin-left: 12px;"></asp:Label>
                                </span>

                                <br />

                                <span style="margin-left: 12px; color: cornflowerblue; font-size: 15px;">Rs:
                            <asp:Label ID="lbl_menu_items_price" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                </span>


                                <hr />
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>

                <div id="div_reviews" style="position: relative; overflow: auto; background-color: white; left: 28px; top: -1135px; width: 783px; height: 654px; visibility: hidden" runat="server">

                    <asp:Repeater ID="rep_menu_reviews" runat="server" OnItemCommand="rep_menu_reviews_ItemCommand">
                        <HeaderTemplate>
                            <ul id="list_menu_reviews" style="list-style-type: none; position: absolute; width: 784px; left: -39px;">
                                <br />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <span>
                                    <asp:Label ID="lbl_menu_review_id" runat="server" Text='<%# Eval("ID") %>' Style="visibility: hidden;"></asp:Label>
                                </span>

                                <span>
                                    <asp:Label ID="lbl_menu_review_user_name" runat="server" Text='<%# Eval("Name") %>' Style="color: orangered; font-weight: 300; font-size: 15px;"></asp:Label>
                                </span>

                                <span>

                                    <asp:Label ID="lbl_menu_review_rating" runat="server" Text=""><%# Eval("Price") %> / 5</asp:Label>
                                </span>
                                <br />
                                <span>
                                    <asp:Label ID="lbl_menu_review_comment" runat="server" Text='<%# Eval("Description") %>' Style="text-align: center; font-size: small; margin-left: 12px; width: 50px;"></asp:Label>
                                </span>
                                <br />
                                <hr />
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>

                            <li>
                                <span>
                                    <asp:Label ID="lbl_menu_review_user_name" runat="server" Text="Add Review" Style="color: orangered; font-weight: 300; font-size: 17px; margin-left: 13px"></asp:Label>
                                </span>

                                <span>&nbsp;&nbsp;&nbsp;Rate:

                            <asp:DropDownList ID="list_select_rating" runat="server" Style="font-size: 12px;">
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>

                            </asp:DropDownList>

                                </span>
                                <br />
                                <asp:Label ID="lbl_review_warning" runat="server" Text="Label" Style="visibility: hidden; height: 19px; width: 204px; margin-left: 12px; top: 429px; color: red;"></asp:Label>

                                <br />

                                <span>

                                    <asp:TextBox ID="txt_review_add" runat="server" Style="text-align: center; font-size: small; margin-left: 12px; width: 550px; text-align: left; height: 75px; resize: none" placeholder="Enter comments" TextMode="MultiLine"></asp:TextBox>
                                </span>
                                <span>
                                    <asp:Button ID="cmd_add_review" runat="server" Text="Add Review" CommandName="AddReview" Style="position: absolute; color: white; background-color: cornflowerblue; border-color: cornflowerblue; margin-left: 50px; bottom: 40px" />
                                </span>
                                <br />
                                <hr />
                            </li>
                            </ul>
                    
                        </FooterTemplate>
                    </asp:Repeater>
                </div>

                <div id="div_deals" style="position: relative; overflow: auto; background-color: white; left: 28px; top: -1790px; width: 783px; height: 654px; visibility: visible" runat="server">

                    <asp:Repeater ID="rep_menu_deals" runat="server" OnItemCommand="rep_menu_deals_ItemCommand">
                        <HeaderTemplate>
                            <ul id="list_menu_deals" style="list-style-type: none; position: absolute; width: 784px; left: -39px;">
                                <br />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <span>
                                    <asp:Label ID="lbl_menu_deals_id" runat="server" Text='<%# Eval("ID") %>' Style="visibility: hidden;"></asp:Label>
                                </span>

                                <span>
                                    <asp:Label ID="lbl_menu_deals_name" runat="server" Text='<%# Eval("Name") %>' Style="color: orangered; font-weight: 300; font-size: 20px;"></asp:Label>
                                </span>


                                <span>
                                    <asp:Button ID="cmd_menu_deals_add" runat="server" Text="+" CommandName="AddFood" CommandArgument='<%# Eval("ID")+","+ Eval("Name")+","+ Eval("Price")%>' Style="color: white; background-color: cornflowerblue; border-color: cornflowerblue; margin-left: 700px;" />
                                </span>

                                <br />
                                <span>
                                    <asp:Label ID="lbl_menu_deals_descrption" runat="server" Text='<%# Eval("Description") %>' Style="font-size: small; margin-left: 12px;"></asp:Label>
                                </span>

                                <br />

                                <span style="margin-left: 12px; color: cornflowerblue; font-size: 15px;">Rs:
                            <asp:Label ID="lbl_menu_deals_price" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                </span>


                                <hr />
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                </div>
            </div>
      <%--  </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
