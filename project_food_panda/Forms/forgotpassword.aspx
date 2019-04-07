<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="project_food_panda.Forms.forgotpassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Content/Login.css" rel="stylesheet" />
    <br />
    <div style="background-color:whitesmoke  ;width:700px;height:300px">
     <div>
    <p style="margin:20px">Recover your account.</p>
    </div>
        <div>
           <p style="margin:20px">To reset your password, please enter your e-mail address. <br /> turn, we will send you a password link via mail.</p>
             <asp:TextBox ID="txt_email" runat="server" placeholder="E-mail" CssClass="inputfields" style="margin:20px"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" Text="Request Link" class="loginbutton"/>
            </div>
        <footer>
            <div>
                <p style="text-align:center">Already On FoodPanda?<br />
                  <asp:HyperLink ID="HyperLink1" runat="server" style=" color:seagreen" href="/Forms/Login.aspx">Log In</asp:HyperLink></p>
   
            </div>
        </footer>

        </div>
</asp:Content>
