<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUD_ADO._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
    <h3>CRUD Operation with ADO.NET</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CssClass="table table-bordered table-condensed">
        <Columns>
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" ReadOnly="true"></asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="ReEmail" HeaderText="ReEmail" SortExpression="ReEmail"></asp:BoundField>
            <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age"></asp:BoundField>
            <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" CausesValidation="false"></asp:CommandField>
            <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn btn-danger" CausesValidation="false"></asp:CommandField>
        </Columns>
    </asp:GridView>
        <asp:ObjectDataSource
            ID="ObjectDataSource1"
            runat="server"
            OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAllStudents"
            TypeName="StudentDB"
            DataObjectTypeName="Students"
            InsertMethod="InsertStudent"
            DeleteMethod="DeleteStudent"
            UpdateMethod="UpdateStudent"
            ConflictDetection="CompareAllValues">
            <UpdateParameters>
                <asp:Parameter Name="original_Student" Type="Object"></asp:Parameter>
                <asp:Parameter Name="student" Type="Object"></asp:Parameter>
            </UpdateParameters>
        </asp:ObjectDataSource>
    </div>
    <div class="row">
        <h4>Insert New Student</h4>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="30%" AutoGenerateRows="False" DataSourceID="ObjectDataSource1" DefaultMode="Insert" CssClass="table table-bordered table-condensed">
            <Fields>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control" CausesValidation="True" />
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Value Required" ControlToValidate="txtName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Name must be in BLOCK letter" Display="Dynamic" OnServerValidate="CustomValidator1_ServerValidate" ControlToValidate="txtName" ForeColor="Red"></asp:CustomValidator>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control" CausesValidation="True" />
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Value Required" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email must be gmail" ForeColor="Red" ValidationExpression="^[\w.+\-]+@gmail.com$" ControlToValidate="txtEmail" Display="Dynamic"></asp:RegularExpressionValidator>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ReEmail">
                <ItemTemplate>
                    <asp:TextBox ID="txtReEmail" runat="server" Text='<%# Bind("ReEmail") %>' CssClass="form-control" CausesValidation="True" />
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Value Required" ControlToValidate="txtReEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Email must be matched" ForeColor="Red" ControlToValidate="txtReEmail" ControlToCompare="txtEmail" Display="Dynamic"></asp:CompareValidator>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Age">
                <ItemTemplate>
                    <asp:TextBox ID="txtAge" runat="server" Text='<%# Bind("Age") %>' CssClass="form-control" CausesValidation="True" />
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Value Required" ControlToValidate="txtAge" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Age must be 25 - 32" MaximumValue="32" MinimumValue="25" Type="Integer" ControlToValidate="txtAge" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" ControlStyle-CssClass="btn btn-info"></asp:CommandField>
        </Fields>
    </asp:DetailsView>
    </div>
</asp:Content>
