
Partial Class Consumo
    Inherits System.Web.UI.Page

    Protected Sub btnBuscar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBuscar.Click
        Chart1.Visible = True

        If chkClientes.Checked = True Then
            txtEmpresa.Text = "INFORME CORRESPONDIENTE A TODOS LOS CLIENTES"
            If chlEquipos.Checked = True Then
                SqlDataSource3.SelectCommand = "SELECT TOP 10 COUNT(RU.IDRepuestoUtilizado) as Cantidad, RU.NroParte, RU.Descripcion FROM Equipos as E, RepuestosUtilizados as RU, Clientes as C, OrdenServicio as OS, Reparaciones as R WHERE E.IDEquipo=R.IDEquipo AND RU.Orden=OS.Numero AND OS.IDCliente=C.IDCliente AND R.Serie=RU.Serie AND RU.Fecha like '%" & cmbFecha.SelectedItem.Text & "%' AND (RU.IDEstado=7 OR RU.IDEstado=6 OR RU.IDEstado=2 OR RU.IDEstado=1) GROUP BY RU.NroParte, RU.Descripcion ORDER BY Cantidad DESC "
                SqlDataSource4.SelectCommand = "SELECT COUNT(RU.IDRepuestoUtilizado) as Cantidad, RU.NroParte, RU.Descripcion FROM Equipos as E, RepuestosUtilizados as RU, Clientes as C, OrdenServicio as OS, Reparaciones as R WHERE E.IDEquipo=R.IDEquipo AND RU.Orden=OS.Numero AND OS.IDCliente=C.IDCliente AND R.Serie=RU.Serie AND RU.Fecha like '%" & cmbFecha.SelectedItem.Text & "%' AND (RU.IDEstado=7 OR RU.IDEstado=6 OR RU.IDEstado=2 OR RU.IDEstado=1) GROUP BY RU.NroParte, RU.Descripcion ORDER BY Cantidad DESC "

                txtTitulo.Text = "CONSUMO DE REPUESTOS EN EL AÑO " & cmbFecha.SelectedItem.Text & " PARA TODOS LOS MODELOS DE EQUIPOS"
            Else
                Try
                    SqlDataSource3.SelectCommand = "SELECT TOP 10 COUNT(RU.IDRepuestoUtilizado) as Cantidad, RU.NroParte, RU.Descripcion FROM Equipos as E, RepuestosUtilizados as RU, Clientes as C, OrdenServicio as OS, Reparaciones as R WHERE E.IDEquipo=R.IDEquipo AND E.Modelo like '%" & cmbEquipos.SelectedItem.Text & "%' AND RU.Orden=OS.Numero AND OS.IDCliente=C.IDCliente AND R.Serie=RU.Serie AND RU.Fecha like '%" & cmbFecha.SelectedItem.Text & "%' AND (RU.IDEstado=7 OR RU.IDEstado=6 OR RU.IDEstado=2 OR RU.IDEstado=1) GROUP BY RU.NroParte, RU.Descripcion ORDER BY Cantidad DESC "
                    SqlDataSource4.SelectCommand = "SELECT COUNT(RU.IDRepuestoUtilizado) as Cantidad, RU.NroParte, RU.Descripcion FROM Equipos as E, RepuestosUtilizados as RU, Clientes as C, OrdenServicio as OS, Reparaciones as R WHERE E.IDEquipo=R.IDEquipo AND E.Modelo like '%" & cmbEquipos.SelectedItem.Text & "%' AND RU.Orden=OS.Numero AND OS.IDCliente=C.IDCliente AND R.Serie=RU.Serie AND RU.Fecha like '%" & cmbFecha.SelectedItem.Text & "%' AND (RU.IDEstado=7 OR RU.IDEstado=6 OR RU.IDEstado=2 OR RU.IDEstado=1) GROUP BY RU.NroParte, RU.Descripcion ORDER BY Cantidad DESC "

                    txtTitulo.Text = "CONSUMO DE REPUESTOS EN EL AÑO " & cmbFecha.SelectedItem.Text & " PARA EL MODELO DE EQUIPO " & cmbEquipos.SelectedItem.Text & ""
                Catch ex As Exception
                    Chart1.Visible = False
                End Try
            End If
        Else
            Try
                txtEmpresa.Text = "INFORME CORRESPONDIENTE A LA EMPRESA : " & cmbClientes.SelectedItem.Text

                If chlEquipos.Checked = True Then
                    SqlDataSource3.SelectCommand = "SELECT TOP 10 COUNT(RU.IDRepuestoUtilizado) as Cantidad, RU.NroParte, RU.Descripcion FROM Equipos as E, RepuestosUtilizados as RU, Clientes as C, OrdenServicio as OS, Reparaciones as R WHERE E.IDEquipo=R.IDEquipo AND RU.Orden=OS.Numero AND OS.IDCliente=C.IDCliente AND R.Serie=RU.Serie AND RU.Fecha like '%" & cmbFecha.SelectedItem.Text & "%' AND C.RazonSocial like '%" & cmbClientes.SelectedItem.Text & "%' AND (RU.IDEstado=7 OR RU.IDEstado=6 OR RU.IDEstado=2 OR RU.IDEstado=1) GROUP BY RU.NroParte, RU.Descripcion ORDER BY Cantidad DESC "
                    SqlDataSource4.SelectCommand = "SELECT COUNT(RU.IDRepuestoUtilizado) as Cantidad, RU.NroParte, RU.Descripcion FROM Equipos as E, RepuestosUtilizados as RU, Clientes as C, OrdenServicio as OS, Reparaciones as R WHERE E.IDEquipo=R.IDEquipo AND RU.Orden=OS.Numero AND OS.IDCliente=C.IDCliente AND R.Serie=RU.Serie AND RU.Fecha like '%" & cmbFecha.SelectedItem.Text & "%' AND C.RazonSocial like '%" & cmbClientes.SelectedItem.Text & "%' AND (RU.IDEstado=7 OR RU.IDEstado=6 OR RU.IDEstado=2 OR RU.IDEstado=1) GROUP BY RU.NroParte, RU.Descripcion ORDER BY Cantidad DESC "

                    txtTitulo.Text = "CONSUMO DE REPUESTOS EN EL AÑO " & cmbFecha.SelectedItem.Text & " PARA TODOS LOS MODELOS DE EQUIPOS"
                Else
                    Try
                        SqlDataSource3.SelectCommand = "SELECT TOP 10 COUNT(RU.IDRepuestoUtilizado) as Cantidad, RU.NroParte, RU.Descripcion FROM Equipos as E, RepuestosUtilizados as RU, Clientes as C, OrdenServicio as OS, Reparaciones as R WHERE E.IDEquipo=R.IDEquipo AND E.Modelo like '%" & cmbEquipos.SelectedItem.Text & "%' AND RU.Orden=OS.Numero AND OS.IDCliente=C.IDCliente AND R.Serie=RU.Serie AND RU.Fecha like '%" & cmbFecha.SelectedItem.Text & "%' AND C.RazonSocial like '%" & cmbClientes.SelectedItem.Text & "%' AND (RU.IDEstado=8) GROUP BY RU.NroParte, RU.Descripcion ORDER BY Cantidad DESC "
                        SqlDataSource4.SelectCommand = "SELECT COUNT(RU.IDRepuestoUtilizado) as Cantidad, RU.NroParte, RU.Descripcion FROM Equipos as E, RepuestosUtilizados as RU, Clientes as C, OrdenServicio as OS, Reparaciones as R WHERE E.IDEquipo=R.IDEquipo AND E.Modelo like '%" & cmbEquipos.SelectedItem.Text & "%' AND RU.Orden=OS.Numero AND OS.IDCliente=C.IDCliente AND R.Serie=RU.Serie AND RU.Fecha like '%" & cmbFecha.SelectedItem.Text & "%' AND C.RazonSocial like '%" & cmbClientes.SelectedItem.Text & "%' AND  (RU.IDEstado=8) GROUP BY RU.NroParte, RU.Descripcion ORDER BY Cantidad DESC "

                        txtTitulo.Text = "CONSUMO DE REPUESTOS EN EL AÑO " & cmbFecha.SelectedItem.Text & " PARA EL MODELO DE EQUIPO " & cmbEquipos.SelectedItem.Text & ""
                    Catch ex As Exception
                        Chart1.Visible = False
                    End Try
                End If

            Catch ex As Exception

            End Try
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.Chart1.Visible = False
    End Sub

    Protected Sub btnBorrar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBorrar.Click
        SqlDataSource3.SelectCommand = Nothing
        SqlDataSource4.SelectCommand = Nothing
        txtEmpresa.Text = ""
        txtTitulo.Text = ""
    End Sub
End Class
