<%@ Page Title="Página principal" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Clientes.aspx.vb" Inherits="_Clientes" %>

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
    <h2 style="background-color: #FFFFFF; color: #000000">
        CLIENTES POR VENDEDOR </h2>
    <p>
        (Permite saber que Cliente tiene asignado cada Vendedor)</p>
    <p style="background-color: #000000; height: 3px;">
        &nbsp;</p>
    <p style="font-size: large; color: #FFFFFF; background-color: #5D7B9D;">
        LISTADO DE CLIENTES :&nbsp;&nbsp;</p>
<h2>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        
        SelectCommand="SELECT  NOMBRE, DOMICILIO, LOCALIDAD, TELEFONO, EMAIL, 'Canepa', FANTASIA FROM CTACTES WHERE CODVENCOM='V04'
UNION
SELECT  NOMBRE, DOMICILIO, LOCALIDAD, TELEFONO, EMAIL, 'Zinckevicius', FANTASIA FROM CTACTES WHERE CODVENCOM='V21'">
    </asp:SqlDataSource>
    </h2>
    <p style="font-size: large; color: #FFFFFF; background-color: #5D7B9D;">
        <asp:GridView ID="dgClientes" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None" Width="907px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="NOMBRE" HeaderText="Razón Social" 
                    SortExpression="NOMBRE" />
                <asp:BoundField DataField="FANTASIA" HeaderText="Nombre de Fantasía" 
                    SortExpression="FANTASIA" />
                <asp:BoundField DataField="TELEFONO" HeaderText="Teléfono" 
                    SortExpression="TELEFONO" />
                <asp:BoundField DataField="Column1" HeaderText="Vendedor" 
                    SortExpression="Column1" ReadOnly="True" />
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
    <p style="background-color: #000000; height: 3px;">
        &nbsp;</p>
    <p>
        Consultas Web 1.3<b>&nbsp; </b><span class="st">©2013&nbsp;&nbsp;<span 
            class="st" style="color: #000000">(<em>S.E.U.O.</em>)</span> </span>&nbsp;<a 
            href="mailto:mdellanave@ecadat.com.ar">Sugerencias.</a></p>
    <p>
        Si desea conocer nuestros productos <a href="http://www.ecadat.com.ar">Visite 
        nuestra pagina Web.</a></p>
</asp:Content>
