<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="aDelieverTown.aspx.cs" Inherits="project_food_panda.Forms.aDelieverTown" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 817px; position: relative; left: 0px; top: 0px; width: 1349px;">

        <div style="position: relative; left: 35px; top: 46px; width: 922px; height: 320px;">

            <asp:GridView ID="GridView1" runat="server" Style="position: absolute; left: 29px; top: 53px; width: 546px;"
                AutoGenerateColumns="false" Font-Names="Arial"
                AlternatingRowStyle-BackColor="white"
                HeaderStyle-BackColor="white" AllowPaging="true" ShowFooter="true"
                OnPageIndexChanging="OnPaging" PageSize="20">
                <Columns>

                    <asp:TemplateField ItemStyle-Width="100px" HeaderText="RestaurantID">
                        <ItemTemplate>
                            <asp:Label ID="lblRestaurantID" runat="server"
                                Text='<%# Eval("RestaurantID")%>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insRestaurantID" runat="server" Width="230px"></asp:TextBox>
                        </FooterTemplate>

                        <ItemStyle Width="100px"></ItemStyle>

                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="100px" HeaderText="Town">
                        <ItemTemplate>
                            <asp:Label ID="lblTown" runat="server"
                                Text='<%# Eval("Town")%>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insTown" runat="server" Width="230px"></asp:TextBox>
                        </FooterTemplate>

                        <ItemStyle Width="100px"></ItemStyle>

                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width="30px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkRemove" runat="server"
                                CommandArgument='<%# Eval("RestaurantID") + "," + Eval("Town")%>'
                                OnClientClick="return confirm('Do you want to delete?')"
                                Text="Delete" OnClick="DeleteTown"></asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="btnAdd" runat="server" Text="Add"
                                OnClick="AddNewTown" />
                        </FooterTemplate>

                        <ItemStyle Width="30px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="false" />
                </Columns>
                <AlternatingRowStyle BackColor="whitesmoke" />

                <HeaderStyle BackColor="#FF6600"></HeaderStyle>

            </asp:GridView>

            <span style="position: absolute; font-size: 20px; left: 31px; top: 9px; width: 154px; height: 33px;">Deliever Towns</span>
        </div>

    </div>
</asp:Content>
