
Partial Class About
    Inherits System.Web.UI.Page

    Protected Sub btnBuscar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBuscar.Click
        Dim mregexValidacion As New System.Text.RegularExpressions.Regex("^[a-zA-Z0-9\-\.]+$")
        Dim text As System.Text.RegularExpressions.MatchCollection
        text = mregexValidacion.Matches(txtSerie.Text)


        If text.Count > 0 Then
            Me.lblError.Text = ""
            SqlDataSource1.SelectCommand = "SELECT MV.CODITM, MV.NROSERIE, C2.NOMBRE, T.FECHA, D.FECHA, D.ADUANA, I.DESCRIPCION, MV.DESPACHO FROM MVSNROSERIE as MV,TRANSAC as T , CTACTES as C2, MVSITEMS as MS, DESPACHOS AS D, ITEMS as I WHERE MS.NROTRANS=MV.NROTRANS AND MV.NROSERIE like'%" & Me.txtSerie.Text & "%' AND MS.NROTRANS=T.NROTRANS AND T.CODCTACTE=C2.CODCTACTE  AND MS.CODITM=MV.CODITM AND C2.NOMBRE<>'CHACON ALFREDO ANDRES' AND MV.DESPACHO=D.DESPACHO  AND C2.CUEPREFI='C' AND MV.CODITM=I.CODITM GROUP BY MV.CODITM, MV.NROSERIE, C2.NOMBRE, T.FECHA, D.FECHA, D.ADUANA, MV.DESPACHO, I.DESCRIPCION"

        Else
            Me.lblError.Text = "(El Numero de Serie ingresado posee caracteres invalidos)"
            Me.txtSerie.Text = ""
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtSerie.Focus()
    End Sub
End Class
