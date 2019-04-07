<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="aRestaurant.aspx.cs" Inherits="project_food_panda.Forms.aRestaurant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 817px; position: relative; left: 0px; top: 0px; width: 1349px;">

        <div style="position: relative; left: 35px; top: 46px; width: 922px; height: 320px;">

            <asp:GridView ID="GridView1" runat="server" Style="position: absolute; left: 29px; top: 53px; width: 1120px;"
                AutoGenerateColumns="false" Font-Names="Arial"
                AlternatingRowStyle-BackColor="white"
                HeaderStyle-BackColor="white" AllowPaging="true" ShowFooter="true"
                OnPageIndexChanging="OnPaging" OnRowEditing="EditRestaurant"
                OnRowUpdating="UpdateRestaurant" OnRowCancelingEdit="CancelEdit"
                PageSize="20">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="RestaurantID">
                        <ItemTemplate>
                            <asp:Label ID="lblRestaurantID" runat="server"
                                Text='<%# Eval("RestaurantID")%>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle Width="30px"></ItemStyle>

                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width="100px" HeaderText="RestaurantName">
                        <ItemTemplate>
                            <asp:Label ID="lblRestaurantName" runat="server"
                                Text='<%# Eval("RestaurantName")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtRestaurantName" runat="server"
                                Text='<%# Eval("RestaurantName")%>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="insRestaurantName" required="required" runat="server"></asp:TextBox>
                        </FooterTemplate>

                        <ItemStyle Width="100px"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width="20px" HeaderText="City" HeaderStyle-Width="20px">
                        <ItemTemplate>
                            <asp:Label ID="lblCity" runat="server"
                                Text='<%# Eval("City")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtCity" runat="server"
                                Text='<%# Eval("City")%>' Height="22px" Width="75px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insCity" runat="server" Width="75px" Height="22px"></asp:TextBox>
                        </FooterTemplate>

                        <HeaderStyle Width="20px"></HeaderStyle>

                        <ItemStyle Width="20px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="80px" HeaderText="Town">
                        <ItemTemplate>
                            <asp:Label ID="lblTown" runat="server"
                                Text='<%# Eval("Town")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtTown" runat="server"
                                Text='<%# Eval("Town")%>' Height="22px" Width="60px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insTown" runat="server" Height="22px" Width="60px"></asp:TextBox>
                        </FooterTemplate>

                        <ItemStyle Width="80px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="80px" HeaderText="Address">
                        <ItemTemplate>
                            <asp:Label ID="lblAddress" runat="server"
                                Text='<%# Eval("Address")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtAddress" runat="server"
                                Text='<%# Eval("Address")%>' Height="22px" Width="180px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insAddress" runat="server" Height="22px" Width="180px"></asp:TextBox>
                        </FooterTemplate>

                        <ItemStyle Width="80px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="60px" HeaderText="StartTime">
                        <ItemTemplate>
                            <asp:Label ID="lblStartTime" runat="server"
                                Text='<%# Eval("StartTime")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtStartTime" runat="server"
                                Text='<%# Eval("StartTime")%>' Height="26px" Width="68px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insStartTime" runat="server" Height="26px" Width="68px"></asp:TextBox>
                        </FooterTemplate>

                        <ItemStyle Width="50px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="60px" HeaderText="EndTime">
                        <ItemTemplate>
                            <asp:Label ID="lblEndTIme" runat="server"
                                Text='<%# Eval("EndTIme")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtEndTIme" runat="server"
                                Text='<%# Eval("EndTIme")%>' Height="26px" Width="68px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insEndTIme" runat="server" Height="26px" Width="68px"></asp:TextBox>
                        </FooterTemplate>

                        <ItemStyle Width="50px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="DlivryFee">
                        <ItemTemplate>
                            <asp:Label ID="lblDeliveryFee" runat="server"
                                Text='<%# Eval("DeliveryFee")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtDeliveryFee" runat="server"
                                Text='<%# Eval("DeliveryFee")%>' Height="27px" Width="65px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insDeliveryFee" runat="server" Height="26px" Width="65px"></asp:TextBox>
                        </FooterTemplate>

                        <ItemStyle Width="30px"></ItemStyle>
                    </asp:TemplateField>


                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="MinOrder">
                        <ItemTemplate>
                            <asp:Label ID="lblMinimumOrderValue" runat="server"
                                Text='<%# Eval("MinimumOrderValue")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtMinimumOrderValue" runat="server"
                                Text='<%# Eval("MinimumOrderValue")%>' Height="27px" Width="65px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insMinimumOrderValue" runat="server" Height="27px" Width="65px"></asp:TextBox>
                        </FooterTemplate>

                        <ItemStyle Width="30px"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="DlvryTime">
                        <ItemTemplate>
                            <asp:Label ID="lblDeliveryTime" runat="server"
                                Text='<%# Eval("DeliveryTime")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtDeliveryTime" runat="server"
                                Text='<%# Eval("DeliveryTime")%>' Height="27px" Width="65px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insDeliveryTime" runat="server" Height="27px" Width="66px"></asp:TextBox>
                        </FooterTemplate>

                        <ItemStyle Width="30px"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width="10px" HeaderText="Rating">
                        <ItemTemplate>
                            <asp:Label ID="lblRating" runat="server"
                                Text='<%# Eval("Rating")%>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle Width="10px"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width="30px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkRemove" runat="server"
                                CommandArgument='<%# Eval("RestaurantID")%>'
                                OnClientClick="return confirm('Do you want to delete?')"
                                Text="Delete" OnClick="DeleteRestaurant"></asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="btnAdd" runat="server" Text="Add"
                                OnClick="AddNewRestaurant" />
                        </FooterTemplate>

                        <ItemStyle Width="30px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
                <AlternatingRowStyle BackColor="whitesmoke" />

                <HeaderStyle BackColor="#FF6600"></HeaderStyle>

            </asp:GridView>

            <span style="position: absolute; font-size: 20px; left: 31px; top: 9px; width: 154px; height: 33px;">Restaurants</span>

        </div>
    </div>
</asp:Content>
