
Partial Class Estadistica
    Inherits System.Web.UI.Page

#Region "Declaraciones"
    Dim mFacturado As Double
    Dim mCantidad As Integer
    Dim mCont As Integer
#End Region

    Protected Sub btnBuscar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBuscar.Click

        Chart1.Visible = True

        If chkTodos.Checked = True Then
            SqlDataSource1.SelectCommand = "SELECT SUM(R.TotalDolares) as Total,COUNT(R.IDEquipo) as Cantidad, E.Modelo FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E WHERE C.IDCliente=OS.IDCliente AND OS.IDOrden=R.IDOrden AND R.IDEquipo=E.IDEquipo AND R.FechaEgreso like '%" & cmbFecha.Text & "%' AND R.IDEstado=7 GROUP BY E.Modelo ORDER BY TOTAL DESC"
            SqlDataSource4.SelectCommand = "SELECT SUM(R.TotalDolares) as Total FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E WHERE C.IDCliente=OS.IDCliente AND OS.IDOrden=R.IDOrden AND R.IDEquipo=E.IDEquipo AND R.FechaEgreso like '%" & cmbFecha.Text & "%' AND R.IDEstado=7 "
            SqlDataSource5.SelectCommand = "SELECT COUNT(R.IDEquipo) as Cantidad FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E WHERE C.IDCliente=OS.IDCliente AND OS.IDOrden=R.IDOrden AND R.IDEquipo=E.IDEquipo AND R.FechaEgreso like '%" & cmbFecha.Text & "%' AND R.IDEstado=7 "
            SqlDataSource2.SelectCommand = "SELECT TOP 10 SUM(R.TotalDolares) as Total,COUNT(R.IDEquipo) as Cantidad, E.Modelo FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E WHERE C.IDCliente=OS.IDCliente AND OS.IDOrden=R.IDOrden AND R.IDEquipo=E.IDEquipo AND R.FechaEgreso like '%" & cmbFecha.Text & "%' AND R.IDEstado=7 GROUP BY E.Modelo ORDER BY TOTAL DESC"
        Else
            txtEmpresa.Text = cmbClientes.SelectedItem.Value
            SqlDataSource1.SelectCommand = "SELECT SUM(R.TotalDolares) as Total,COUNT(R.IDEquipo) as Cantidad, E.Modelo FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E WHERE C.IDCliente=OS.IDCliente AND OS.IDOrden=R.IDOrden AND R.IDEquipo=E.IDEquipo AND C.RazonSocial like '" & cmbClientes.SelectedItem.Value & "' AND R.FechaEgreso like '%" & cmbFecha.Text & "%' AND R.IDEstado=7 GROUP BY E.Modelo"
            SqlDataSource4.SelectCommand = "SELECT SUM(R.TotalDolares) as Total FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E WHERE C.IDCliente=OS.IDCliente AND OS.IDOrden=R.IDOrden AND R.IDEquipo=E.IDEquipo AND C.RazonSocial like '" & cmbClientes.SelectedItem.Value & "' AND R.FechaEgreso like '%" & cmbFecha.Text & "%' AND R.IDEstado=7 "
            SqlDataSource5.SelectCommand = "SELECT COUNT(R.IDEquipo) as Cantidad FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E WHERE C.IDCliente=OS.IDCliente AND OS.IDOrden=R.IDOrden AND R.IDEquipo=E.IDEquipo AND C.RazonSocial like '" & cmbClientes.SelectedItem.Value & "' AND R.FechaEgreso like '%" & cmbFecha.Text & "%' AND R.IDEstado=7 "
            SqlDataSource2.SelectCommand = "SELECT TOP 10 SUM(R.TotalDolares) as Total,COUNT(R.IDEquipo) as Cantidad, E.Modelo FROM Clientes as C, OrdenServicio as OS, Reparaciones as R, Equipos as E WHERE C.IDCliente=OS.IDCliente AND OS.IDOrden=R.IDOrden AND R.IDEquipo=E.IDEquipo AND C.RazonSocial like '" & cmbClientes.SelectedItem.Value & "' AND R.FechaEgreso like '%" & cmbFecha.Text & "%' AND R.IDEstado=7 GROUP BY E.Modelo"

        End If



        mCont = dgFacturado.Rows.Count

        Try

            For i = 0 To mCont - 1
                mFacturado = mFacturado + CDbl(dgFacturado.Rows(i).Cells(3).Text)
                mCantidad = mCantidad + dgFacturado.Rows(i).Cells(2).Text
            Next

        Catch ex As Exception

        End Try
        lblEmpresa.Text = " EMPRESA SELECCIONADA : "
        txtFacturado.Text = "TOTAL DE REPARACIONES POR MODELO DE EQUIPO EN EL AÑO " & cmbFecha.Text

        dgTotal.Visible = True
        dgTotEqu.Visible = True
    End Sub

    Protected Sub btnBorrar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBorrar.Click
        SqlDataSource1.SelectCommand = Nothing
        SqlDataSource4.SelectCommand = Nothing
        SqlDataSource5.SelectCommand = Nothing
        txtFacturado.Text = ""
    End Sub

    Protected Sub cmbClientes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbClientes.SelectedIndexChanged

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Chart1.Visible = False
        cmbClientes.Focus()
        If dgFacturado.SelectedRow Is Nothing Then
            dgTotal.Visible = False
            dgTotEqu.Visible = False
        Else
            dgTotal.Visible = True
            dgTotEqu.Visible = True
        End If
    End Sub

    Protected Sub Chart1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chart1.Load

    End Sub
End Class
