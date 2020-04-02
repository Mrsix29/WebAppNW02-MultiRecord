<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MultiRecordQueryWithCustomGridView.aspx.cs" Inherits="WebApp.ExercisePages.MultiRecordQueryWithCustomGridView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h1> Multi Record Query - Code Behind</h1>
   <div class="offset-2">
        <asp:Label ID="TeamsLabel" runat="server" Text="Select a Team"></asp:Label>&nbsp;&nbsp;
        <asp:DropDownList ID="TeamList" runat="server"></asp:DropDownList>&nbsp;&nbsp;
        <asp:Button ID="Fetch" runat="server" Text="Fetch" CausesValidation="false" OnClick="Fetch_Click" />
        <br /><br />
        <asp:Label ID="MessageLabel" runat="server"></asp:Label>
        <br />
                <div class="row">
            <div class="col-md-12">
                <asp:Label runat="server" Text="Coach:"></asp:Label>&nbsp;&nbsp;
                <asp:Label ID="Coach" runat="server"></asp:Label>
            </div>
            <div class="col-md-12">
                <asp:Label runat="server" Text="Assistant Coach:"></asp:Label>&nbsp;&nbsp;
                <asp:Label ID="AssistantCoach" runat="server"></asp:Label>
            </div>
            <div class="col-md-12">
                <asp:Label runat="server" Text="Wins:"></asp:Label>&nbsp;&nbsp;
                <asp:Label ID="Wins" runat="server"></asp:Label>
            </div>
            <div class="col-md-12">
                <asp:Label runat="server" Text="Losses:"></asp:Label>&nbsp;&nbsp;
                <asp:Label ID="Losses" runat="server"></asp:Label>
            </div>
        </div>
        <br />
            <asp:GridView ID="PlayerList" runat="server" 
            AutoGenerateColumns="False"
             CssClass="table table-striped" GridLines="Horizontal"
             BorderStyle="None" AllowPaging="True" OnPageIndexChanging="List02_PageIndexChanging" PageSize="5" OnSelectedIndexChanged="List02_SelectedIndexChanged">

            <Columns>
<%--                <asp:TemplateField HeaderText="Player ID" Visible="true">
                    <ItemStyle HorizontalAlign="Left" />
                    <ItemTemplate>
                        <asp:Label ID="PlayerID" runat="server"
                            Text='<%# string.Format("{0}", Eval("PlayerID")) %>'>
                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:TemplateField HeaderText="Name">
                    <ItemStyle HorizontalAlign="Left" />
                    <ItemTemplate>
                        <asp:Label ID="PlayerName" runat="server"
                            Text='<%# Eval("PlayerName") %>'>
                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Age" Visible="true">
                    <ItemStyle HorizontalAlign="Left" />
                    <ItemTemplate>
                        <asp:Label ID="Age" runat="server"
                            Text='<%# Eval("Age") %>'>
                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gender" Visible="true">
                    <ItemStyle HorizontalAlign="Left" />
                    <ItemTemplate>
                        <asp:Label ID="Gender" runat="server"
                            Text='<%# Eval("Gender") %>'>
                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Med Alert">
                    <itemstyle horizontalalign="Left" />
                    <itemtemplate>
                        <asp:Label ID="MedicalAlertDetails" runat="server"
                            Text='<%# Eval("MedicalAlertDetails") %>'>
                        </asp:Label>
                    </itemtemplate>
                </asp:TemplateField>
                
            </Columns>
            <EmptyDataTemplate>
                No data available at this time
            </EmptyDataTemplate>
            <PagerSettings FirstPageText="Start" LastPageText="End" Mode="NumericFirstLast" PageButtonCount="3" />
        </asp:GridView>
        <%-- Todo Custom Grid View --%>

    </div>
</asp:Content>
