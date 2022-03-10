
Partial Class Simular
    Inherits System.Web.UI.Page

    Protected Sub btnBuscar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBuscar.Click

        If chlEquipos.Checked = True Then
            SqlDataSource4.SelectCommand = "SELECT COUNT(RU.IDRepuestoUtilizado) /4 as Cantidad, RU.NroParte, RU.Descripcion FROM Equipos as E, RepuestosUtilizados as RU, Clientes as C, OrdenServicio as OS, Reparaciones as R WHERE E.IDEquipo=R.IDEquipo AND RU.Orden=OS.Numero AND OS.IDCliente=C.IDCliente AND R.Serie=RU.Serie AND RU.Fecha like '%2013%' AND (RU.IDEstado=7 OR RU.IDEstado=6 OR RU.IDEstado=2 OR RU.IDEstado=1) GROUP BY RU.NroParte, RU.Descripcion ORDER BY Cantidad DESC "
            txtTitulo.Text = "PEDIDO DE REPUESTOS PARA TODOS LOS MODELOS DE EQUIPOS"
        Else
            Try
                SqlDataSource4.SelectCommand = "SELECT COUNT(RU.IDRepuestoUtilizado) /4 as Cantidad, RU.NroParte, RU.Descripcion FROM Equipos as E, RepuestosUtilizados as RU, Clientes as C, OrdenServicio as OS, Reparaciones as R WHERE E.IDEquipo=R.IDEquipo AND E.Modelo like '%" & cmbEquipos.SelectedItem.Text & "%' AND RU.Orden=OS.Numero AND OS.IDCliente=C.IDCliente AND R.Serie=RU.Serie AND RU.Fecha like '%2013%' AND (RU.IDEstado=7 OR RU.IDEstado=6 OR RU.IDEstado=2 OR RU.IDEstado=1) GROUP BY RU.NroParte, RU.Descripcion ORDER BY Cantidad DESC "
                txtTitulo.Text = "PEDIDO DE REPUESTOS PARA EL MODELO DE EQUIPO " & cmbEquipos.SelectedItem.Text & ""
            Catch ex As Exception

            End Try
        End If
    End Sub
End Class
