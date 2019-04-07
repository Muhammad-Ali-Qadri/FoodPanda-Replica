<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="aDealDescription.aspx.cs" Inherits="project_food_panda.Forms.aDealDescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 817px; position: relative; left: 0px; top: 0px; width: 1349px;">

        <div style="position: relative; left: 35px; top: 46px; width: 922px; height: 320px;">

            <asp:GridView ID="GridView2" runat="server" Style="position: absolute; left: 227px; top: 52px; width: 340px;"
                AutoGenerateColumns="false" Font-Names="Arial"
                AlternatingRowStyle-BackColor="white"
                HeaderStyle-BackColor="white" AllowPaging="true" ShowFooter="true"
                OnPageIndexChanging="OnPaging" OnRowEditing="EditDealDescription"
                OnRowUpdating="UpdateDealDescription" OnRowCancelingEdit="CancelEditDealDescription"
                PageSize="20">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="20px" HeaderText="DealID">
                        <ItemTemplate>
                            <asp:Label ID="lblDealID" runat="server"
                                Text='<%# Eval("DealID")%>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insDealID" runat="server" Width="100px"></asp:TextBox>
                        </FooterTemplate>
                        <ItemStyle Width="20px"></ItemStyle>

                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width="20px" HeaderText="ItemID">
                        <ItemTemplate>
                            <asp:Label ID="lblItemID" runat="server"
                                Text='<%# Eval("ItemID")%>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insItemID" runat="server" Width="100px"></asp:TextBox>
                        </FooterTemplate>
                        <ItemStyle Width="20px"></ItemStyle>

                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width="20px" HeaderText="Quantity" HeaderStyle-Width="20px">
                        <ItemTemplate>
                            <asp:Label ID="lblQuantity" runat="server"
                                Text='<%# Eval("Quantity")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox required="required" ID="txtQuantity" runat="server"
                                Text='<%# Eval("Quantity")%>' Height="21px" Width="100px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox required="required" ID="insQuantity" runat="server" Width="100px"></asp:TextBox>
                        </FooterTemplate>

                        <HeaderStyle Width="20px"></HeaderStyle>

                        <ItemStyle Width="20px"></ItemStyle>
                    </asp:TemplateField>


                    <asp:TemplateField ItemStyle-Width="30px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkRemove" runat="server"
                                CommandArgument='<%# Eval("ItemID") + "," + Eval("DealID")%>'
                                OnClientClick="return confirm('Do you want to delete?')"
                                Text="Delete" OnClick="DeleteDealDescription"></asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="btnAdd" runat="server" Text="Add"
                                OnClick="AddNewDealDescription" />
                        </FooterTemplate>

                        <ItemStyle Width="30px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
                <AlternatingRowStyle BackColor="whitesmoke" />

                <HeaderStyle BackColor="#FF6600"></HeaderStyle>

            </asp:GridView>

            <span style="position: absolute; font-size: 20px; left: 3px; top: 2px; width: 184px; height: 37px;">&nbsp;&nbsp;&nbsp;&nbsp; Deal&nbsp; Description
            </span>


        </div>
    </div>

</asp:Content>
