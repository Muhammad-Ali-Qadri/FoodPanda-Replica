<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="project_food_panda._Default" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="jumbotron" style="background-image: url('/Images/homepage-splash.jpg'); background-size: cover; height: 600px; width: 1349px; opacity: 0.7; margin-bottom: 500px;">
        <div style="opacity: 1">
            <p style="color: orangered; text-align: center; font-size: 50px;">
                Order food online from 1000+ restaurants!
            </p>
            <p style="color: black; text-align: center">Home delivery from local restaurants right to your doorstep</p>
        </div>
        <div style="position: absolute; left: 52px; top: 209px; width: 1083px; height: 168px; margin-bottom: 0px;">
            <table style="width: 68%; position: relative; height: 76px; margin-left: 150px; margin-top: 0px; left: 151px; top: 23px;">
                <tr>
                    <td style="width: 252px">&nbsp;  
                        <asp:DropDownList ID="list_city" runat="server" Style="margin-top: 15px" Height="45px" Width="240px" required="true" OnSelectedIndexChanged="list_area_selectedindexchange" AutoPostBack="true" ViewStateMode="Enabled" EnableViewState="true">
                        </asp:DropDownList>

                    </td>
                    <td style="width: 253px">
                        <asp:DropDownList ID="list_area" Style="margin-top: 57px" runat="server" Width="236px" required="true" Height="45px"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:Button ID="cmd_search" runat="server" Text="FIND RESTAURANTS" Height="45px" Width="240px" Style="margin-top: 57px" BackColor="green" ForeColor="White" BorderColor="Green" OnClick="cmd_search_Click" /></td>
                </tr>

            </table>

        </div>


    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="height: 42px; margin-left: 480px; position: absolute; left: -47px; top: 734px; width: 448px; margin-bottom: 90px; margin-right: 157px;">
                <span style="color: rgb(119, 119, 119); font-family: 'Open Sans', sans-serif; font-size: 18px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25.7143px; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">Get your favourite food in 4 simple steps. 
                </span>

                <span style="color: rgb(51, 51, 51); background-color: orange; font-family: 'Open Sans', sans-serif; font-size: 18px; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: 25.7143px; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none;">

                    <asp:Button ID="cmd_seehow" Style="overflow: hidden;" runat="server" Text="see how" BackColor="#FF6600" BorderColor="White" ForeColor="White" OnClick="cmd_seehow_Click" />


                    <div id="div1" runat="server" style="padding-right: -1000px; position: absolute; left: -441px; top: 42px; display: none;">
                        <img src="Images/forpic.png" />
                    </div>


                </span>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
