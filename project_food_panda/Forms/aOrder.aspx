<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="aOrder.aspx.cs" Inherits="project_food_panda.Forms.aOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 817px; position: relative; left: 0px; top: 0px; width: 1349px;">

        <div style="position: relative; left: 35px; top: 46px; width: 922px; height: 320px;">

            <asp:GridView ID="GridView1" runat="server" Style="position: absolute; left: 29px; top: 53px; width: 675px;"
                AutoGenerateColumns="false" Font-Names="Arial"
                AlternatingRowStyle-BackColor="white"
                HeaderStyle-BackColor="white" AllowPaging="true"
                OnPageIndexChanging="OnPaging" PageSize="10">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="OrderID">
                        <ItemTemplate>
                            <asp:Label ID="lblOrderID" runat="server"
                                Text='<%# Eval("OrderID")%>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle Width="30px"></ItemStyle>

                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="UserID">
                        <ItemTemplate>
                            <asp:Label ID="lblUserID" runat="server"
                                Text='<%# Eval("UserID")%>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle Width="30px"></ItemStyle>

                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="RestaurantID">
                        <ItemTemplate>
                            <asp:Label ID="lblRestaurantID" runat="server"
                                Text='<%# Eval("RestaurantID")%>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle Width="30px"></ItemStyle>

                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="FirstName">
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server"
                                Text='<%# Eval("FirstName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="LastName">
                        <ItemTemplate>
                            <asp:Label ID="lblLastName" runat="server"
                                Text='<%# Eval("LastName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="PhoneNo">
                        <ItemTemplate>
                            <asp:Label ID="lblPhoneNo" runat="server"
                                Text='<%# Eval("PhoneNo")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="DeliveryAddress">
                        <ItemTemplate>
                            <asp:Label ID="lblDeliveryAddress" runat="server"
                                Text='<%# Eval("DeliveryAddress")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="deliveryDate">
                        <ItemTemplate>
                            <asp:Label ID="lbldeliveryDate" runat="server"
                                Text='<%# Eval("deliveryDate")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="TotalBill">
                        <ItemTemplate>
                            <asp:Label ID="lblTotalBill" runat="server"
                                Text='<%# Eval("TotalBill")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <AlternatingRowStyle BackColor="whitesmoke" />

                <HeaderStyle BackColor="#FF6600"></HeaderStyle>

            </asp:GridView>

            <span style="position: absolute; font-size: 20px; left: 31px; top: 9px; width: 154px; height: 33px;">Orders</span>

        </div>
    </div>
</asp:Content>
