Imports System.IO

Partial Class _Reparaciones
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim mCliente As String = Session.Item("cliente")

        SqlDataSource1.SelectCommand = "SELECT RE.IDReparacion, OS.Numero, RE.Serie, E.Detalle, E.Descripcion, EQ.Modelo, RE.Falla, RE.Tarea, OS.FechaIngreso, RE.Observaciones, RE.FechaReparacion, RE.ModeloCN, RE.Sector, RE.Dolar, RE.ManoObra, RE.Repuestos, C.RazonSocial FROM Reparaciones as RE, OrdenServicio as OS, Estados as E, Equipos as EQ, Clientes as C WHERE RE.IDOrden=OS.IDOrden AND RE.IDEstado=E.IDEstado AND RE.IDEquipo=EQ.IDEquipo AND OS.IDCliente=C.IDCliente AND (E.Estado = 'E' OR  E.Estado = 'A' OR  E.Estado = 'D' OR  E.Estado = 'P' OR  E.Estado = 'V' OR  E.Estado = 'H' OR  E.Estado = 'R') AND C.RazonSocial like  '" & mCliente & "'  GROUP BY RE.IDReparacion, OS.Numero, RE.Serie, E.Detalle, E.Descripcion, EQ.Modelo, RE.Falla, RE.Tarea, OS.FechaIngreso, RE.Observaciones, RE.FechaReparacion, RE.ModeloCN, RE.Sector, RE.Dolar, RE.ManoObra, RE.Repuestos, C.RazonSocial"
        txtEstEqu.Text = "Ordenes de Reparación del Cliente " & mCliente

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click


        Dim sb As StringBuilder = New StringBuilder()
        Dim sw As StringWriter = New StringWriter(sb)
        Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
        Dim pagina As Page = New Page
        Dim form = New HtmlForm
        dgClientes.EnableViewState = False
        pagina.EnableEventValidation = False
        pagina.DesignerInitialize()
        pagina.Controls.Add(form)
        form.Controls.Add(dgClientes)
        pagina.RenderControl(htw)
        Response.Clear()
        Response.Buffer = True
        Response.ContentType = "application/vnd.ms-excel"
        Response.AddHeader("Content-Disposition", "attachment;filename=Reparaciones.xls")
        Response.Charset = "UTF-8"

        Response.ContentEncoding = Encoding.Default
        Response.Write(sb.ToString())
        Response.End()


    End Sub
End Class
