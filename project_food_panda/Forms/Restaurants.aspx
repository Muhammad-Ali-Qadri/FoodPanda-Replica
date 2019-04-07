<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Restaurants.aspx.cs" Inherits="project_food_panda.Forms.Restaurants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 1349px;">
        <img src="/Images/restaurants.jpg" style="width: 1349px; height: 310px; opacity: .4;" />
        <div style="position: absolute; left: 405px; top: 92px; width: 794px; height: 209px;">
            <span id="sp_order" runat="server" style="position: absolute; font-size: 37px; color: orangered; left: 77px; top: 17px; width: 473px; height: 61px;">&nbsp;
                <asp:Label ID="lbl_order" runat="server" Text="Order from" Style="display: block; position: absolute; left: 3px; top: 5px; width: 460px;"></asp:Label>

                <asp:Label ID="lbl_restaurant_count" runat="server" Text="3" Style="display: block; position: absolute; left: 198px; top: 5px; width: 32px;"></asp:Label>
                <asp:Label ID="lbl_rest" runat="server" Text="restaurant(s)." Style="display: block; position: absolute; left: 239px; top: 5px;"></asp:Label>
            </span>
            <span id="sp_deliver" runat="server" style="position: absolute; font-size: 20px; color: black; left: 170px; top: 79px;">Delivering to your door
            </span>
        </div>
        &nbsp;
        <div style="background-color: whitesmoke; opacity: .8; z-index: 1; position: absolute; left: 5px; top: 311px; width: 1349px; height: 50px;">
            <span style="position: absolute; left: 369px; top: 12px; width: 344px; height: 25px; font-size: 20px;">
                <asp:Label ID="lbl_city" runat="server" Text="city">,</asp:Label>
                <asp:Label ID="lbl_area" runat="server" Text="Area "></asp:Label>

            </span>

            <asp:Button ID="button_change_location" runat="server" Text="Change Location" Style="border-color: orangered; position: absolute; box-sizing: border-box; font-size: 10px; font-weight: 600; font-family: sans-serif; text-align: center; padding: 6px 12px; border-radius: 2px; color: orangered; left: 741px; top: 10px; width: 213px; height: 34px; font-size: 14px" OnClick="button_change_location_Click" />
        </div>
    </div>

    <div style="width: 1349px; height: 1456px; background-color: gainsboro; margin-right: 3px; top: -30px; opacity: .7; left: 1px; position: initial">

        <br />
        <br />

        <div data-sticky-bottom-margin="20" data-sticky-top-margin="16" style="margin-top: 0px; width: 325px;">

            <div>
                <br />
                <asp:DropDownList ID="ddlist_Sort" runat="server" BackColor="#CCCCCC" Height="25px" Width="277px" OnSelectedIndexChanged="ddlist_Sort_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Value="0">Ratings</asp:ListItem>
                    <asp:ListItem Value="1"> Minimum order value</asp:ListItem>
                    <asp:ListItem Value="2"> Delivery fee</asp:ListItem>
                    <asp:ListItem Value="3">Fastest delivery</asp:ListItem>
                    <asp:ListItem></asp:ListItem>

                </asp:DropDownList>
                &nbsp;
            </div>

            <div id="characteristics">
                <br />
                Filter Restaurants
                    <ul id="list_characteristics" style="list-style-type: none">
                        <li>
                            <asp:CheckBoxList ID="chk_restaurant_filter_list" runat="server" OnSelectedIndexChanged="chk_restaurant_filter_list_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Value="0">&nbsp; Free Delivery</asp:ListItem>
                                <asp:ListItem Value="1">&nbsp; Deals</asp:ListItem>
                            </asp:CheckBoxList>
                        </li>
                    </ul>
            </div>

            <div class="cuisines">
                Cuisines
                   <ul id="list_cuisines" style="list-style-type: none">
                       <li>
                           <asp:CheckBoxList ID="chk_cuisines_filter" runat="server" OnSelectedIndexChanged="chk_cuisines_filter_SelectedIndexChanged" AutoPostBack="true">
                               <asp:ListItem Value="0">&nbsp; Fast Food</asp:ListItem>
                               <asp:ListItem Value="1">&nbsp; Pakistani</asp:ListItem>
                               <asp:ListItem Value="2">&nbsp; Pizza</asp:ListItem>
                               <asp:ListItem Value="3">&nbsp; BBQ & Grills</asp:ListItem>
                               <asp:ListItem Value="4">&nbsp; Chinese & Thai</asp:ListItem>
                               <asp:ListItem Value="5">&nbsp; Burgers</asp:ListItem>
                               <asp:ListItem Value="6">&nbsp; Cafe</asp:ListItem>
                               <asp:ListItem Value="7">&nbsp; Continental</asp:ListItem>
                               <asp:ListItem Value="8">&nbsp; Desserts</asp:ListItem>
                               <asp:ListItem Value="9">&nbsp; Italian</asp:ListItem>
                               <asp:ListItem Value="10">&nbsp; Sandwitches</asp:ListItem>
                               <asp:ListItem Value="11">&nbsp; Steaks</asp:ListItem>
                           </asp:CheckBoxList>
                       </li>

                   </ul>

            </div>
        </div>

        <div id="div_list" runat="server" style="overflow:auto; display:table; position: absolute; left: 335px; top: 401px; width: 917px; height: 702px; background-color: white;">
            <asp:Repeater ID="rep_restaurant" runat="server" OnItemCommand="rep_restaurant_ItemCommand">
                <HeaderTemplate>
                    <ul id="list_restaurants" style="list-style-type: none; position: absolute; top: 0px; width: 914px; left: -39px;">
                </HeaderTemplate>
                <ItemTemplate>
                    <li style="position: relative; left: 2px; top: 1px; display: block" onmouseover="color:white" onmouseout="color:black;">

                        <br />
                        <asp:LinkButton runat="server" CommandName="OpenMenu" CommandArgument='<%# Eval("ID") %>'>
                            <span style="position: absolute; left: 20px; top: 11px; font-size: 25px;">
                                <asp:Label ID="lbl_restaurant_name" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                - 
                                <asp:Label ID="lbl_rest_town" runat="server" Text='<%# Eval("Town") %>'></asp:Label>
                                <asp:Label ID="lbl_hidden_restid" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>

                            </span>
                        </asp:LinkButton>
                        <span style="position: absolute; left: 20px; top: 42px; color: darkgrey; font-size: 15px; height: 24px;">
                            <asp:Label ID="lbl_cuisine_name" runat="server" Text='<%# Eval("Cuisine") %>'></asp:Label>
                        </span>

                        <span style="position: absolute; left: 750px; top: 42px; color: darkgrey; font-size: 15px; height: 24px;">Delivers in 
                            <asp:Label ID="lbl_delivery_time" runat="server" Text='<%# Eval("Time") %>'></asp:Label>
                            min
                        </span>
                        <span style="position: absolute; left: 20px; top: 64px; color: darkgray; font-size: 15px; height: 21px;">Min Value - Rs. 
                            <asp:Label ID="lbl_minOrder" runat="server" Text=""><%# Eval("MinValue") %> </asp:Label>
                        </span>
                        <span style="position: absolute; left: 155px; top: 64px; color: darkgray; font-size: 15px; height: 21px;">Delivery Fee - Rs.  
                            <asp:Label ID="lbl_DeliveryFee" runat="server" Text=""><%# Eval("DeliveryFee") %> </asp:Label>
                        </span>

                        <span style="position: absolute; left: 310px; top: 64px; color: darkgray; font-size: 15px; height: 21px;">Rating -  
                            <asp:Label ID="lbl_rating" runat="server" Text=""><%# Eval("Rating") %> / 5</asp:Label>
                        </span>
                        <span style="position: absolute; left: 400px; top: 64px; color: darkgray; font-size: 15px; height: 21px;">

                            <asp:Label ID="lbl_review_count" runat="server" Text="( ">  <%# Eval("Count") %>  )</asp:Label>
                        </span>
                        <hr style="position: absolute; width: 915px; left: -2px; top: 66px; height: -42px;" />
                        <div style="height: 60px;">
                        </div>
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>



        </div>


    </div>


</asp:Content>
