<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Log.aspx.vb" Inherits="Log" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


p
{
    margin-bottom: 10px;
    line-height: 1.6em;
}


a:link, a:visited
{
    color: #034af3;
}

.header
{
    position: relative;
    margin: 0px;
    padding: 0px;
    background: #4b6c9e;
    width: 100%;
            top: -18px;
            left: 1px;
            height: 36px;
        }

.title
{
    display: block;
    float: left;
    text-align: left;
    width: 122px;
}

.header h1
{
    font-weight: 700;
    margin: 0px;
    padding: 0px 0px 0px 20px;
    color: #f9f9f9;
    border: none;
    line-height: 2em;
    font-size: 2em;
}

h1
{
    font-size: 1.6em;
    padding-bottom: 0px;
    margin-bottom: 0px;
}

h1, h2, h3, h4, h5, h6
{
    font-size: 1.5em;
    color: #666666;
    font-variant: small-caps;
    text-transform: none;
    font-weight: 200;
    margin-bottom: 0px;
}

.loginDisplay
{
    font-size: 1.1em;
    display: block;
    text-align: right;
    padding: 10px;
    color: White;
}

.clear
{
    clear: both;
}

        .style1
        {
            width: 970px;
            height: 100px;
        }

    .s EM {
	COLOR: #000
}
EM {
	FONT-STYLE: normal; FONT-WEIGHT: bold
}

        .style3
        {
            height: 30px;
        }
        .style4
        {
            height: 24px;
        }

        .style5
        {
            height: 35px;
        }
        .style6
        {
            height: 36px;
        }

        .style7
        {
            height: 27px;
        }
        .style8
        {
            height: 26px;
        }

    </style>
</head>
<body bgcolor="#e0e0e0">
    <form id="form1" runat="server" style="background-color: #FFFFFF">
    
    <div style="height: 103px">
    
         <img alt="" class="style1" src="Imagenes/Menu.bmp" /><br />
        <div class="header" style="background-color: #5D7B9D; text-align: left;">
            <div class="loginDisplay" align="right" 
                
                style="font-family: Verdana; text-align: left; font-size: 20px; height: 36px;">
                -ESTADO DE REPARACIONES-&nbsp; Uso exclusivo para Clientes&nbsp;
            </div>
        </div>
    
    </div>
    <p style="font-family: Verdana; font-size: small; height: 3px;">
        &nbsp;</p>
    <p style="font-family: Verdana; font-size: small; height: 4px;">
        Ingrese los datos de su Orden de Ingreso a Reparación para poder consultar su estado actual.</p>
    <p style="font-family: Verdana; font-size: small; height: 15px;">
        Recuerde que la Razón Social del Cliente y el Número de Orden asignado en el 
        informe deben ser ingresados correctamente: </p>
    <p style="font-family: Verdana; font-size: small">
        <asp:Login ID="Login1" runat="server" BackColor="#E3EAEB" BorderColor="#E6E2D8" 
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
        Font-Size="0.8em" Height="95px" Width="243px" 
            style="margin-right: 17px" ViewStateMode="Disabled" 
        DestinationPageUrl="~/Reparaciones.aspx" BorderPadding="4" ForeColor="#333333" 
            TextLayout="TextOnTop">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <LayoutTemplate>
            <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0" style="height:216px;width:430px;" align="left">
                            <tr>
                                <td align="center" colspan="2" 
                                    
                                    style="color:White;background-color:#5D7B9D;font-size:0.9em;font-weight:bold; font-family: Verdana;" 
                                    class="style8">
                                    Iniciar sesión de cliente</td>
                            </tr>
                            <tr>
                                <td align="right" class="style5">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Cliente:   </asp:Label>
                                </td>
                                <td class="style5">
                                    <asp:TextBox ID="UserName" runat="server" Font-Names="Verdana" 
                                        Font-Size="Small" MaxLength="40" Width="213px" 
                                        ontextchanged="UserName_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" 
                                        ErrorMessage="El nombre de usuario es obligatorio." 
                                        ToolTip="El nombre de usuario es obligatorio." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style6">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Número de Orden:</asp:Label>
                                </td>
                                <td class="style6">
                                    <asp:TextBox ID="Password" runat="server" Font-Names="Verdana" 
                                        Font-Size="Small" TextMode="Password" MaxLength="6" Width="211px" 
                                        ontextchanged="Password_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="La contraseña es obligatoria." 
                                        ToolTip="La contraseña es obligatoria." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="style3">
                                    <asp:CheckBox ID="RememberMe" runat="server" 
                                        Text="Recordármelo la próxima vez." />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;" class="style4">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2" class="style7">
                                    <asp:Button ID="LoginButton" runat="server" BackColor="#FFFBFF" 
                                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" 
                                        Font-Names="Verdana" Font-Size="Small" ForeColor="#284775" 
                                        Text="Consultar" ValidationGroup="Login1" 
                                        onclick="LoginButton_Click1" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
            <LoginButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" 
                BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
            <TextBoxStyle Font-Size="0.8em" />
        <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" 
            ForeColor="#FFFFFF" Font-Size="0.9em" />
    </asp:Login>
    </p>
    <p style="font-family: Verdana; font-size: small">
        &nbsp;</p>
        <p style="font-family: Verdana; font-size: small; height: 9px;">
        Consultas Web 1.3<b>&nbsp; </b><span class="st">©2019 ( (<em>S.E.U.O.</em>)&nbsp;&nbsp; </span>&nbsp;</p>
    <p style="font-family: Verdana; font-size: small; height: 18px;">
        Si desea conocer nuestros productos <a href="http://www.ecadat.com.ar">Visite 
        nuestra pagina Web.</a></p>
    
    </form>
</body>
</html>
