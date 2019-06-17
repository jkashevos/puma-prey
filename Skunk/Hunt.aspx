<%@ Page Title="Hunt" Language="C#" AutoEventWireup="true" CodeBehind="Hunt.aspx.cs" Inherits="Skunk.Hunt" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <body>
        <% if (!hunt_overview)
            { %>
                <div>
                    <h3>Hunt Name:</h3>
                    <asp:Label ID="lblProductName" runat="server" Text=""></asp:Label>
                    <h3>Hunt Details:</h3>
                    <asp:Label ID="lDetails" runat="server" Text=""></asp:Label>
                    <h3>Hunt Price:</h3>
                    <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>
                    <h3>Comments:</h3>
                    <asp:HyperLink ID="hlRate" runat="server">Comments</asp:HyperLink>
                    <asp:HiddenField ID="hProdID" runat="server" />
                </div>
        <% }
           else
           { %>
                <div>
                    <asp:GridView runat="server" ID="huntGrid" AutoGenerateColumns="false">
                        <Columns>
                            <asp:HyperLinkField DataTextField="Name" HeaderText="Hunt Name" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="hunt.aspx?h={0}" />
                            <asp:BoundField DataField="Price" HeaderText="Hunt Price"/>
                            <asp:BoundField DataField="Description" HeaderText="Hunt Description"/>
                        </Columns>
                    </asp:GridView>
                </div>
        <% } %>
    </body>
</asp:Content>
