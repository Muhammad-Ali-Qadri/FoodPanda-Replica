<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="project_food_panda.Forms.adminlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 817px; position: relative; left: 0px; top: 0px; width: 1349px;">

        <div style="position: relative; left: 35px; top: 46px; width: 922px; height: 320px;">

            <span style="font-size: 20px;">Show table for: </span>

            <asp:Button ID="Button_aRestaurant" runat="server" Style="position: absolute; width: 150px; height: 28px; left: 131px; top: 42px;" BackColor="#FF6600" BorderColor="#FF6600" BorderStyle="Outset" ForeColor="White" Text="Restaurants" OnClick="Button_aRestaurant_Click" />
            <asp:Button ID="Button_aFoodItems" runat="server" Style="position: absolute; width: 150px; height: 29px; left: 308px; top: 42px;" BackColor="#FF6600" BorderColor="#FF6600" BorderStyle="Outset" ForeColor="White" Text="FoodItems" OnClick="Button_aFoodItems_Click" />
            <asp:Button ID="Button_aDeals" runat="server" Style="position: absolute; width: 150px; height: 28px; left: 471px; top: 41px;" BackColor="#FF6600" BorderColor="#FF6600" BorderStyle="Outset" ForeColor="White" Text="Deals" OnClick="Button_aDeals_Click" />
            <asp:Button ID="Button_aDealDescription" runat="server" Style="position: absolute; width: 155px; height: 26px; left: 129px; top: 101px;" BackColor="#FF6600" BorderColor="#FF6600" BorderStyle="Outset" ForeColor="White" Text="Deal's Description" OnClick="Button_aDealDescription_Click" />
            <asp:Button ID="Button_aDelieverTown" runat="server" Style="position: absolute; width: 150px; height: 28px; left: 309px; top: 100px;" BackColor="#FF6600" BorderColor="#FF6600" BorderStyle="Outset" ForeColor="White" Text="DelieverTown" OnClick="Button_aDelieverTown_Click" />
            <asp:Button ID="Button_aUsers" runat="server" Style="position: absolute; width: 150px; height: 28px; left: 473px; top: 100px;" BackColor="#FF6600" BorderColor="#FF6600" BorderStyle="Outset" ForeColor="White" Text="Users" OnClick="Button_aUsers_Click" />
            <asp:Button ID="Button_aOrder" runat="server" Style="position: absolute; width: 150px; height: 28px; left: 219px; top: 160px;" BackColor="#FF6600" BorderColor="#FF6600" BorderStyle="Outset" ForeColor="White" Text="Orders" OnClick="Button_aOrder_Click" />
            <asp:Button ID="Button_aOrderDetails" runat="server" Style="position: absolute; width: 150px; height: 28px; left: 401px; top: 160px;" BackColor="#FF6600" BorderColor="#FF6600" BorderStyle="Outset" ForeColor="White" Text="Order Details" OnClick="Button_aOrderDetails_Click" />

        </div>
    </div>
</asp:Content>
