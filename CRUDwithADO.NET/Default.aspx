<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUDwithADO.NET._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID"></asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone"></asp:BoundField>
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject"></asp:BoundField>
            <asp:BoundField DataField="SessionYear" HeaderText="SessionYear" SortExpression="SessionYear"></asp:BoundField>
            <asp:CommandField ShowEditButton="True" CausesValidation="false"></asp:CommandField>
            <asp:CommandField ShowDeleteButton="True" CausesValidation="false"></asp:CommandField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllStudents" TypeName="StudentDB" DataObjectTypeName="CRUDwithADO.NET.Students" DeleteMethod="DeleteStudent" InsertMethod="InsertStudent" UpdateMethod="UpdateStudent">
        <UpdateParameters>
            <asp:Parameter Name="originalStd" Type="Object"></asp:Parameter>
            <asp:Parameter Name="std" Type="Object"></asp:Parameter>
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
