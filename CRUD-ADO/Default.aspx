<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUD_ADO._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
    <h3>CRUD Operation with ADO.NET</h3>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" AllowPaging="True" CssClass="table table-bordered table-condensed">
        <Columns>
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID"></asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone"></asp:BoundField>
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject"></asp:BoundField>
            <asp:BoundField DataField="SessionYear" HeaderText="SessionYear" SortExpression="SessionYear"></asp:BoundField>
            <asp:CommandField ShowEditButton="True" CausesValidation="false" ControlStyle-CssClass="btn btn-primary text-center"></asp:CommandField>
            <asp:CommandField ShowDeleteButton="True" CausesValidation="false" ControlStyle-CssClass="btn btn-danger text-center"></asp:CommandField>
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
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="50%" AutoGenerateRows="False" DataSourceID="ObjectDataSource1" DefaultMode="Insert" CssClass="table table-bordered table-condensed">
        <Fields>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control" CausesValidation="True" />
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control" CausesValidation="True" />
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone">
                <ItemTemplate>
                    <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>' CssClass="form-control" CausesValidation="True" />
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Subject">
                <ItemTemplate>
                    <asp:TextBox ID="txtSubject" runat="server" Text='<%# Bind("Subject") %>' CssClass="form-control" CausesValidation="True" />
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtSubject"></asp:RequiredFieldValidator>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SessionYear">
                <ItemTemplate>
                    <asp:TextBox ID="txtSessionYear" runat="server" Text='<%# Bind("SessionYear") %>' CssClass="form-control" CausesValidation="True" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" ControlStyle-CssClass="btn btn-info"></asp:CommandField>
        </Fields>
    </asp:DetailsView>
    </div>
</asp:Content>
