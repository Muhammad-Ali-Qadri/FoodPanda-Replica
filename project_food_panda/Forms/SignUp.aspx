<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="project_food_panda.Forms.Login" %>

<asp:Content ID="frm_Login" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="height: 477px;">
        <link href="../Content/SignUp.css" rel="stylesheet" />
        <div>
            <h1 class="heading">Sign up</h1>
        </div>
        <div>
            <table style="margin: 10px" class="auto-style6">
                <tr>
                    <td class="auto-style1" style="position: relative;">
                        <asp:TextBox ID="txt_firstname" required="required" runat="server" placeholder="First Name" CssClass="auto-style2" Height="25px" Width="140px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                          <asp:Label ID="lbl_firstname" runat="server" Text="Label" Style="visibility: hidden; position: absolute; left: 14px; top: 35px; color: red; right: 837px;"></asp:Label>
                        <asp:TextBox ID="txt_lastname" required="required" runat="server" placeholder="Last Name" CssClass="auto-style2" Height="25px" Width="142px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:Label ID="lbl_lastname" runat="server" Text="Label" Style="visibility: hidden; position: absolute; left: 186px; top: 35px; color: red; right: 667px; height: 25px;"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="position: relative;">
                        <asp:TextBox ID="txt_countrycode" required="required" type="text" placeholder="92" class="auto-style3" ReadOnly="true" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                                 
                        
                        <asp:TextBox ID="txt_phoneno" required="required" type="text" placeholder="Mobile" class="auto-style4" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp; 
                          <asp:Label ID="lbl_phoneno" runat="server" Text="Label" Style="visibility: hidden; position: absolute; left: 138px; top: 39px; color: red; right: 716px;"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="position: relative;">
                        <asp:TextBox ID="txt_email" required="required" runat="server" placeholder="E-mail" CssClass="auto-style5" Height="25px" Width="332px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:Label ID="lbl_email" runat="server" Text="Label" Style="visibility: hidden; position: absolute; left: 10px; top: 36px; color: red; right: 845px;"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="position: relative;">
                        <asp:TextBox ID="txt_password" required="required" type="password" runat="server" placeholder="Password" CssClass="auto-style2" Height="25px" Width="140px"></asp:TextBox>
                        &nbsp;
                          <asp:Label ID="lbl_password" runat="server" Text="Label" Style="visibility: hidden; position: absolute; left: 14px; top: 42px; color: red; right: 839px;"></asp:Label>
                        <asp:TextBox ID="txt_reenterpassword" required="required" type="password" runat="server" placeholder="Re-enter password " CssClass="auto-style2" Height="25px" Width="140px"></asp:TextBox>
                        <asp:Label ID="lbl_reenterpassword" runat="server" Text="Label" Style="visibility: hidden; position: absolute; left: 181px; top: 39px; color: red; right: 672px;"></asp:Label>
                        <br />
                        <br /></td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:CheckBox ID="chkbox_terms" runat="server" Text="I have read and accepted the terms and  conditions and privacy policy." />
                        <br />&nbsp;<asp:Label ID="lbl_warning" runat="server" Text="Label" Style="color: red; visibility: hidden;"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:Button ID="cmd_signup" runat="server" Text="Sign up" class="loginbutton" OnClick="cmd_signup_Click" />
        </div>
        <hr />
        <footer>
            <div>
                <p style="text-align: center">
                    Already on FoodPanda?<br />
                    <asp:HyperLink ID="HyperLink2" runat="server" Style="color: seagreen" href="/Forms/Login.aspx">Log in</asp:HyperLink>
                </p>
            </div>
        </footer>
    </div>
</asp:Content>
