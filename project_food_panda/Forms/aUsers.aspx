<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="aUsers.aspx.cs" Inherits="project_food_panda.Forms.aUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 817px; position: relative; left: 0px; top: 0px; width: 1349px;">

        <div style="position: relative; left: 35px; top: 46px; width: 922px; height: 320px;">

            <asp:GridView ID="GridView1" runat="server" Style="position: absolute; left: 29px; top: 53px; width: 675px;"
                AutoGenerateColumns="false" Font-Names="Arial"
                AlternatingRowStyle-BackColor="white"
                HeaderStyle-BackColor="white" AllowPaging="true"
                OnPageIndexChanging="OnPaging" PageSize="20">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="UserID">
                        <ItemTemplate>
                            <asp:Label ID="lblUserID" runat="server"
                                Text='<%# Eval("UserID")%>'></asp:Label>
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
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="MobileNo">
                        <ItemTemplate>
                            <asp:Label ID="lblMobileNo" runat="server"
                                Text='<%# Eval("MobileNo")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server"
                                Text='<%# Eval("Email")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Password">
                        <ItemTemplate>
                            <asp:Label ID="lblPassword" runat="server"
                                Text='<%# Eval("Password")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <AlternatingRowStyle BackColor="whitesmoke" />

                <HeaderStyle BackColor="#FF6600"></HeaderStyle>

            </asp:GridView>

            <span style="position: absolute; font-size: 20px; left: 31px; top: 9px; width: 154px; height: 33px;">Users </span>

        </div>
    </div>
</asp:Content>
