<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="aOrderDetails.aspx.cs" Inherits="project_food_panda.Forms.aOrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 817px; position: relative; left: 0px; top: 0px; width: 1349px;">

        <div style="position: relative; left: 35px; top: 46px; width: 922px; height: 320px;">

            <asp:GridView ID="GridView1" runat="server" Style="position: absolute; left: 29px; top: 53px; width: 675px;"
                AutoGenerateColumns="false" Font-Names="Arial"
                AlternatingRowStyle-BackColor="white"
                HeaderStyle-BackColor="white" AllowPaging="true"
                OnPageIndexChanging="OnPaging" PageSize="20">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="OrderID">
                        <ItemTemplate>
                            <asp:Label ID="lblOrderID" runat="server"
                                Text='<%# Eval("OrderID")%>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle Width="30px"></ItemStyle>

                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="ItemID/DealID">
                        <ItemTemplate>
                            <asp:Label ID="lblItem_Deal_ID" runat="server"
                                Text='<%# Eval("Item_Deal_ID")%>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle Width="30px"></ItemStyle>

                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="lblQuantity" runat="server"
                                Text='<%# Eval("Quantity")%>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle Width="30px"></ItemStyle>

                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Subtotal">
                        <ItemTemplate>
                            <asp:Label ID="lblSubtotal" runat="server"
                                Text='<%# Eval("Subtotal")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="IsDeal">
                        <ItemTemplate>
                            <asp:Label ID="lblIsDeal" runat="server"
                                Text='<%# Eval("IsDeal")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <AlternatingRowStyle BackColor="whitesmoke" />

                <HeaderStyle BackColor="#FF6600"></HeaderStyle>

            </asp:GridView>

            <span style="position: absolute; font-size: 20px; left: 31px; top: 9px; width: 154px; height: 33px;">Order Details</span>

        </div>
    </div>
</asp:Content>
