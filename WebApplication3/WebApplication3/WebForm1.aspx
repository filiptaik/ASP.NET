<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Koerad</title>
    <link href="Content/bootstrap-theme.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Koerte loetelu</h1>
            <p>&nbsp;</p>
            <p>
                <asp:TextBox ID="TextBox1" runat="server" style="margin-bottom: 0px; height: 25px;"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Otsi" />
            </p>
            <a href="About.aspx">
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="Koerte andmed puuduvad">
                <Columns>
                    <asp:CommandField ShowEditButton="True" EditText="Muuda" UpdateText="Salvesta muutused" CancelText="Katkesta" />
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="koeranimi" HeaderText="koera nimi" SortExpression="koeranimi" />
                    <asp:BoundField DataField="synniaasta" HeaderText="sünniaasta" SortExpression="synniaasta" />
                </Columns>
            </asp:GridView>
            </a>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:koeradConnectionString1 %>" DeleteCommand="DELETE FROM [Table] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Table] ([koeranimi], [synniaasta]) VALUES (@koeranimi, @synniaasta)" SelectCommand="SELECT [Id], [koeranimi], [synniaasta] FROM [Table] WHERE ([koeranimi] LIKE '%' + @koeranimi + '%') ORDER BY [koeranimi]" UpdateCommand="UPDATE [Table] SET [koeranimi] = @koeranimi, [synniaasta] = @synniaasta WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="koeranimi" Type="String" />
                    <asp:Parameter Name="synniaasta" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="koeranimi" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false"  />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="koeranimi" Type="String" />
                    <asp:Parameter Name="synniaasta" Type="Int32" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="50px" Width="256px">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="id" Visible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="koeranimi" HeaderText="koeranimi" SortExpression="koeranimi" />
                <asp:BoundField DataField="synniaasta" HeaderText="synniaasta" SortExpression="synniaasta" />
                <asp:CommandField ShowInsertButton="True" InsertText="Lisa" CancelText="Tühjenda" />
            </Fields>
        </asp:DetailsView>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
