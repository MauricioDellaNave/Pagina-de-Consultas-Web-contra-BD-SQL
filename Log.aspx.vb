
Partial Class Log
    Inherits System.Web.UI.Page

    Dim mNegocio As New Negocio

    Protected Sub LoginButton_Click1(ByVal sender As Object, ByVal e As System.EventArgs)

        If mNegocio.ComprobarConexion Then
            'Si la conexion es exitosa

            Dim Usuario As String
            Usuario = Login1.UserName.Trim("'")
            Login1.UserName = Usuario

            Dim Orden As String
            Orden = Login1.Password

            If IsNumeric(Orden) Then

                If Negocio.VerificarLogin(Login1.UserName, Login1.Password) = True Then
                    Dim mNegocio As New Negocio(Login1.UserName)
                    Session.Add("cliente", Login1.UserName)
                    'Response.Redirect("http://190.210.250.206/reparaciones.aspx")
                    Server.Transfer("reparaciones.aspx")
                Else
                    Server.Transfer("Log.aspx")
                    Login1.UserName = ""
                    Login1.Password.Remove(5)
                End If

            Else
                Server.Transfer("Log.aspx")
                Login1.UserName = ""
                Login1.Password.Remove(5)
            End If

        Else
            'Si no hay conexion con el DHCP
            Server.Transfer("default.aspx")

        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Password_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub UserName_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
End Class
