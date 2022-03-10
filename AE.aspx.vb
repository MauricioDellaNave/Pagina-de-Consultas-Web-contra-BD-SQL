
Partial Class _AE
    Inherits System.Web.UI.Page

    Protected Sub btnVer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBuscarV.Click
        SqlDataSource2.SelectCommand = "SELECT MS.CODITM, I.DESCRIPCION, MS.CANTIDAD, MS.PRECIO, MS.IMPORTE, MS.FECHAENT FROM MVSITEMS as MS, ITEMS as I, TRANSAC as T, TRANSACCONTROL as TC WHERE I.CODITM=MS.CODITM AND MS.NROTRANS=T.NROTRANS AND T.NROTRANS=TC.NROTRANS  AND T.CODCMP=TC.CODCMP AND TC.CODCMP='OC' AND T.NUMERO='" & lstAEVentas.Text & "' GROUP BY MS.CODITM, MS.CANTIDAD, MS.PRECIO, MS.IMPORTE, MS.FECHAENT, I.DESCRIPCION ORDER BY MS.FECHAENT ASC"
        lblTitulo.Text = "AE Número " & lstAEVentas.Text & " correspondiente a VENTAS"
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SqlDataSource1.SelectCommand = "SELECT NUMERO FROM TRANSAC WHERE CODCMP='OC' AND USERNAME='gcanepa' GROUP BY NUMERO ORDER BY NUMERO DESC"
    End Sub

    Protected Sub btnBuscarR_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBuscarR.Click
        SqlDataSource2.SelectCommand = "SELECT MS.CODITM, I.DESCRIPCION, MS.CANTIDAD, MS.PRECIO, MS.IMPORTE, MS.FECHAENT FROM MVSITEMS as MS, ITEMS as I, TRANSAC as T, TRANSACCONTROL as TC WHERE I.CODITM=MS.CODITM AND MS.NROTRANS=T.NROTRANS AND T.NROTRANS=TC.NROTRANS  AND T.CODCMP=TC.CODCMP AND TC.CODCMP='OC' AND T.NUMERO='" & lstAEReparaciones.Text & "' GROUP BY MS.CODITM, MS.CANTIDAD, MS.PRECIO, MS.IMPORTE, MS.FECHAENT, I.DESCRIPCION ORDER BY MS.FECHAENT ASC"
        lblTitulo.Text = "AE Número " & lstAEReparaciones.Text & " correspondiente a REPARACIONES"
    End Sub

    Protected Sub btnBorrarV_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBorrarV.Click
        SqlDataSource2.SelectCommand = Nothing
        lblTitulo.Text = ""
    End Sub

    Protected Sub btnBorrarR_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBorrarR.Click
        SqlDataSource2.SelectCommand = Nothing
        lblTitulo.Text = ""
    End Sub
End Class
