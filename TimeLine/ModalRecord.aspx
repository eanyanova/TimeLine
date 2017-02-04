<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModalRecord.aspx.cs" Inherits="TimeLine.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="modal" runat="server">
        Name<br />
        <asp:TextBox ID="name_record" runat="server" Height="25px" Width="450px"></asp:TextBox>
        <br />
        Category<br />
        <asp:DropDownList ID="category_record" runat="server" Height="25px" style="margin-bottom: 0px" Width="100px" DataSourceID="SqlDataSourceDICT_CATEGORY" DataTextField="NAME" DataValueField="ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceDICT_CATEGORY" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [DICT_CATEGORY]"></asp:SqlDataSource>
        Date<asp:Calendar ID="date_record" runat="server"></asp:Calendar>
        <br />
        Description<br />
        <asp:TextBox ID="description_record" runat="server" Height="200px" Width="450px"></asp:TextBox>
        <br />
        Picture<br />
        <asp:FileUpload ID="picture_record" runat="server" Width="450px" />
        <br />
        <asp:Button ID="save_record" runat="server" OnClick="save_record_Click" Text="Save" />
        <asp:SqlDataSource ID="SqlDataSourceDAT_RECORD" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO DAT_RECORD(NAME, PICTURE, DATE, DESCRIPTION, CATEGORY) VALUES (@name,@picture,@date,@description,@category)" SelectCommand="SELECT * FROM [DAT_RECORD]">
            <InsertParameters>
                <asp:ControlParameter ControlID="category_record" Name="category" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="date_record" Name="date" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="name_record" Name="name" PropertyName="Text" />
                <asp:ControlParameter ControlID="description_record" Name="description" PropertyName="Text" />
                <asp:ControlParameter ControlID="picture_record" Name="picture" PropertyName="FileBytes" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
