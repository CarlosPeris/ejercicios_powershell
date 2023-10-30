[string]$elem = Read-Host "Dame el directorio y te diré si existe o no y mostraré su contenido"

If (Test-Path $elem -PathType container) {
        Write-Host "El directorio existe"
        Get-ChildItem -Path $elem -Recurse
}
Else {
        Write-Host "El directorio no existe"
}
