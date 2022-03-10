<%@ Page Title="Acerca de nosotros" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="About.aspx.vb" Inherits="About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">

EM {
	FONT-STYLE: normal; FONT-WEIGHT: bold
}
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        CONSULTAR EQUIPO</h2>
    <p>
        (Permite saber si el equipo fue vendido por Ecadat y a que Cliente)</p>
    <p style="background-color: #000000; height: 3px;">
        &nbsp;</p>
    <p>
        Buscar&nbsp; 
        por Numero de Serie:&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
<h2>&nbsp;<asp:TextBox ID="txtSerie" runat="server" Width="201px"></asp:TextBox>
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
        <asp:Button ID="btnBorrar" runat="server" Text="Borrar" />
    </h2>
    <p>
        <asp:Label ID="lblError" runat="server" ForeColor="#CC0000"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="dgSerie" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" Width="909px" AllowSorting="True" 
            CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="CODITM" HeaderText="Código" 
                    SortExpression="CODITM" />
                <asp:BoundField DataField="NROSERIE" HeaderText="Serie" 
                    SortExpression="NROSERIE" />
                <asp:BoundField DataField="NOMBRE" HeaderText="Cliente" 
                    SortExpression="NOMBRE" />
                <asp:BoundField DataField="FECHA" DataFormatString="{0:d}" 
                    HeaderText="Fecha Venta" SortExpression="FECHA" />
                <asp:BoundField DataField="ADUANA" HeaderText="Aduana" 
                    SortExpression="ADUANA" />
                <asp:BoundField DataField="DESCRIPCION" HeaderText="Descripción" 
                    SortExpression="DESCRIPCION" />
                <asp:BoundField DataField="DESPACHO" HeaderText="Despacho" 
                    SortExpression="DESPACHO" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT MV.CODITM, MV.NROSERIE, C2.NOMBRE, T.FECHA, D.FECHA, D.ADUANA, I.DESCRIPCION, MV.DESPACHO FROM MVSNROSERIE as MV,TRANSAC as T , CTACTES as C2, MVSITEMS as MS, DESPACHOS AS D, ITEMS as I WHERE MS.NROTRANS=MV.NROTRANS AND MV.NROSERIE='&quot;0 &quot;' AND MS.NROTRANS=T.NROTRANS AND T.CODCTACTE=C2.CODCTACTE  AND MS.CODITM=MV.CODITM AND C2.NOMBRE&lt;&gt;'CHACON ALFREDO ANDRES' AND MV.DESPACHO=D.DESPACHO  AND C2.CUEPREFI='C' AND MV.CODITM=I.CODITM GROUP BY MV.CODITM, MV.NROSERIE, C2.NOMBRE, T.FECHA, D.FECHA, D.ADUANA, MV.DESPACHO, I.DESCRIPCION">
        </asp:SqlDataSource>
    </p>
    <p style="background-color: #000000; height: 3px;">
        &nbsp;</p>
    <p>
        Consultas Web 1.3<b>&nbsp; </b><span class="st">©2013 &nbsp;&nbsp;<span 
            class="st" style="color: #000000">(<em>S.E.U.O.</em>)</span> </span>&nbsp;<a 
            href="mailto:mdellanave@ecadat.com.ar">Sugerencias.</a></p>
    <p>
        Si desea conocer nuestros productos <a href="http://www.ecadat.com.ar">Visite 
        nuestra pagina Web.</a></p>
</asp:Content>