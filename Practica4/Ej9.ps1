[string]$adivina = "contraseña" 
[string]$cad = ""

while ($cad -ne $adivina) {
    [string]$cad = Read-Host "Adivina la contraseña"

    Write-Host "Fallaste! Intentalo de nuevo"
}

Write-Host "Contraseña correcta!"