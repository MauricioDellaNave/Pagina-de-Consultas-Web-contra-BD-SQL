<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Simular.aspx.vb" Inherits="Simular" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">



        .style1
        {
            width: 970px;
            height: 100px;
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
            height: 62px;
        }

.title
{
    display: block;
    float: left;
    text-align: left;
    width: 707px;
            height: 74px;
            margin-bottom: 0px;
        }

h1
{
    font-size: 1.5em;
    color: #666666;
    font-variant: small-caps;
    text-transform: none;
    font-weight: 200;
    margin-bottom: 0px;
}

a:link
{
    color: #034af3;
}


        h2
{
    font-size: 1.5em;
    color: #666666;
    font-variant: small-caps;
    text-transform: none;
    font-weight: 200;
    margin-bottom: 0px;
}


h2
{
    font-size: 1.5em;
    font-weight: 600;
}

p
{
    margin-bottom: 10px;
    line-height: 1.6em;
}


EM {
	FONT-STYLE: normal; FONT-WEIGHT: bold
}
    
    .loginDisplay
{
    font-size: 1.1em;
    display: block;
    text-align: right;
    padding: 10px;
    color: White;
}

    </style>
</head>
<body>
    <form id="form2" runat="server">
    <div style="height: 141px">
    
        <img alt class="style1" src="Imagenes/Menu.bmp" /><br />
        <div class="header" style="background-color: #5D7B9D">
            <div class="title">
                <h1 style="font-family: Verdana; font-size: x-large; color: #CCCCCC;">
                    &nbsp;CONSULTAS CAPTURA DE DATOS&nbsp;
                </h1>
                <asp:Menu ID="Menu1" runat="server" BackColor="#5D7B9D" BorderStyle="Inset" 
                    DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Small" 
                    ForeColor="White" Orientation="Horizontal" StaticSubMenuIndent="10px">
                    <DynamicHoverStyle BackColor="#7C6F57" ForeColor="White" />
                    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <DynamicMenuStyle BackColor="#F7F6F3" />
                    <DynamicSelectedStyle BackColor="#5D7B9D" />
                    <Items>
                        <asp:MenuItem Text="  Consumo de Repuestos  " Value="Consumo de Repuestos" 
                            NavigateUrl="~/Consumo.aspx">
                        </asp:MenuItem>
                        <asp:MenuItem Text="  Reparaciones por Empresa  " 
                            Value="Reparaciones por Empresa" NavigateUrl="~/Estadistica.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="  Historial de Reparaciones  " 
                            Value="Historial de Reparaciones" NavigateUrl="~/Historia.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="  Simular Pedido Repuestos" 
                            Value="   Simular Pedido Repuestos"></asp:MenuItem>
                    </Items>
                    <StaticHoverStyle BackColor="#7C6F57" ForeColor="White" />
                    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <StaticSelectedStyle BackColor="#5D7B9D" />
                </asp:Menu>
            </div>
            <div class="loginDisplay">
                </div>
        </div>
    
        <br />
        <br />
    
    </div>
    <h2 style="background-color: #FFFFFF; color: #000000; font-family: Verdana; font-size: x-large; font-weight: normal; height: 1px;">
        &nbsp;</h2>
    <h2 style="background-color: #FFFFFF; color: #000000; font-family: Verdana; font-size: x-large; font-weight: bold; height: 32px;">
        SIMULAR PEDIDO DE REPUESTOS</h2>
    <p style="font-family: Verdana; font-size: small">
        (Permite determinar la cantidad de repuestos a comprar por cada modelo de 
        equipo)</p>
    <p style="background-color: #000000; height: 3px;">
        &nbsp;</p>
    <p style="font-size: large; color: #FFFFFF; background-color: #5D7B9D; font-family: Verdana;">
        &nbsp; 
        SELECCIONE EL EQUIPO::</p>
<h2>
    <asp:ListBox ID="cmbEquipos" runat="server" DataSourceID="SqlDataSource1" 
        DataTextField="Modelo" DataValueField="Modelo" Height="127px" 
        Width="141px">
    </asp:ListBox>
    </h2>
    <p style="background-color: #6D8AAA; color: #FFFFFF; font-family: Verdana; font-size: small;">
&nbsp;&nbsp;<asp:CheckBox ID="chlEquipos" runat="server" Text="Todos los Equipos" />
    </p>
    <h2>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConexionSIGT %>" 
            SelectCommand="SELECT [Modelo] FROM [SIGT].[dbo].[Equipos]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConexionSIGT %>" 
        SelectCommand="SELECT RazonSocial, IDCliente, IDEstado FROM Clientes WHERE IDEstado='1' ORDER BY RazonSocial ASC">
    </asp:SqlDataSource>
    </h2>
<h2><asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
        <asp:Button ID="btnBorrar" runat="server" Text="Limpiar" />
    &nbsp;&nbsp;&nbsp;&nbsp;
    </h2>
    <p style="font-size: large; color: #FFFFFF; background-color: #5D7B9D; font-family: Verdana;">
        <asp:Label ID="txtTitulo" runat="server"></asp:Label>
</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" 
            GridLines="None" HorizontalAlign="Center" Width="532px" 
            Font-Names="Verdana" Font-Size="Small">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="NroParte" HeaderText="Número de Parte" 
                    SortExpression="NroParte">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" ReadOnly="True" 
                    SortExpression="Cantidad">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" 
                    SortExpression="Descripcion">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConexionSIGT %>" 
            SelectCommand="SELECT COUNT(RU.IDRepuestoUtilizado) as Cantidad, RU.NroParte, RU.Descripcion FROM Equipos as E, RepuestosUtilizados as RU, Clientes as C, OrdenServicio as OS, Reparaciones as R WHERE E.IDEquipo=R.IDEquipo AND E.Modelo like '' AND RU.Orden=OS.Numero AND OS.IDCliente=C.IDCliente AND R.Serie=RU.Serie AND RU.Fecha like '' AND (RU.IDEstado=7 OR RU.IDEstado=6 OR RU.IDEstado=2 OR RU.IDEstado=1) GROUP BY RU.NroParte, RU.Descripcion">
        </asp:SqlDataSource>
    </p>
    <p style="background-color: #000000; height: 3px;">
        &nbsp;</p>
    <p style="font-family: Verdana; font-size: small">
        Consultas Web 1.3<b>&nbsp; </b><span class="st" style="color: #000000">©2013&nbsp;(<em>S.E.U.O.</em>)&nbsp; </span>&nbsp;<a 
            href="mailto:mdellanave@ecadat.com.ar">Sugerencias.</a></p>
        <p style="font-family: Verdana; font-size: small">
        Si desea conocer nuestros productos <a href="http://www.ecadat.com.ar">Visite 
        nuestra pagina Web.</a></p>
    
    </form>
</body>
</html>
