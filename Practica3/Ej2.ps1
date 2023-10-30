[int]$edad = Read-Host "¿Cuántos años tienes?"

If ($edad -gt 17) {
    Write-Host "Eeres mayor de edad"
}
Else {
    Write-Host "Eres menor de edad"
}