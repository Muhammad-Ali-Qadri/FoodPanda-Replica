<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="aFoodItems.aspx.cs" Inherits="project_food_panda.Forms.aFoodItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 1009px; position: relative; left: 0px; top: 0px; width: 1349px;">

        <div style="position: relative; left: 35px; top: 46px; width: 922px; height: 320px;">



            <asp:GridView ID="GridView1" runat="server" Style="position: absolute; left: 29px; top: 53px; width: 1027px;"
                AutoGenerateColumns="false" Font-Names="Arial"
                AlternatingRowStyle-BackColor="white"
                HeaderStyle-BackColor="white" AllowPaging="true" ShowFooter="true"
                OnPageIndexChanging="OnPaging" OnRowEditing="EditFood"
                OnRowUpdating="UpdateFood" OnRowCancelingEdit="CancelEditFood"
                PageSize="10">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="20px" HeaderText="ItemID">
                        <ItemTemplate>
                            <asp:Label ID="lblItemID" runat="server"
                                Text='<%# Eval("ItemID")%>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle Width="20px"></ItemStyle>

                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width="40px" HeaderText="Rest_ID">
                        <ItemTemplate>
                            <asp:Label ID="lblRestaurantID" runat="server"
                                Text='<%# Eval("RestaurantID")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtRestaurantID" runat="server"
                                Text='<%# Eval("RestaurantID")%>' Height="25px" Width="40px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="insRestaurantID" required="required" runat="server" Width="60px" Height="25px"></asp:TextBox>
                        </FooterTemplate>

                        <ItemStyle Width="40px"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width="20px" HeaderText="ItemName" HeaderStyle-Width="20px">
                        <ItemTemplate>
                            <asp:Label ID="lblItemName" runat="server"
                                Text='<%# Eval("ItemName")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtItemName" runat="server"
                                Text='<%# Eval("ItemName")%>' Height="21px" Width="150px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insItemName" runat="server" Width="150px"></asp:TextBox>
                        </FooterTemplate>

                        <HeaderStyle Width="20px"></HeaderStyle>

                        <ItemStyle Width="20px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="20px" HeaderText="Item_Desc" HeaderStyle-Width="20px">
                        <ItemTemplate>
                            <asp:Label ID="lblItem_Desc" runat="server"
                                Text='<%# Eval("Item_Desc")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtItem_Desc" runat="server"
                                Text='<%# Eval("Item_Desc")%>' Height="22px" Width="500px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insItem_Desc" runat="server" Width="500px" Height="22px"></asp:TextBox>
                        </FooterTemplate>

                        <HeaderStyle Width="20px"></HeaderStyle>

                        <ItemStyle Width="20px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Cuisine">
                        <ItemTemplate>
                            <asp:Label ID="lblCuisine" runat="server"
                                Text='<%# Eval("Cuisine")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="txtCuisine" runat="server">
                                <asp:ListItem Value="0">Fast Food</asp:ListItem>
                                <asp:ListItem Value="1">Pakistani</asp:ListItem>
                                <asp:ListItem Value="2">Pizza</asp:ListItem>
                                <asp:ListItem Value="3">BBQ & Grill</asp:ListItem>
                                <asp:ListItem Value="4">Chinese & Thai</asp:ListItem>
                                <asp:ListItem Value="5">Burger</asp:ListItem>
                                <asp:ListItem Value="6">Cafe</asp:ListItem>
                                <asp:ListItem Value="7">Continental</asp:ListItem>
                                <asp:ListItem Value="8">Dessert</asp:ListItem>
                                <asp:ListItem Value="9">Italian</asp:ListItem>
                                <asp:ListItem Value="10">Sandwitch</asp:ListItem>
                                <asp:ListItem Value="11">Steak</asp:ListItem>
                            </asp:DropDownList>

                        </EditItemTemplate>

                        <FooterTemplate>
                            <asp:DropDownList ID="insCuisine" runat="server">
                                <asp:ListItem Value="0">Fast Food</asp:ListItem>
                                <asp:ListItem Value="1">Pakistani</asp:ListItem>
                                <asp:ListItem Value="2">Pizza</asp:ListItem>
                                <asp:ListItem Value="3">BBQ & Grill</asp:ListItem>
                                <asp:ListItem Value="4">Chinese & Thai</asp:ListItem>
                                <asp:ListItem Value="5">Burger</asp:ListItem>
                                <asp:ListItem Value="6">Cafe</asp:ListItem>
                                <asp:ListItem Value="7">Continental</asp:ListItem>
                                <asp:ListItem Value="8">Dessert</asp:ListItem>
                                <asp:ListItem Value="9">Italian</asp:ListItem>
                                <asp:ListItem Value="10">Sandwitch</asp:ListItem>
                                <asp:ListItem Value="11">Steak</asp:ListItem>
                            </asp:DropDownList>
                        </FooterTemplate>

                        <ItemStyle Width="30px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="100px" HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="lblPrice" runat="server"
                                Text='<%# Eval("Price")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtPrice" runat="server"
                                Text='<%# Eval("Price")%>' Height="25px" Width="81px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insPrice" runat="server" Width="81px" Height="25px"></asp:TextBox>
                        </FooterTemplate>

                        <ItemStyle Width="100px"></ItemStyle>

                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width="30px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkRemove" runat="server"
                                CommandArgument='<%# Eval("ItemID")%>'
                                OnClientClick="return confirm('Do you want to delete?')"
                                Text="Delete" OnClick="DeleteFood"></asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="btnAdd" runat="server" Text="Add"
                                OnClick="AddNewFood" />
                        </FooterTemplate>

                        <ItemStyle Width="30px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
                <AlternatingRowStyle BackColor="whitesmoke" />

                <HeaderStyle BackColor="#FF6600"></HeaderStyle>

            </asp:GridView>

            <span style="position: absolute; font-size: 20px; left: 31px; top: 9px; width: 154px; height: 33px;">Food Items</span>
        </div>

    </div>
</asp:Content>
