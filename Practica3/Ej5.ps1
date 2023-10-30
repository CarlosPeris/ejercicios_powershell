[string]$elem = Read-Host "Dame un fichero o carpeta y te diré si existe o no"

If (Test-Path -Path $elem) {
        Write-Host "El fichero o carpeta existe"
}
Else {
        Write-Host "El fichero o carpeta no existe"
}
