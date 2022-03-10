<%@ Page Title="Página principal" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="AE.aspx.vb" Inherits="_AE" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">

EM {
	FONT-STYLE: normal; FONT-WEIGHT: bold
}
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        CONSULTAR ORDEN DE COMPRA</h2>
    <p>
        (Permite 
        visualizar los items que componen la Orden de Compra)</p>
    <p style="background-color: #000000; height: 3px;">
        &nbsp;</p>
    <p style="background-color: #6D8AAA; color: #FFFFFF; font-size: large;">
        &nbsp;&nbsp;&nbsp;&nbsp; ORDEN DE COMPRA VENTAS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        ORDEN DE COMPRA REPARACIONES</p>
<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:ListBox ID="lstAEVentas" runat="server" DataSourceID="SqlDataSource1" 
        DataTextField="NUMERO" DataValueField="NUMERO" Font-Size="Medium" Width="115px">
    </asp:ListBox>
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnBuscarV" runat="server" Text="Buscar" />
&nbsp;<asp:Button ID="btnBorrarV" runat="server" Text="Limpiar" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:ListBox ID="lstAEReparaciones" runat="server" 
        DataSourceID="SqlDataSource3" DataTextField="NUMERO" DataValueField="NUMERO" 
        Font-Size="Medium" Width="115px"></asp:ListBox>
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnBuscarR" runat="server" Text="Buscar" Width="61px" />
&nbsp;<asp:Button ID="btnBorrarR" runat="server" Text="Limpiar" />
    &nbsp;&nbsp;&nbsp;
    </h2>
<p>&nbsp;</p>
    <p style="background-color: #6D8AAA; color: #FFFFFF">
        <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
    </p>
<p>
        <asp:GridView ID="dgItems" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource2" Width="914px" AllowSorting="True" 
            CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="CODITM" HeaderText="Item" SortExpression="CODITM" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DESCRIPCION" HeaderText="Descripción" 
                    SortExpression="DESCRIPCION" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CANTIDAD" DataFormatString="{0:0}" 
                    HeaderText="Cantidad" SortExpression="CANTIDAD" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PRECIO" DataFormatString="{0:f2}" 
                    HeaderText="Precio Unidad" SortExpression="PRECIO" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPORTE" DataFormatString="{0:f2}" HeaderText="Total" 
                    SortExpression="IMPORTE" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FECHAENT" DataFormatString="{0:d}" 
                    HeaderText="Fecha" SortExpression="FECHAENT" >
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT MS.CODITM, I.DESCRIPCION, MS.CANTIDAD, MS.PRECIO, MS.IMPORTE, MS.FECHAENT FROM MVSITEMS as MS, ITEMS as I, TRANSAC as T, TRANSACCONTROL as TC WHERE I.CODITM=MS.CODITM AND MS.NROTRANS=T.NROTRANS AND T.NROTRANS=TC.NROTRANS  AND T.CODCMP=TC.CODCMP AND TC.CODCMP='OC' AND T.NUMERO='0' GROUP BY MS.CODITM, MS.CANTIDAD, MS.PRECIO, MS.IMPORTE, MS.FECHAENT, I.DESCRIPCION ORDER BY MS.FECHAENT ASC">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            
            
            SelectCommand="SELECT NUMERO FROM TRANSAC WHERE CODCMP='OC' GROUP BY NUMERO ORDER BY NUMERO DESC">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT NUMERO FROM TRANSAC WHERE CODCMP='OC' AND USERNAME='dzeitounlian' GROUP BY NUMERO ORDER BY NUMERO DESC
    "></asp:SqlDataSource>
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
