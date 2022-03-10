<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Estadistica.aspx.vb" Inherits="Estadistica" %>

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
            top: -19px;
            left: 1px;
            height: 74px;
        }

.title
{
    display: block;
    float: left;
    text-align: left;
    width: auto;
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
    font-size: 1.5em;
    color: #666666;
    font-variant: small-caps;
    text-transform: none;
    font-weight: 200;
    margin-bottom: 0px;
}

h1
{
    font-size: 1.6em;
    padding-bottom: 0px;
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

EM {
	FONT-STYLE: normal; FONT-WEIGHT: bold
}

    
a:link
{
    color: #034af3;
}

h2
{
    font-size: 1.5em;
    font-weight: 600;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 154px">
    
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
    <h2 style="color: #000000; font-family: Verdana; font-size: x-large; height: 1px;">
        &nbsp;</h2>
    <h2 style="color: #000000; font-family: Verdana; font-size: x-large; height: 31px;">
        REPARACIONES POR EMPRESA</h2>
    <p style="font-family: Verdana; font-size: small">
        (Permite determinar la cantidad de equipos reparados por cada Cliente y el monto 
        de la reparación)</p>
    <p style="background-color: #000000; height: 3px;">
        &nbsp;</p>
    <p style="background-color: #7B97B5; color: #FFFFFF; font-size: large; font-family: Verdana;">
        <asp:Label ID="lblEmpresa" runat="server" Text="SELECCIONE LA EMPRESA:"></asp:Label>
        &nbsp;&nbsp;
        <asp:Label ID="txtEmpresa" runat="server" Font-Size="X-Large"></asp:Label>
        </p>
    <p>
        <asp:ListBox ID="cmbClientes" runat="server" 
        DataSourceID="SqlDataSource3" DataTextField="RazonSocial" 
        DataValueField="RazonSocial" Height="144px" Width="276px"></asp:ListBox>
        </p>
<p style="background-color: #7B97B5; color: #FFFFFF; font-family: Verdana;">
        <asp:CheckBox ID="chkTodos" runat="server" Text="Todos los Clientes" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Filtrar por Año
        <asp:DropDownList ID="cmbFecha" runat="server">
            <asp:ListItem>2011</asp:ListItem>
            <asp:ListItem>2012</asp:ListItem>
            <asp:ListItem>2013</asp:ListItem>
            <asp:ListItem>2014</asp:ListItem>
        </asp:DropDownList>
</p>
    <p>
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
        <asp:Button ID="btnBorrar" runat="server" Text="Limpiar" />
        </p>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConexionSIGT %>" 
        
        
        SelectCommand="SELECT RazonSocial, IDCliente, IDEstado FROM Clientes WHERE (IDEstado = '1') ORDER BY RazonSocial">
    </asp:SqlDataSource>
    <p style="background-color: #000000; height: 3px;">
        &nbsp;</p>
    <p style="background-color: #6D8AAA; color: #FFFFFF; font-size: large; font-family: Verdana;">
        <asp:Label ID="txtFacturado" runat="server" Font-Bold="False" Font-Size="Large"></asp:Label>
        </p>
        <p style="font-family: Verdana; font-size: small">
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2" 
            Width="914px" AlternateText="Imagen no Disponible" Height="225px" 
            Palette="Bright" ViewStateContent="All">
            <Series>
                <asp:Series Name="Series1" ChartArea="ChartArea1" XValueMember="Modelo" 
                    YValueMembers="Cantidad">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1" BackColor="NavajoWhite">
                    <AxisY Title="Cantidad de Equipos">
                    </AxisY>
                    <AxisX Title="Modelos de Equipos">
                    </AxisX>
                    <Area3DStyle Enable3D="True" LightStyle="Realistic" />
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
    </p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConexionSIGT %>" 
            SelectCommand="SELECT TOP 10 SUM(R.TotalDolares) AS Total,COUNT(R.IDEquipo) as Cantidad, E.Modelo FROM Clientes AS C INNER JOIN OrdenServicio AS OS ON C.IDCliente = OS.IDCliente INNER JOIN Reparaciones AS R ON OS.IDOrden = R.IDOrden INNER JOIN Equipos AS E ON R.IDEquipo = E.IDEquipo WHERE (C.RazonSocial LIKE '') AND (R.FechaEgreso LIKE '') AND (R.IDEstado = 7) GROUP BY E.Modelo">
        </asp:SqlDataSource>
        <asp:GridView ID="dgFacturado" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None" Width="436px" HorizontalAlign="Center" 
        Font-Names="Verdana" Font-Size="Small">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Modelo" HeaderText="Modelo del Equipo" 
                    SortExpression="Modelo">
                </asp:BoundField>
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad de Reparados" 
                    ReadOnly="True" SortExpression="Cantidad">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Total" HeaderText="Total Facturado" 
                    SortExpression="Total" ReadOnly="True">
                <ItemStyle HorizontalAlign="Right" />
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
    <p>
        <asp:GridView ID="dgTotal" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" 
            GridLines="None" Width="440px" HorizontalAlign="Center" 
            Font-Names="Verdana" Font-Size="Small">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Total" HeaderText="Total  (U$S)" ReadOnly="True" 
                    SortExpression="Total">
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
            ConnectionString="<%$ ConnectionStrings:ConexionSIGT %>" SelectCommand="SELECT SUM(R.TotalDolares) as Total FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E WHERE C.IDCliente=OS.IDCliente AND OS.IDOrden=R.IDOrden AND R.IDEquipo=E.IDEquipo AND R.FechaEgreso like '' AND R.IDEstado=7 
  "></asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="dgTotEqu" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource5" ForeColor="#333333" 
            GridLines="None" Width="436px" HorizontalAlign="Center" 
            Font-Names="Verdana" Font-Size="Small">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Cantidad" HeaderText="Total de Equipos" 
                    ReadOnly="True" SortExpression="Cantidad">
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
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConexionSIGT %>" SelectCommand="SELECT COUNT(R.IDEquipo) as Cantidad FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E WHERE C.IDCliente=OS.IDCliente AND OS.IDOrden=R.IDOrden AND R.IDEquipo=E.IDEquipo AND R.FechaEgreso like '' AND R.IDEstado=7 
    "></asp:SqlDataSource>
    </p>
<p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConexionSIGT %>" 
            
            
            SelectCommand="SELECT TOP 10 SUM(R.TotalDolares) AS Total,COUNT(R.IDEquipo) as Cantidad, E.Modelo FROM Clientes AS C INNER JOIN OrdenServicio AS OS ON C.IDCliente = OS.IDCliente INNER JOIN Reparaciones AS R ON OS.IDOrden = R.IDOrden INNER JOIN Equipos AS E ON R.IDEquipo = E.IDEquipo WHERE (C.RazonSocial LIKE '') AND (R.FechaEgreso LIKE '') AND (R.IDEstado = 7) GROUP BY E.Modelo">
        </asp:SqlDataSource>
    </p>
    </form>
    <p style="background-color: #000000; height: 3px;">
        &nbsp;</p>
    <p style="font-family: Verdana; font-size: small">
        Consultas Web 1.3<b>&nbsp; </b><span class="st">©2013 (<em>S.E.U.O.</em>)&nbsp;&nbsp; </span>&nbsp;<a 
            href="mailto:mdellanave@ecadat.com.ar">Sugerencias.</a> </p>
        <p style="font-family: Verdana; font-size: small">
        Si desea conocer nuestros productos <a href="http://www.ecadat.com.ar">Visite 
        nuestra pagina Web.</a></p>
    
    </body>
</html>
