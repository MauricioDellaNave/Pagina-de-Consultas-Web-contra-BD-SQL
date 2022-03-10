<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Historia.aspx.vb" Inherits="Historia" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">



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
    font-size: 1.6em;
    padding-bottom: 0px;
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

.loginDisplay
{
    font-size: 1.1em;
    display: block;
    text-align: right;
    padding: 10px;
    color: White;
}

h2
{
    font-size: 1.5em;
    font-weight: 600;
}

    EM {
	FONT-STYLE: normal; FONT-WEIGHT: bold
}

    
        .style1
        {
            width: 970px;
            height: 100px;
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
                            Value="Simular Pedido Repuestos"></asp:MenuItem>
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
    <h2 style="color: #000000; font-family: Verdana; font-size: x-large;">
        HISTORIAL DE REPARACIONES</h2>
    <p style="font-family: Verdana; font-size: small">
        (Permite contabilizar el total de equipos reparados en Servicio Técnico por cada 
        mes y año)</p>
    <p style="background-color: #000000; height: 3px;">
        &nbsp;</p>
    <p style="background-color: #7B97B5; color: #FFFFFF; font-size: large; font-family: Verdana;">
        TOTAL DE REPARACIONES AÑO 2014&nbsp;&nbsp;
        </p>
    <p>
        &nbsp;</p>
<p>
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2" 
            Width="914px" AlternateText="Imagen no Disponible" Height="225px" 
            Palette="Bright" ViewStateContent="All">
            <Series>
                <asp:Series Name="Series1" ChartArea="ChartArea1" XValueMember="Mes" 
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConexionSIGT %>" 
            SelectCommand="SELECT 'a) ENERO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/01/2014'
AND R.IDEstado=7 
UNION
SELECT 'b) FEBRERO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/02/2014'
AND R.IDEstado=7 
UNION
SELECT 'c) MARZO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/03/2014'
AND R.IDEstado=7 
UNION
SELECT 'd) ABRIL' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/04/2014'
AND R.IDEstado=7 
UNION
SELECT 'e) MAYO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/05/2014'
AND R.IDEstado=7 
UNION
SELECT 'f) JUNIO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/06/2014'
AND R.IDEstado=7 
UNION
SELECT 'g) JULIO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/07/2014'
AND R.IDEstado=7 
UNION
SELECT 'h) AGOSTO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/08/2014'
AND R.IDEstado=7
UNION
SELECT 'i) SEPTIEMBRE' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/09/2014'
AND R.IDEstado=7 
UNION
SELECT 'j) OCTUBRE' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/10/2014'
AND R.IDEstado=7  
UNION
SELECT 'k) NOVIEMBRE' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/11/2014'
AND R.IDEstado=7 
UNION
SELECT 'l) DICIEMBRE' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/12/2014'
AND R.IDEstado=7 " ProviderName="<%$ ConnectionStrings:ConexionSIGT.ProviderName %>">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" 
            GridLines="None" HorizontalAlign="Center" Width="300px" 
            Font-Names="Verdana" Font-Size="Small">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Mes" HeaderText="Meses" 
                    SortExpression="Mes" ReadOnly="True">
                </asp:BoundField>
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad Equipos" ReadOnly="True" 
                    SortExpression="Cantidad">
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
    </p>
    <p style="background-color: #7B97B5; color: #FFFFFF; font-size: large; font-family: Verdana;">
        TOTAL DE REPARACIONES AÑO 2012
        </p>
<p>
        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource1" 
            Width="914px" AlternateText="Imagen no Disponible" Height="225px" 
            Palette="Bright" ViewStateContent="All">
            <Series>
                <asp:Series Name="Series1" ChartArea="ChartArea1" XValueMember="Mes" 
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConexionSIGT %>" SelectCommand="SELECT 'a) ENERO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/01/2012'
AND R.IDEstado=7 
UNION
SELECT 'b) FEBRERO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/02/2012'
AND R.IDEstado=7 
UNION
SELECT 'c) MARZO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/03/2012'
AND R.IDEstado=7 
UNION
SELECT 'd) ABRIL' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/04/2012'
AND R.IDEstado=7 
UNION
SELECT 'e) MAYO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/05/2012'
AND R.IDEstado=7 
UNION
SELECT 'f) JUNIO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/06/2012'
AND R.IDEstado=7 
UNION
SELECT 'g) JULIO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/07/2012'
AND R.IDEstado=7 
UNION
SELECT 'h) AGOSTO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/08/2012'
AND R.IDEstado=7
UNION
SELECT 'i) SEPTIEMBRE' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/09/2012'
AND R.IDEstado=7 
UNION
SELECT 'j) OCTUBRE' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/10/2012'
AND R.IDEstado=7  
UNION
SELECT 'k) NOVIEMBRE' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/11/2012'
AND R.IDEstado=7 
UNION
SELECT 'l) DICIEMBRE' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/12/2012'
AND R.IDEstado=7 "></asp:SqlDataSource>
    </p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None" HorizontalAlign="Center" Width="300px" 
        Font-Names="Verdana" Font-Size="Small">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Mes" HeaderText="Meses" 
                    SortExpression="Mes" ReadOnly="True">
                </asp:BoundField>
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" ReadOnly="True" 
                    SortExpression="Cantidad">
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
    <p style="background-color: #7B97B5; color: #FFFFFF; font-size: large; font-family: Verdana;">
        TOTAL DE REPARACIONES AÑO 2013&nbsp;&nbsp;
        </p>
    <p>
        <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource3" 
            Width="914px" AlternateText="Imagen no Disponible" Height="225px" 
            Palette="Bright" ViewStateContent="All">
            <Series>
                <asp:Series Name="Series1" ChartArea="ChartArea1" XValueMember="Mes" 
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConexionSIGT %>" SelectCommand="SELECT 'a) ENERO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/01/2013'
AND R.IDEstado=7 
UNION
SELECT 'b) FEBRERO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/02/2013'
AND R.IDEstado=7 
UNION
SELECT 'c) MARZO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/03/2013'
AND R.IDEstado=7 
UNION
SELECT 'd) ABRIL' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/04/2013'
AND R.IDEstado=7 
UNION
SELECT 'e) MAYO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/05/2013'
AND R.IDEstado=7 
UNION
SELECT 'f) JUNIO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/06/2013'
AND R.IDEstado=7 
UNION
SELECT 'g) JULIO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/07/2013'
AND R.IDEstado=7 
UNION
SELECT 'h) AGOSTO' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/08/2013'
AND R.IDEstado=7
UNION
SELECT 'i) SEPTIEMBRE' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/09/2013'
AND R.IDEstado=7 
UNION
SELECT 'j) OCTUBRE' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/10/2013'
AND R.IDEstado=7  
UNION
SELECT 'k) NOVIEMBRE' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/11/2013'
AND R.IDEstado=7 
UNION
SELECT 'l) DICIEMBRE' as Mes, COUNT(R.IDEquipo) as Cantidad
FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E 
WHERE C.IDCliente=OS.IDCliente 
AND OS.IDOrden=R.IDOrden 
AND R.IDEquipo=E.IDEquipo 
AND R.FechaEgreso like '%/12/2013'
AND R.IDEstado=7 
"></asp:SqlDataSource>
    </p>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" 
            GridLines="None" HorizontalAlign="Center" Width="300px" 
        Font-Names="Verdana" Font-Size="Small">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Mes" HeaderText="Meses" 
                    SortExpression="Mes" ReadOnly="True">
                </asp:BoundField>
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" ReadOnly="True" 
                    SortExpression="Cantidad">
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
    </form>
    <p style="height: 3px; background-color: #000000">
        <br />
    </p>
    <p style="font-family: Verdana; font-size: small">
        Consultas Web 1.3<b>&nbsp; </b><span class="st">©2013 (<em>S.E.U.O.</em>)&nbsp;&nbsp; </span>&nbsp;<a 
            href="mailto:mdellanave@ecadat.com.ar">Sugerencias.</a> </p>
        <p style="font-family: Verdana; font-size: small">
        Si desea conocer nuestros productos <a href="http://www.ecadat.com.ar">Visite 
        nuestra pagina Web.</a></p>
    
         <div>
    
    </div>
 </body>
</html>
