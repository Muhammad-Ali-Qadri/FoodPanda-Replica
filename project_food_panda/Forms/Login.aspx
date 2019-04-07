<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="project_food_panda.Forms.Login1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Content/Login.css" rel="stylesheet" />
    <div style="height: 477px;">
        <div>
            <h1 class="heading" style="margin-bottom: 19px; margin-top: 50px; height: 38px;">&nbsp;Log In</h1>
        </div>
        &nbsp;&nbsp;&nbsp; 
        <span style="color: orangered; font-size: 20px; position: relative; top: 2px;">&nbsp;Login as:
        </span>
        <asp:DropDownList ID="chose_type" Style="width: 133px; color: orangered; position: relative; left: 5px; height: 20px;" runat="server">
            <asp:ListItem Value="0">User</asp:ListItem>
            <asp:ListItem Value="1">Admin</asp:ListItem>
        </asp:DropDownList>

        &nbsp;<div>
            <table style="width: 100%; margin: 10px">
                <tr>
                    <td class="auto-style1">
                        <asp:TextBox ID="txt_email" runat="server" placeholder="E-mail" CssClass="inputfields"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txt_password" type="password" placeholder="Password" class="inputfields" runat="server">
                        </asp:TextBox></td>
                </tr>
            </table>
        </div>
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink1" runat="server" class="passforgot" href="forgotpassword.aspx">Forgot your Password?</asp:HyperLink>
        </div>
        <div>
            <asp:Button ID="cmd_login" runat="server" Text="Log in" class="loginbutton" OnClick="cmd_login_Click" />

        </div>
        <hr />
        <footer>
            <div>
                <p style="text-align: center">
                    Not yet on FoodPanda?<br />
                    <asp:HyperLink ID="HyperLink2" runat="server" Style="color: seagreen" href="/Forms/SignUp.aspx">Sign Up</asp:HyperLink>
                </p>
            </div>
        </footer>
    </div>
</asp:Content>
