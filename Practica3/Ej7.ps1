[string]$pass = Read-Host "Introduce la contraseña"
$passok = "bobolon11"

If($pass -ieq $passok) {
    Write-Host "Contraseña correcta"
}
Else {
    Write-Host "Contraseña incorrecta"
}