<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="aDeals.aspx.cs" Inherits="project_food_panda.Forms.aDeals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 817px; position: relative; left: 0px; top: 0px; width: 1349px;">

        <div style="position: relative; left: 35px; top: 46px; width: 922px; height: 320px;">

            <asp:GridView ID="GridView1" runat="server" Style="position: absolute; left: 29px; top: 53px; width: 716px;"
                AutoGenerateColumns="false" Font-Names="Arial"
                AlternatingRowStyle-BackColor="white"
                HeaderStyle-BackColor="white" AllowPaging="true" ShowFooter="true"
                OnPageIndexChanging="OnPaging" OnRowEditing="EditDeals"
                OnRowUpdating="UpdateDeals" OnRowCancelingEdit="CancelEditDeals"
                PageSize="20">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="20px" HeaderText="DealID">
                        <ItemTemplate>
                            <asp:Label ID="lblDealID" runat="server"
                                Text='<%# Eval("DealID")%>'></asp:Label>
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
                                Text='<%# Eval("RestaurantID")%>' Height="22px" Width="40px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="insRestaurantID" required="required" runat="server" Width="40px"></asp:TextBox>
                        </FooterTemplate>

                        <ItemStyle Width="40px"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width="20px" HeaderText="Name" HeaderStyle-Width="20px">
                        <ItemTemplate>
                            <asp:Label ID="lblDealName" runat="server"
                                Text='<%# Eval("DealName")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtDealName" runat="server"
                                Text='<%# Eval("DealName")%>' Height="21px" Width="100px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insDealName" runat="server" Width="100px"></asp:TextBox>
                        </FooterTemplate>

                        <HeaderStyle Width="20px"></HeaderStyle>

                        <ItemStyle Width="20px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="lblDealPrice" runat="server"
                                Text='<%# Eval("DealPrice")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtDealPrice" runat="server"
                                Text='<%# Eval("DealPrice")%>' Height="22px" Width="40px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insDealPrice" runat="server" Width="40px"></asp:TextBox>
                        </FooterTemplate>

                        <ItemStyle Width="30px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="100px" HeaderText="Description">
                        <ItemTemplate>
                            <asp:Label ID="lblDescription" runat="server"
                                Text='<%# Eval("Description")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtDescription" runat="server"
                                Text='<%# Eval("Description")%>' Height="22px" Width="230px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insDescription" runat="server" Width="230px"></asp:TextBox>
                        </FooterTemplate>

                        <ItemStyle Width="100px"></ItemStyle>

                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width="30px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkRemove" runat="server"
                                CommandArgument='<%# Eval("DealID")%>'
                                OnClientClick="return confirm('Do you want to delete?')"
                                Text="Delete" OnClick="DeleteDeals"></asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="btnAdd" runat="server" Text="Add"
                                OnClick="AddNewDeals" />
                        </FooterTemplate>

                        <ItemStyle Width="30px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
                <AlternatingRowStyle BackColor="whitesmoke" />

                <HeaderStyle BackColor="#FF6600"></HeaderStyle>

            </asp:GridView>

            <span style="position: absolute; font-size: 20px; left: 31px; top: 9px; width: 154px; height: 33px;">Deals</span>
        </div>
    </div>
</asp:Content>
