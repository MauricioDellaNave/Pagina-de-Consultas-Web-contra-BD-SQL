<%@ Page Title="Página principal" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Reparaciones.aspx.vb" Inherits="_Reparaciones" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script language="javascript" type="text/javascript">
// <![CDATA[

        function Radio1_onclick() {

        }

// ]]>
    </script>
    <style type="text/css">

EM {
	FONT-STYLE: normal; FONT-WEIGHT: bold
}
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2 style="background-color: #FFFFFF; color: #000000; height: 18px;">
        ESTADO DE EQUIPOS EN SERVICIO TECNICO&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Descargar listado" />
    </h2>
    <p>
        (Permite saber el 
        estado de los equipos en reparación)</p>
    <p style="background-color: #6D8AAA; font-size: large; color: #FFFFFF;">
        <asp:Label ID="txtEstEqu" runat="server"></asp:Label>
</p>
<p>
        <asp:GridView ID="dgClientes" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="IDReparacion" DataSourceID="SqlDataSource1" CellPadding="3" GridLines="Vertical" 
            Width="911px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" 
            BorderWidth="1px" Font-Size="8pt" ForeColor="Black">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="Numero" HeaderText="Orden" 
                    SortExpression="Numero" />
                <asp:BoundField DataField="Serie" HeaderText="Serie" SortExpression="Serie" />
                <asp:BoundField DataField="Modelo" HeaderText="Modelo" 
                    SortExpression="Modelo" />
                <asp:BoundField DataField="Descripcion" HeaderText="Estado" 
                    SortExpression="Descripcion" Visible="False" />
                <asp:BoundField DataField="FechaIngreso" HeaderText="Ingreso" 
                    SortExpression="FechaIngreso" />
                <asp:BoundField DataField="Falla" HeaderText="Falla Declarada" 
                    SortExpression="Falla" Visible="False" />
                <asp:BoundField DataField="Detalle" HeaderText="Estado" 
                    SortExpression="Detalle">
                <ItemStyle Width="150px" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Tarea" HeaderText="Tarea Realizada" 
                    SortExpression="Tarea" />
                <asp:ButtonField ButtonType="Button" Text="Ver Datos" Visible="False" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConexionSIGT %>" 
            SelectCommand="SELECT RE.IDReparacion, OS.Numero, RE.Serie, E.Detalle, EQ.Modelo, RE.Tarea, OS.FechaIngreso, RE.Observaciones, RE.FechaReparacion, RE.ModeloCN, RE.Sector, RE.Dolar, RE.ManoObra, RE.Repuestos, C.RazonSocial FROM Reparaciones as RE, OrdenServicio as OS, Estados as E, Equipos as EQ, Clientes as C WHERE RE.IDOrden=OS.IDOrden AND RE.IDEstado=E.IDEstado AND RE.IDEquipo=EQ.IDEquipo AND OS.IDCliente=C.IDCliente AND E.Estado &lt;&gt; 'S' AND E.Estado &lt;&gt; 'U' AND C.IDCliente='0' GROUP BY RE.IDReparacion, OS.Numero, RE.Serie, E.Detalle, EQ.Modelo, RE.Tarea, OS.FechaIngreso, RE.Observaciones, RE.FechaReparacion, RE.ModeloCN, RE.Sector, RE.Dolar, RE.ManoObra, RE.Repuestos, C.RazonSocial">
        </asp:SqlDataSource>
    </p>
    <p>
        Consultas Web 1.3<b>&nbsp; </b><span class="st" style="color: #000000">©2013&nbsp;(<em>S.E.U.O.</em>)&nbsp; </span>&nbsp;<a 
            href="mailto:mdellanave@ecadat.com.ar">Sugerencias.</a>&nbsp;&nbsp;&nbsp;
        <asp:LoginName ID="login" runat="server" Visible="False" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        Si desea conocer nuestros productos <a href="http://www.ecadat.com.ar">Visite 
        nuestra pagina Web.</a></p>
</asp:Content>
