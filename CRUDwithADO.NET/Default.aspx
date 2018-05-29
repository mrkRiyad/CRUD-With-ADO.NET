<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUDwithADO.NET._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID"></asp:BoundField>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("Name") %>' Width="88px" CausesValidation="True" />
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                </ItemTemplate>
            </asp:TemplateField>
            <%--<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>--%>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone"></asp:BoundField>
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject"></asp:BoundField>
            <asp:BoundField DataField="SessionYear" HeaderText="SessionYear" SortExpression="SessionYear"></asp:BoundField>
            <asp:CommandField ShowEditButton="True" CausesValidation="true"></asp:CommandField>
            <asp:CommandField ShowDeleteButton="True" CausesValidation="false"></asp:CommandField>
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
    <br /><br />
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="50%" AutoGenerateRows="False" DataSourceID="ObjectDataSource1" DefaultMode="Insert" CssClass="table table-bordered table-condensed">
        <Fields>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>' Width="88px" CausesValidation="True" />
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone"></asp:BoundField>
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject"></asp:BoundField>
            <asp:BoundField DataField="SessionYear" HeaderText="SessionYear" SortExpression="SessionYear"></asp:BoundField>
            <asp:CommandField ShowInsertButton="True"></asp:CommandField>
        </Fields>
    </asp:DetailsView>
</asp:Content>
