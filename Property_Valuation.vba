Imports System.IO
Imports System.Text

Public Class FormPTAM
    Private Sub btnGerarLaudo_Click(sender As Object, e As EventArgs) Handles btnGerarLaudo.Click
        Dim laudo As New StringBuilder()
        laudo.AppendLine("LAUDO DE AVALIAÇÃO IMOBILIÁRIA")
        laudo.AppendLine("----------------------------------------")
        laudo.AppendLine("Nome do Avaliador: " & txtAvaliador.Text)
        laudo.AppendLine("Endereço do Imóvel: " & txtEndereco.Text)
        laudo.AppendLine("Tipo do Imóvel: " & cmbTipoImovel.Text)
        laudo.AppendLine("Área Total: " & txtArea.Text & " m²")
        laudo.AppendLine("Valor Estimado: R$ " & txtValorEstimado.Text)
        laudo.AppendLine("Observações: " & txtObservacoes.Text)
        laudo.AppendLine("----------------------------------------")
        laudo.AppendLine("Data da Avaliação: " & DateTime.Now.ToString("dd/MM/yyyy"))
        
        txtLaudo.Text = laudo.ToString()
    End Sub

    Private Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        Dim saveFile As New SaveFileDialog()
        saveFile.Filter = "Arquivo de Texto|*.txt"
        saveFile.Title = "Salvar Laudo"

        If saveFile.ShowDialog() = DialogResult.OK Then
            File.WriteAllText(saveFile.FileName, txtLaudo.Text, Encoding.UTF8)
        End If
    End Sub

    Private Sub btnCarregar_Click(sender As Object, e As EventArgs) Handles btnCarregar.Click
        Dim openFile As New OpenFileDialog()
        openFile.Filter = "Arquivo de Texto|*.txt"
        openFile.Title = "Carregar Laudo"

        If openFile.ShowDialog() = DialogResult.OK Then
            txtLaudo.Text = File.ReadAllText(openFile.FileName, Encoding.UTF8)
        End If
    End Sub
End Class
