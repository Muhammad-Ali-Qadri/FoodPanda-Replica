<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="project_food_panda.Forms.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Content/checkout.css" rel="stylesheet" />
    <br />
    <br />
    <div>
        <div style="background-color: white; margin-left: 73px" class="auto-style9">
            <br />
            <div style="font-style: italic; color: #C0C0C0">&nbsp;&nbsp;&nbsp;<span class="heading">*</span>Required fields</div>

            &nbsp;<div style="color: #808080">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You should either sign up / log in or fill the form to continue.</div>
            <div>
                <table style="margin: 10px" class="auto-style6">
                    <tr>
                        <td class="auto-style1" style="color: #000000">&nbsp;<span class="heading">*</span><b>First Name</b><br />
                            <asp:TextBox ID="txt_firstname" required="required" runat="server" placeholder="First Name" CssClass="auto-style2" Height="25px" Width="323px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lbl_firstname_warning" runat="server" Text="Label" Style="visibility:hidden; width: 204px; position: absolute; left: 420px; top: 216px; color: red; right: 449px; bottom: 256px;"></asp:Label>
                        </td>


                    </tr>
                    <tr>
                        <td class="auto-style1" style="color: #000000">&nbsp;<span class="heading">*</span><b>Last Name</b><br />
                            <asp:TextBox ID="txt_lastname" required="required" runat="server" placeholder="last Name" CssClass="auto-style2" Height="25px" Width="326px"></asp:TextBox>
                            <asp:Label ID="lbl_lastname_warning" runat="server" Text="Label" Style="visibility:hidden; width: 204px; position: absolute; left: 420px; top: 284px; color: red; right: 444px; bottom: 345px;"></asp:Label>
                            <br />
                            &nbsp;<br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8">&nbsp;<span class="heading">*</span><b>Mobile</b><br />
                            <input id="txt_mobile" type="password" placeholder="92" class="auto-style3" readonly="readonly" />&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txt_phoneno" placeholder="Mobile" class="auto-style4" runat="server" Width="221px"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lbl_phoneno_warning" runat="server" Text="Label" Style="visibility:hidden; height:19px; width :204px; position: absolute; left: 420px; top: 369px; color: red; right: 696px; bottom: 214px;"></asp:Label>

                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>


    <div style="background-color: white; width: 801px; margin-left: 73px">
        <br />
        <p style="font-size: 25px">&nbsp;&nbsp;<b>Your Delivery Address</b></p>
        <hr />
        <p><span class="heading">&nbsp; *</span><span style="font-size: 19px"><b> Delivery Address</b></span></p>
        &nbsp;&nbsp;<asp:TextBox ID="txt_delivery_address" required="required" runat="server" Height="29px" Width="360px" placeholder="Please enter your full address." Style="margin-left: 11px"></asp:TextBox>

        <br />
        &nbsp;&nbsp;&nbsp;<asp:Label ID="lbl_delivery_warning" runat="server" Text="Label" Style="visibility:hidden;  position:absolute; left:420px; height:19px; width :204px; top: 552px; color: red; bottom: 182px;"></asp:Label>

        <br />


    </div>
    <br />
    <div style="background-color: white; width: 801px; margin-left: 73px">
        <br />
        <p style="font-size: 25px">&nbsp;<b> Choose how to pay</b></p>
        <hr />
        <p><span class="heading">&nbsp;&nbsp;&nbsp; *</span> Required Field</p>
        <div style="width: 770px; margin-left: 15px; border: thick none whitesmoke;">
            <div style="height: 42px">
                <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" Font-Bold="True" Font-Size="Large" ForeColor="#009933" Text="Cash On Delivery" />
                <img src="../Images/cash.jpg" style="height: 63px" />
            </div>
            <div>
                <span style="color: #C0C0C0">&nbsp;&nbsp;<br />
                    <br />
                    <br />
                    &nbsp;Pay by cash once you receive the order on your address.</span>
            </div>
        </div>
    </div>


    <br />
    <div style="background-color: white; width: 801px; margin-left: 73px">
        <br />

        <div style="width: 466px; margin-left: 316px">
            <div style="background-color: whitesmoke; padding: 10px; font-size: 20px; text-decoration: none;">
                <span>Total Rs: </span>
                <asp:Label ID="lbl_total" runat="server" Text="Label"></asp:Label>
            </div>
            <p style="color: #C0C0C0">By clicking this button you agree to our <span style="text-decoration: underline">terms and conditions.</span></p>
            <asp:Button ID="cmd_buy" Text="Place order now." runat="server" Style="background-color: #00b276; color: white; text-decoration: underline; font-size: 20px; font-weight: bold;" OnClick="cmd_buy_Click" />
        </div>

    </div>
</asp:Content>
